SHELL=/bin/bash -o pipefail

placeholder: 
	echo "Do not run make without any target!"
        

lib_base: prepull_lib_base
		@echo ===== start: lib_base =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/lib_base:16cb244422             -f dockerfiles/ClipperLibBaseDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag lib_base
	
		@echo ===== finished: lib_base =====
	
        

publish_lib_base: lib_base
		@echo ===== start: publish_lib_base =====
	
		(docker tag clippertesting/lib_base:16cb244422 clippertesting/lib_base:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_lib_base
	
		(docker push clippertesting/lib_base:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_lib_base
	
		@echo ===== finished: publish_lib_base =====
	
        

prepull_lib_base: 
		@echo ===== start: prepull_lib_base =====
	
		(docker pull clipper/lib_base:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_lib_base
	
		@echo ===== finished: prepull_lib_base =====
	
        

query_frontend: prepull_query_frontend lib_base
		@echo ===== start: query_frontend =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/query_frontend:16cb244422             -f dockerfiles/QueryFrontendDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag query_frontend
	
		@echo ===== finished: query_frontend =====
	
        

publish_query_frontend: query_frontend
		@echo ===== start: publish_query_frontend =====
	
		(docker tag clippertesting/query_frontend:16cb244422 clippertesting/query_frontend:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_query_frontend
	
		(docker push clippertesting/query_frontend:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_query_frontend
	
		@echo ===== finished: publish_query_frontend =====
	
        

prepull_query_frontend: 
		@echo ===== start: prepull_query_frontend =====
	
		(docker pull clipper/query_frontend:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_query_frontend
	
		@echo ===== finished: prepull_query_frontend =====
	
        

management_frontend: prepull_management_frontend lib_base
		@echo ===== start: management_frontend =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/management_frontend:16cb244422             -f dockerfiles/ManagementFrontendDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag management_frontend
	
		@echo ===== finished: management_frontend =====
	
        

publish_management_frontend: management_frontend
		@echo ===== start: publish_management_frontend =====
	
		(docker tag clippertesting/management_frontend:16cb244422 clippertesting/management_frontend:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_management_frontend
	
		(docker push clippertesting/management_frontend:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_management_frontend
	
		@echo ===== finished: publish_management_frontend =====
	
        

prepull_management_frontend: 
		@echo ===== start: prepull_management_frontend =====
	
		(docker pull clipper/management_frontend:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_management_frontend
	
		@echo ===== finished: prepull_management_frontend =====
	
        

dev: prepull_dev lib_base
		@echo ===== start: dev =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/dev:16cb244422             -f dockerfiles/ClipperDevDockerfile  /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag dev
	
		@echo ===== finished: dev =====
	
        

publish_dev: dev
		@echo ===== start: publish_dev =====
	
		(docker tag clippertesting/dev:16cb244422 clippertesting/dev:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_dev
	
		(docker push clippertesting/dev:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_dev
	
		@echo ===== finished: publish_dev =====
	
        

prepull_dev: 
		@echo ===== start: prepull_dev =====
	
		(docker pull clipper/dev:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_dev
	
		@echo ===== finished: prepull_dev =====
	
        

py35-dev: prepull_py35-dev lib_base
		@echo ===== start: py35-dev =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/py35-dev:16cb244422             -f dockerfiles/ClipperPy35DevDockerfile  /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag py35-dev
	
		@echo ===== finished: py35-dev =====
	
        

publish_py35-dev: py35-dev
		@echo ===== start: publish_py35-dev =====
	
		(docker tag clippertesting/py35-dev:16cb244422 clippertesting/py35-dev:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py35-dev
	
		(docker push clippertesting/py35-dev:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py35-dev
	
		@echo ===== finished: publish_py35-dev =====
	
        

prepull_py35-dev: 
		@echo ===== start: prepull_py35-dev =====
	
		(docker pull clipper/py35-dev:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_py35-dev
	
		@echo ===== finished: prepull_py35-dev =====
	
        

unittests: prepull_unittests dev
		@echo ===== start: unittests =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/unittests:16cb244422             -f dockerfiles/ClipperTestsDockerfile  /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag unittests
	
		@echo ===== finished: unittests =====
	
        

publish_unittests: unittests
		@echo ===== start: publish_unittests =====
	
		(docker tag clippertesting/unittests:16cb244422 clippertesting/unittests:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_unittests
	
		(docker push clippertesting/unittests:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_unittests
	
		@echo ===== finished: publish_unittests =====
	
        

prepull_unittests: 
		@echo ===== start: prepull_unittests =====
	
		(docker pull clipper/unittests:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_unittests
	
		@echo ===== finished: prepull_unittests =====
	
        

py35tests: prepull_py35tests py35-dev
		@echo ===== start: py35tests =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/py35tests:16cb244422             -f dockerfiles/ClipperPy35TestsDockerfile  /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag py35tests
	
		@echo ===== finished: py35tests =====
	
        

publish_py35tests: py35tests
		@echo ===== start: publish_py35tests =====
	
		(docker tag clippertesting/py35tests:16cb244422 clippertesting/py35tests:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py35tests
	
		(docker push clippertesting/py35tests:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py35tests
	
		@echo ===== finished: publish_py35tests =====
	
        

prepull_py35tests: 
		@echo ===== start: prepull_py35tests =====
	
		(docker pull clipper/py35tests:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_py35tests
	
		@echo ===== finished: prepull_py35tests =====
	
        

frontend-exporter: prepull_frontend-exporter
		@echo ===== start: frontend-exporter =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/frontend-exporter:16cb244422             -f dockerfiles/FrontendExporterDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag frontend-exporter
	
		@echo ===== finished: frontend-exporter =====
	
        

publish_frontend-exporter: frontend-exporter
		@echo ===== start: publish_frontend-exporter =====
	
		(docker tag clippertesting/frontend-exporter:16cb244422 clippertesting/frontend-exporter:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_frontend-exporter
	
		(docker push clippertesting/frontend-exporter:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_frontend-exporter
	
		@echo ===== finished: publish_frontend-exporter =====
	
        

prepull_frontend-exporter: 
		@echo ===== start: prepull_frontend-exporter =====
	
		(docker pull clipper/frontend-exporter:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_frontend-exporter
	
		@echo ===== finished: prepull_frontend-exporter =====
	
        

py-rpc: prepull_py-rpc
		@echo ===== start: py-rpc =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py             -t clippertesting/py-rpc:16cb244422             -f dockerfiles/Py2RPCDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag py-rpc
	
		@echo ===== finished: py-rpc =====
	
        

publish_py-rpc: py-rpc
		@echo ===== start: publish_py-rpc =====
	
		(docker tag clippertesting/py-rpc:16cb244422 clippertesting/py-rpc:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py-rpc
	
		(docker push clippertesting/py-rpc:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py-rpc
	
		@echo ===== finished: publish_py-rpc =====
	
        

prepull_py-rpc: 
		@echo ===== start: prepull_py-rpc =====
	
		(docker pull clipper/py-rpc:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_py-rpc
	
		@echo ===== finished: prepull_py-rpc =====
	
        

py35-rpc: prepull_py35-rpc
		@echo ===== start: py35-rpc =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py35             -t clippertesting/py35-rpc:16cb244422             -f dockerfiles/Py35RPCDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag py35-rpc
	
		@echo ===== finished: py35-rpc =====
	
        

publish_py35-rpc: py35-rpc
		@echo ===== start: publish_py35-rpc =====
	
		(docker tag clippertesting/py35-rpc:16cb244422 clippertesting/py35-rpc:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py35-rpc
	
		(docker push clippertesting/py35-rpc:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py35-rpc
	
		@echo ===== finished: publish_py35-rpc =====
	
        

prepull_py35-rpc: 
		@echo ===== start: prepull_py35-rpc =====
	
		(docker pull clipper/py35-rpc:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_py35-rpc
	
		@echo ===== finished: prepull_py35-rpc =====
	
        

py36-rpc: prepull_py36-rpc
		@echo ===== start: py36-rpc =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py36             -t clippertesting/py36-rpc:16cb244422             -f dockerfiles/Py36RPCDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag py36-rpc
	
		@echo ===== finished: py36-rpc =====
	
        

publish_py36-rpc: py36-rpc
		@echo ===== start: publish_py36-rpc =====
	
		(docker tag clippertesting/py36-rpc:16cb244422 clippertesting/py36-rpc:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py36-rpc
	
		(docker push clippertesting/py36-rpc:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_py36-rpc
	
		@echo ===== finished: publish_py36-rpc =====
	
        

prepull_py36-rpc: 
		@echo ===== start: prepull_py36-rpc =====
	
		(docker pull clipper/py36-rpc:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_py36-rpc
	
		@echo ===== finished: prepull_py36-rpc =====
	
        

sum-container: prepull_sum-container py-rpc
		@echo ===== start: sum-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/sum-container:16cb244422             -f dockerfiles/SumDockerfile  /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag sum-container
	
		@echo ===== finished: sum-container =====
	
        

publish_sum-container: sum-container
		@echo ===== start: publish_sum-container =====
	
		(docker tag clippertesting/sum-container:16cb244422 clippertesting/sum-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_sum-container
	
		(docker push clippertesting/sum-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_sum-container
	
		@echo ===== finished: publish_sum-container =====
	
        

prepull_sum-container: 
		@echo ===== start: prepull_sum-container =====
	
		(docker pull clipper/sum-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_sum-container
	
		@echo ===== finished: prepull_sum-container =====
	
        

noop-container: prepull_noop-container py-rpc
		@echo ===== start: noop-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting              -t clippertesting/noop-container:16cb244422             -f dockerfiles/NoopDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag noop-container
	
		@echo ===== finished: noop-container =====
	
        

publish_noop-container: noop-container
		@echo ===== start: publish_noop-container =====
	
		(docker tag clippertesting/noop-container:16cb244422 clippertesting/noop-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_noop-container
	
		(docker push clippertesting/noop-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_noop-container
	
		@echo ===== finished: publish_noop-container =====
	
        

prepull_noop-container: 
		@echo ===== start: prepull_noop-container =====
	
		(docker pull clipper/noop-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_noop-container
	
		@echo ===== finished: prepull_noop-container =====
	
        

mxnet-container: prepull_mxnet-container py-rpc
		@echo ===== start: mxnet-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py             -t clippertesting/mxnet-container:16cb244422             -f dockerfiles/MXNetContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag mxnet-container
	
		@echo ===== finished: mxnet-container =====
	
        

publish_mxnet-container: mxnet-container
		@echo ===== start: publish_mxnet-container =====
	
		(docker tag clippertesting/mxnet-container:16cb244422 clippertesting/mxnet-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_mxnet-container
	
		(docker push clippertesting/mxnet-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_mxnet-container
	
		@echo ===== finished: publish_mxnet-container =====
	
        

prepull_mxnet-container: 
		@echo ===== start: prepull_mxnet-container =====
	
		(docker pull clipper/mxnet-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_mxnet-container
	
		@echo ===== finished: prepull_mxnet-container =====
	
        

mxnet35-container: prepull_mxnet35-container py35-rpc
		@echo ===== start: mxnet35-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py35             -t clippertesting/mxnet35-container:16cb244422             -f dockerfiles/MXNetContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag mxnet35-container
	
		@echo ===== finished: mxnet35-container =====
	
        

publish_mxnet35-container: mxnet35-container
		@echo ===== start: publish_mxnet35-container =====
	
		(docker tag clippertesting/mxnet35-container:16cb244422 clippertesting/mxnet35-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_mxnet35-container
	
		(docker push clippertesting/mxnet35-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_mxnet35-container
	
		@echo ===== finished: publish_mxnet35-container =====
	
        

prepull_mxnet35-container: 
		@echo ===== start: prepull_mxnet35-container =====
	
		(docker pull clipper/mxnet35-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_mxnet35-container
	
		@echo ===== finished: prepull_mxnet35-container =====
	
        

mxnet36-container: prepull_mxnet36-container py36-rpc
		@echo ===== start: mxnet36-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py36             -t clippertesting/mxnet36-container:16cb244422             -f dockerfiles/MXNetContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag mxnet36-container
	
		@echo ===== finished: mxnet36-container =====
	
        

publish_mxnet36-container: mxnet36-container
		@echo ===== start: publish_mxnet36-container =====
	
		(docker tag clippertesting/mxnet36-container:16cb244422 clippertesting/mxnet36-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_mxnet36-container
	
		(docker push clippertesting/mxnet36-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_mxnet36-container
	
		@echo ===== finished: publish_mxnet36-container =====
	
        

prepull_mxnet36-container: 
		@echo ===== start: prepull_mxnet36-container =====
	
		(docker pull clipper/mxnet36-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_mxnet36-container
	
		@echo ===== finished: prepull_mxnet36-container =====
	
        

pytorch-container: prepull_pytorch-container py-rpc
		@echo ===== start: pytorch-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py             -t clippertesting/pytorch-container:16cb244422             -f dockerfiles/PyTorchContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag pytorch-container
	
		@echo ===== finished: pytorch-container =====
	
        

publish_pytorch-container: pytorch-container
		@echo ===== start: publish_pytorch-container =====
	
		(docker tag clippertesting/pytorch-container:16cb244422 clippertesting/pytorch-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pytorch-container
	
		(docker push clippertesting/pytorch-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pytorch-container
	
		@echo ===== finished: publish_pytorch-container =====
	
        

prepull_pytorch-container: 
		@echo ===== start: prepull_pytorch-container =====
	
		(docker pull clipper/pytorch-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_pytorch-container
	
		@echo ===== finished: prepull_pytorch-container =====
	
        

pytorch35-container: prepull_pytorch35-container py35-rpc
		@echo ===== start: pytorch35-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py35             -t clippertesting/pytorch35-container:16cb244422             -f dockerfiles/PyTorchContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag pytorch35-container
	
		@echo ===== finished: pytorch35-container =====
	
        

publish_pytorch35-container: pytorch35-container
		@echo ===== start: publish_pytorch35-container =====
	
		(docker tag clippertesting/pytorch35-container:16cb244422 clippertesting/pytorch35-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pytorch35-container
	
		(docker push clippertesting/pytorch35-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pytorch35-container
	
		@echo ===== finished: publish_pytorch35-container =====
	
        

prepull_pytorch35-container: 
		@echo ===== start: prepull_pytorch35-container =====
	
		(docker pull clipper/pytorch35-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_pytorch35-container
	
		@echo ===== finished: prepull_pytorch35-container =====
	
        

pytorch36-container: prepull_pytorch36-container py36-rpc
		@echo ===== start: pytorch36-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py36             -t clippertesting/pytorch36-container:16cb244422             -f dockerfiles/PyTorchContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag pytorch36-container
	
		@echo ===== finished: pytorch36-container =====
	
        

publish_pytorch36-container: pytorch36-container
		@echo ===== start: publish_pytorch36-container =====
	
		(docker tag clippertesting/pytorch36-container:16cb244422 clippertesting/pytorch36-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pytorch36-container
	
		(docker push clippertesting/pytorch36-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pytorch36-container
	
		@echo ===== finished: publish_pytorch36-container =====
	
        

prepull_pytorch36-container: 
		@echo ===== start: prepull_pytorch36-container =====
	
		(docker pull clipper/pytorch36-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_pytorch36-container
	
		@echo ===== finished: prepull_pytorch36-container =====
	
        

tf-container: prepull_tf-container py-rpc
		@echo ===== start: tf-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py             -t clippertesting/tf-container:16cb244422             -f dockerfiles/TensorFlowDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag tf-container
	
		@echo ===== finished: tf-container =====
	
        

publish_tf-container: tf-container
		@echo ===== start: publish_tf-container =====
	
		(docker tag clippertesting/tf-container:16cb244422 clippertesting/tf-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_tf-container
	
		(docker push clippertesting/tf-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_tf-container
	
		@echo ===== finished: publish_tf-container =====
	
        

prepull_tf-container: 
		@echo ===== start: prepull_tf-container =====
	
		(docker pull clipper/tf-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_tf-container
	
		@echo ===== finished: prepull_tf-container =====
	
        

tf35-container: prepull_tf35-container py35-rpc
		@echo ===== start: tf35-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py35             -t clippertesting/tf35-container:16cb244422             -f dockerfiles/TensorFlowDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag tf35-container
	
		@echo ===== finished: tf35-container =====
	
        

publish_tf35-container: tf35-container
		@echo ===== start: publish_tf35-container =====
	
		(docker tag clippertesting/tf35-container:16cb244422 clippertesting/tf35-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_tf35-container
	
		(docker push clippertesting/tf35-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_tf35-container
	
		@echo ===== finished: publish_tf35-container =====
	
        

prepull_tf35-container: 
		@echo ===== start: prepull_tf35-container =====
	
		(docker pull clipper/tf35-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_tf35-container
	
		@echo ===== finished: prepull_tf35-container =====
	
        

tf36-container: prepull_tf36-container py36-rpc
		@echo ===== start: tf36-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py36             -t clippertesting/tf36-container:16cb244422             -f dockerfiles/TensorFlowDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag tf36-container
	
		@echo ===== finished: tf36-container =====
	
        

publish_tf36-container: tf36-container
		@echo ===== start: publish_tf36-container =====
	
		(docker tag clippertesting/tf36-container:16cb244422 clippertesting/tf36-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_tf36-container
	
		(docker push clippertesting/tf36-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_tf36-container
	
		@echo ===== finished: publish_tf36-container =====
	
        

prepull_tf36-container: 
		@echo ===== start: prepull_tf36-container =====
	
		(docker pull clipper/tf36-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_tf36-container
	
		@echo ===== finished: prepull_tf36-container =====
	
        

pyspark-container: prepull_pyspark-container py-rpc
		@echo ===== start: pyspark-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py             -t clippertesting/pyspark-container:16cb244422             -f dockerfiles/PySparkContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag pyspark-container
	
		@echo ===== finished: pyspark-container =====
	
        

publish_pyspark-container: pyspark-container
		@echo ===== start: publish_pyspark-container =====
	
		(docker tag clippertesting/pyspark-container:16cb244422 clippertesting/pyspark-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pyspark-container
	
		(docker push clippertesting/pyspark-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pyspark-container
	
		@echo ===== finished: publish_pyspark-container =====
	
        

prepull_pyspark-container: 
		@echo ===== start: prepull_pyspark-container =====
	
		(docker pull clipper/pyspark-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_pyspark-container
	
		@echo ===== finished: prepull_pyspark-container =====
	
        

pyspark35-container: prepull_pyspark35-container py35-rpc
		@echo ===== start: pyspark35-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py35             -t clippertesting/pyspark35-container:16cb244422             -f dockerfiles/PySparkContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag pyspark35-container
	
		@echo ===== finished: pyspark35-container =====
	
        

publish_pyspark35-container: pyspark35-container
		@echo ===== start: publish_pyspark35-container =====
	
		(docker tag clippertesting/pyspark35-container:16cb244422 clippertesting/pyspark35-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pyspark35-container
	
		(docker push clippertesting/pyspark35-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pyspark35-container
	
		@echo ===== finished: publish_pyspark35-container =====
	
        

prepull_pyspark35-container: 
		@echo ===== start: prepull_pyspark35-container =====
	
		(docker pull clipper/pyspark35-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_pyspark35-container
	
		@echo ===== finished: prepull_pyspark35-container =====
	
        

pyspark36-container: prepull_pyspark36-container py36-rpc
		@echo ===== start: pyspark36-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py36             -t clippertesting/pyspark36-container:16cb244422             -f dockerfiles/PySparkContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag pyspark36-container
	
		@echo ===== finished: pyspark36-container =====
	
        

publish_pyspark36-container: pyspark36-container
		@echo ===== start: publish_pyspark36-container =====
	
		(docker tag clippertesting/pyspark36-container:16cb244422 clippertesting/pyspark36-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pyspark36-container
	
		(docker push clippertesting/pyspark36-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_pyspark36-container
	
		@echo ===== finished: publish_pyspark36-container =====
	
        

prepull_pyspark36-container: 
		@echo ===== start: prepull_pyspark36-container =====
	
		(docker pull clipper/pyspark36-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_pyspark36-container
	
		@echo ===== finished: prepull_pyspark36-container =====
	
        

python-closure-container: prepull_python-closure-container py-rpc
		@echo ===== start: python-closure-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py             -t clippertesting/python-closure-container:16cb244422             -f dockerfiles/PyClosureContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag python-closure-container
	
		@echo ===== finished: python-closure-container =====
	
        

publish_python-closure-container: python-closure-container
		@echo ===== start: publish_python-closure-container =====
	
		(docker tag clippertesting/python-closure-container:16cb244422 clippertesting/python-closure-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_python-closure-container
	
		(docker push clippertesting/python-closure-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_python-closure-container
	
		@echo ===== finished: publish_python-closure-container =====
	
        

prepull_python-closure-container: 
		@echo ===== start: prepull_python-closure-container =====
	
		(docker pull clipper/python-closure-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_python-closure-container
	
		@echo ===== finished: prepull_python-closure-container =====
	
        

python35-closure-container: prepull_python35-closure-container py35-rpc
		@echo ===== start: python35-closure-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py35             -t clippertesting/python35-closure-container:16cb244422             -f dockerfiles/PyClosureContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag python35-closure-container
	
		@echo ===== finished: python35-closure-container =====
	
        

publish_python35-closure-container: python35-closure-container
		@echo ===== start: publish_python35-closure-container =====
	
		(docker tag clippertesting/python35-closure-container:16cb244422 clippertesting/python35-closure-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_python35-closure-container
	
		(docker push clippertesting/python35-closure-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_python35-closure-container
	
		@echo ===== finished: publish_python35-closure-container =====
	
        

prepull_python35-closure-container: 
		@echo ===== start: prepull_python35-closure-container =====
	
		(docker pull clipper/python35-closure-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_python35-closure-container
	
		@echo ===== finished: prepull_python35-closure-container =====
	
        

python36-closure-container: prepull_python36-closure-container py36-rpc
		@echo ===== start: python36-closure-container =====
	
		(docker build --build-arg CODE_VERSION=16cb244422             --build-arg REGISTRY=clippertesting --build-arg RPC_VERSION=py36             -t clippertesting/python36-closure-container:16cb244422             -f dockerfiles/PyClosureContainerDockerfile /home/jenkins/workspace/Clipper-PRB ) 2>&1 | python3 ./bin/colorize_output.py --tag python36-closure-container
	
		@echo ===== finished: python36-closure-container =====
	
        

publish_python36-closure-container: python36-closure-container
		@echo ===== start: publish_python36-closure-container =====
	
		(docker tag clippertesting/python36-closure-container:16cb244422 clippertesting/python36-closure-container:develop) 2>&1 | python3 ./bin/colorize_output.py --tag publish_python36-closure-container
	
		(docker push clippertesting/python36-closure-container:16cb244422) 2>&1 | python3 ./bin/colorize_output.py --tag publish_python36-closure-container
	
		@echo ===== finished: publish_python36-closure-container =====
	
        

prepull_python36-closure-container: 
		@echo ===== start: prepull_python36-closure-container =====
	
		(docker pull clipper/python36-closure-container:develop || true) 2>&1 | python3 ./bin/colorize_output.py --tag prepull_python36-closure-container
	
		@echo ===== finished: prepull_python36-closure-container =====
	
        

kubernetes_test_containers: query_frontend publish_query_frontend management_frontend publish_management_frontend frontend-exporter publish_frontend-exporter noop-container publish_noop-container python-closure-container publish_python-closure-container
	
        

wait_query_frontend: 
	until docker pull clippertesting/query_frontend:16cb244422; do sleep 5; done
        

travis_re_tag_query_frontend: wait_query_frontend
	docker tag clippertesting/query_frontend:16cb244422 localhost:5000/query_frontend:16cb244422
        

travis_re_push_query_frontend: travis_re_tag_query_frontend
	docker push localhost:5000/query_frontend:16cb244422
        

wait_management_frontend: 
	until docker pull clippertesting/management_frontend:16cb244422; do sleep 5; done
        

travis_re_tag_management_frontend: wait_management_frontend
	docker tag clippertesting/management_frontend:16cb244422 localhost:5000/management_frontend:16cb244422
        

travis_re_push_management_frontend: travis_re_tag_management_frontend
	docker push localhost:5000/management_frontend:16cb244422
        

wait_frontend-exporter: 
	until docker pull clippertesting/frontend-exporter:16cb244422; do sleep 5; done
        

travis_re_tag_frontend-exporter: wait_frontend-exporter
	docker tag clippertesting/frontend-exporter:16cb244422 localhost:5000/frontend-exporter:16cb244422
        

travis_re_push_frontend-exporter: travis_re_tag_frontend-exporter
	docker push localhost:5000/frontend-exporter:16cb244422
        

wait_noop-container: 
	until docker pull clippertesting/noop-container:16cb244422; do sleep 5; done
        

travis_re_tag_noop-container: wait_noop-container
	docker tag clippertesting/noop-container:16cb244422 localhost:5000/noop-container:16cb244422
        

travis_re_push_noop-container: travis_re_tag_noop-container
	docker push localhost:5000/noop-container:16cb244422
        

wait_python-closure-container: 
	until docker pull clippertesting/python-closure-container:16cb244422; do sleep 5; done
        

travis_re_tag_python-closure-container: wait_python-closure-container
	docker tag clippertesting/python-closure-container:16cb244422 localhost:5000/python-closure-container:16cb244422
        

travis_re_push_python-closure-container: travis_re_tag_python-closure-container
	docker push localhost:5000/python-closure-container:16cb244422
        

all: lib_base publish_lib_base prepull_lib_base query_frontend publish_query_frontend prepull_query_frontend management_frontend publish_management_frontend prepull_management_frontend dev publish_dev prepull_dev py35-dev publish_py35-dev prepull_py35-dev unittests publish_unittests prepull_unittests py35tests publish_py35tests prepull_py35tests frontend-exporter publish_frontend-exporter prepull_frontend-exporter py-rpc publish_py-rpc prepull_py-rpc py35-rpc publish_py35-rpc prepull_py35-rpc py36-rpc publish_py36-rpc prepull_py36-rpc sum-container publish_sum-container prepull_sum-container noop-container publish_noop-container prepull_noop-container mxnet-container publish_mxnet-container prepull_mxnet-container mxnet35-container publish_mxnet35-container prepull_mxnet35-container mxnet36-container publish_mxnet36-container prepull_mxnet36-container pytorch-container publish_pytorch-container prepull_pytorch-container pytorch35-container publish_pytorch35-container prepull_pytorch35-container pytorch36-container publish_pytorch36-container prepull_pytorch36-container tf-container publish_tf-container prepull_tf-container tf35-container publish_tf35-container prepull_tf35-container tf36-container publish_tf36-container prepull_tf36-container pyspark-container publish_pyspark-container prepull_pyspark-container pyspark35-container publish_pyspark35-container prepull_pyspark35-container pyspark36-container publish_pyspark36-container prepull_pyspark36-container python-closure-container publish_python-closure-container prepull_python-closure-container python35-closure-container publish_python35-closure-container prepull_python35-closure-container python36-closure-container publish_python36-closure-container prepull_python36-closure-container


build: lib_base query_frontend management_frontend dev py35-dev unittests py35tests frontend-exporter py-rpc py35-rpc py36-rpc sum-container noop-container mxnet-container mxnet35-container mxnet36-container pytorch-container pytorch35-container pytorch36-container tf-container tf35-container tf36-container pyspark-container pyspark35-container pyspark36-container python-closure-container python35-closure-container python36-closure-container


push: publish_lib_base publish_query_frontend publish_management_frontend publish_dev publish_py35-dev publish_unittests publish_py35tests publish_frontend-exporter publish_py-rpc publish_py35-rpc publish_py36-rpc publish_sum-container publish_noop-container publish_mxnet-container publish_mxnet35-container publish_mxnet36-container publish_pytorch-container publish_pytorch35-container publish_pytorch36-container publish_tf-container publish_tf35-container publish_tf36-container publish_pyspark-container publish_pyspark35-container publish_pyspark36-container publish_python-closure-container publish_python35-closure-container publish_python36-closure-container


prepull: prepull_lib_base prepull_query_frontend prepull_management_frontend prepull_dev prepull_py35-dev prepull_unittests prepull_py35tests prepull_frontend-exporter prepull_py-rpc prepull_py35-rpc prepull_py36-rpc prepull_sum-container prepull_noop-container prepull_mxnet-container prepull_mxnet35-container prepull_mxnet36-container prepull_pytorch-container prepull_pytorch35-container prepull_pytorch36-container prepull_tf-container prepull_tf35-container prepull_tf36-container prepull_pyspark-container prepull_pyspark35-container prepull_pyspark36-container prepull_python-closure-container prepull_python35-closure-container prepull_python36-closure-container


wait_for_kubernetes_test_containers: wait_query_frontend wait_management_frontend wait_frontend-exporter wait_noop-container wait_python-closure-container


retag_kubernetes_test_containers: travis_re_tag_query_frontend travis_re_tag_management_frontend travis_re_tag_frontend-exporter travis_re_tag_noop-container travis_re_tag_python-closure-container


repush_kubernetes_test_containers: travis_re_push_query_frontend travis_re_push_management_frontend travis_re_push_frontend-exporter travis_re_push_noop-container travis_re_push_python-closure-container

