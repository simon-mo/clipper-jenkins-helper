all: pip bin/makefile2graph

.PHONY: pip
pip:
	pip install -r requirements.txt

bin/makefile2graph:
	rm -rf bin; mkdir bin
	git clone https://github.com/lindenb/makefile2graph.git
	cd makefile2graph; make; cp make2graph ../bin/
	rm -rf makefile2graph
	ls bin

format:
	isort -i *
	black .