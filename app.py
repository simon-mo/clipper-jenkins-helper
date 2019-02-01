import asyncio
import logging
import os
import re
import tempfile
from collections import defaultdict
from functools import total_ordering

import jinja2
import requests
import uvicorn
from starlette.applications import Starlette
from starlette.requests import Request
from starlette.responses import FileResponse, HTMLResponse, JSONResponse, Response

app = Starlette()

regexs = {
    "log_line": re.compile(r"^ \[([\w-]+)\]", re.MULTILINE),
    "finished_sign": re.compile(r"===== finished: ([\w-]+) =====", re.MULTILINE),
    "dot_vertex": re.compile(r'label="([\w-]+)"'),
    "makefile_targets": re.compile(r"^([\w-]+):", re.MULTILINE),
    "target_failed": re.compile(r"CI_[\w]+\.Makefile:[\d]+: recipe for target '([\w-]+)' failed", re.MULTILINE)
}

with open("makefiles/CI_build.Makefile") as build, open(
    "makefiles/CI_test.Makefile"
) as test:
    makefiles = {"build": build.read(), "test": test.read()}

targets = {
    "build": set(regexs["makefile_targets"].findall(makefiles["build"])),
    "test": set(regexs["makefile_targets"].findall(makefiles["test"])),
}


async def call(cmd):
    proc = await asyncio.create_subprocess_shell(cmd, stdout=asyncio.subprocess.PIPE)
    stdout, _ = await proc.communicate()
    return stdout


def extract_orange_targets(blob):
    colorized = set(regexs["log_line"].findall(blob))
    return colorized


def extract_green_targets(blob):
    finished_marked = set(regexs["finished_sign"].findall(blob))
    return finished_marked


async def generate_svg(makefile_str, green_targets, orange_targets):
    with tempfile.NamedTemporaryFile("w", delete=True) as f:
        f.write(makefile_str)
        f.flush()
        dot = await call(f"make -Bnd -f {f.name} all | ./bin/make2graph")
        dot = dot.decode()
        dot = dot.split("\n")
        dot.insert(1, '  size="12,40";')
        dot.insert(1, '  rankdir="LR";')

        node_for_all_targets = [l for l in dot if re.search('label="all"', l)][0].split(
            "["
        )[0]
        dot = [
            l for l in dot if node_for_all_targets + "[" not in l
        ]  # remove node declaration
        dot = [
            l for l in dot if "-> " + node_for_all_targets + " ;" not in l
        ]  # remove node declaration

        new_dot = []
        for l in dot:
            if regexs["dot_vertex"].search(l):
                tag = regexs["dot_vertex"].findall(l)[0]

                if tag in green_targets:
                    new_dot.append(l.replace("red", "green"))
                    continue

                if tag in orange_targets:
                    new_dot.append(l.replace("red", "orange"))
                    continue

            new_dot.append(l)

        dot = "\n".join(new_dot)
    with tempfile.NamedTemporaryFile("w", delete=True) as f:
        f.write(dot)
        f.flush()
        svg = await call(f"cat {f.name} | dot -Tsvg")
        return svg


@app.route("/", methods=["POST", "GET"])
async def homepage(request: Request):
    if request.method == "POST":
        form = await request.form()
        jenkins_url = f"https://amplab.cs.berkeley.edu/jenkins/job/Clipper-PRB/{form['build_id']}/consoleText"
        if form["routing"] == "dag":
            return await svg_gen(jenkins_url, form["stage"])
        elif form["routing"] == "logs":
            return await logs_render(jenkins_url, form["stage"])
    return FileResponse("index.html")


@app.route("/logs/{stage}/{id}")
async def get_log_page(request: Request):
    jenkins_id = request.path_params["id"]
    stage = request.path_params["stage"]
    jenkins_url = f"https://amplab.cs.berkeley.edu/jenkins/job/Clipper-PRB/{jenkins_id}/consoleText"
    return await logs_render(jenkins_url, stage)

@app.route("/api/get_failed_logs/{id}")
async def get_failed_logs(request: Request):
    jenkins_id = request.path_params['id']
    jenkins_url = f"https://amplab.cs.berkeley.edu/jenkins/job/Clipper-PRB/{jenkins_id}/consoleText"
    text = requests.get(jenkins_url).text
    logs = parse_logs(text)
    failed_log = [l for l in logs if l.failed]

    with open("failed_log.html") as f:
        rendered = jinja2.Template(f.read()).render(logs=failed_log)
    return HTMLResponse(rendered)

def get_makefile(stage):
    return makefiles[stage]


async def svg_gen(jenkins_url, stage):
    logging.info("Translating %s", jenkins_url)
    text = requests.get(jenkins_url).text
    svg = await generate_svg(
        get_makefile(stage), extract_green_targets(text), extract_orange_targets(text)
    )
    return Response(svg, media_type="image/svg+xml")

@total_ordering
class LogEntry:
    def __init__(self, title, lines, failed=False):
        self.title = title
        self.lines = lines
        self.failed = failed
    def __eq__(self, value):
        return self.title == value.title

    def __lt__(self, value):
        if self.failed and not value.failed:
            return True
        elif not self.failed and value.failed:
            return False
        else:
            return self.title < value.title


def parse_logs(text):
    log_tag = re.compile("^ \[([\w-]+)\]", re.MULTILINE)
    all_log_tags = set(log_tag.findall(text))
    all_log_tags_re = re.compile("(" + "|".join(all_log_tags) + ")")

    tmp_collection = defaultdict(list)
    for l in text.split("\n"):
        found = all_log_tags_re.findall(l)
        if len(found):
            tmp_collection[found[0]].append(l)

    failed_entries = set(regexs['target_failed'].findall(text))
    lst = [LogEntry(t, lines) for t, lines in tmp_collection.items()]
    for item in lst:
        if item.title in failed_entries:
            item.failed = True
            print(item)
    return lst


async def logs_render(jenkins_url, stage):
    logging.info("Translating %s", jenkins_url)
    text = requests.get(jenkins_url).text
    logs = parse_logs(text)
    logs = list(filter(lambda l: l.title in targets[stage], logs))
    logs = sorted(logs)
    with open("logs.html") as f:
        rendered = jinja2.Template(f.read()).render(logs=logs)
    return HTMLResponse(rendered)


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000, debug=True)
