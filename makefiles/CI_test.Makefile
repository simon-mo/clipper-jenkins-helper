SHELL=/bin/bash -o pipefail

placeholder: 
	echo "Do not run make without any target!"
        

unittest_libclipper: 
		@echo ===== start: unittest_libclipper =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "/clipper/bin/run_unittests.sh --libclipper")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag unittest_libclipper
	
		@echo ===== finished: unittest_libclipper =====
	
        

unittest_management: 
		@echo ===== start: unittest_management =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "/clipper/bin/run_unittests.sh --management")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag unittest_management
	
		@echo ===== finished: unittest_management =====
	
        

unittest_frontend: 
		@echo ===== start: unittest_frontend =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "/clipper/bin/run_unittests.sh --frontend")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag unittest_frontend
	
		@echo ===== finished: unittest_frontend =====
	
        

unittest_rpc_container: 
		@echo ===== start: unittest_rpc_container =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "/clipper/bin/run_unittests.sh --rpc-container")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag unittest_rpc_container
	
		@echo ===== finished: unittest_rpc_container =====
	
        

integration_py2_admin_unit_test: 
		@echo ===== start: integration_py2_admin_unit_test =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/clipper_admin_tests.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_admin_unit_test
	
		@echo ===== finished: integration_py2_admin_unit_test =====
	
        

integration_py3_admin_unit_test: 
		@echo ===== start: integration_py3_admin_unit_test =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/clipper_admin_tests.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_admin_unit_test
	
		@echo ===== finished: integration_py3_admin_unit_test =====
	
        

integration_py2_many_apps_many_models: 
		@echo ===== start: integration_py2_many_apps_many_models =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/many_apps_many_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_many_apps_many_models
	
		@echo ===== finished: integration_py2_many_apps_many_models =====
	
        

integration_py3_many_apps_many_models: 
		@echo ===== start: integration_py3_many_apps_many_models =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/many_apps_many_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_many_apps_many_models
	
		@echo ===== finished: integration_py3_many_apps_many_models =====
	
        

integration_py2_pyspark: 
		@echo ===== start: integration_py2_pyspark =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/deploy_pyspark_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_pyspark
	
		@echo ===== finished: integration_py2_pyspark =====
	
        

integration_py3_pyspark: 
		@echo ===== start: integration_py3_pyspark =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/deploy_pyspark_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_pyspark
	
		@echo ===== finished: integration_py3_pyspark =====
	
        

integration_py2_pyspark_pipeline: 
		@echo ===== start: integration_py2_pyspark_pipeline =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/deploy_pyspark_pipeline_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_pyspark_pipeline
	
		@echo ===== finished: integration_py2_pyspark_pipeline =====
	
        

integration_py3_pyspark_pipeline: 
		@echo ===== start: integration_py3_pyspark_pipeline =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/deploy_pyspark_pipeline_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_pyspark_pipeline
	
		@echo ===== finished: integration_py3_pyspark_pipeline =====
	
        

integration_py2_pysparkml: 
		@echo ===== start: integration_py2_pysparkml =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/deploy_pyspark_sparkml_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_pysparkml
	
		@echo ===== finished: integration_py2_pysparkml =====
	
        

integration_py3_pysparkml: 
		@echo ===== start: integration_py3_pysparkml =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/deploy_pyspark_sparkml_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_pysparkml
	
		@echo ===== finished: integration_py3_pysparkml =====
	
        

integration_py2_tensorflow: 
		@echo ===== start: integration_py2_tensorflow =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/deploy_tensorflow_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_tensorflow
	
		@echo ===== finished: integration_py2_tensorflow =====
	
        

integration_py3_tensorflow: 
		@echo ===== start: integration_py3_tensorflow =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/deploy_tensorflow_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_tensorflow
	
		@echo ===== finished: integration_py3_tensorflow =====
	
        

integration_py2_mxnet: 
		@echo ===== start: integration_py2_mxnet =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/deploy_mxnet_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_mxnet
	
		@echo ===== finished: integration_py2_mxnet =====
	
        

integration_py3_mxnet: 
		@echo ===== start: integration_py3_mxnet =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/deploy_mxnet_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_mxnet
	
		@echo ===== finished: integration_py3_mxnet =====
	
        

integration_py2_pytorch: 
		@echo ===== start: integration_py2_pytorch =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/deploy_pytorch_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_pytorch
	
		@echo ===== finished: integration_py2_pytorch =====
	
        

integration_py3_pytorch: 
		@echo ===== start: integration_py3_pytorch =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/deploy_pytorch_models.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_pytorch
	
		@echo ===== finished: integration_py3_pytorch =====
	
        

integration_py2_multi_tenancy: 
		@echo ===== start: integration_py2_multi_tenancy =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/multi_tenancy_test.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_multi_tenancy
	
		@echo ===== finished: integration_py2_multi_tenancy =====
	
        

integration_py3_multi_tenancy: 
		@echo ===== start: integration_py3_multi_tenancy =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/multi_tenancy_test.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_multi_tenancy
	
		@echo ===== finished: integration_py3_multi_tenancy =====
	
        

integration_py2_docker_metric: 
		@echo ===== start: integration_py2_docker_metric =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/unittests:16cb244422         "python /clipper/integration-tests/clipper_metric_docker.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py2_docker_metric
	
		@echo ===== finished: integration_py2_docker_metric =====
	
        

integration_py3_docker_metric: 
		@echo ===== start: integration_py3_docker_metric =====
	
		(    for i in {1..2}; do      (docker run --rm --network=host -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp         -e CLIPPER_REGISTRY=clippertesting         -e CLIPPER_TESTING_DOCKERHUB_PASSWORD=$CLIPPER_TESTING_DOCKERHUB_PASSWORD         clippertesting/py35tests:16cb244422         "python /clipper/integration-tests/clipper_metric_docker.py")     && break || echo "failed at try $i, retrying";      if [ "$i" -eq "2" ];          then exit 1; fi;     done) 2>&1 | python3 ./bin/colorize_output.py --tag integration_py3_docker_metric
	
		@echo ===== finished: integration_py3_docker_metric =====
	
        

all: unittest_libclipper unittest_management unittest_frontend unittest_rpc_container integration_py2_admin_unit_test integration_py3_admin_unit_test integration_py2_many_apps_many_models integration_py3_many_apps_many_models integration_py2_pyspark integration_py3_pyspark integration_py2_pyspark_pipeline integration_py3_pyspark_pipeline integration_py2_pysparkml integration_py3_pysparkml integration_py2_tensorflow integration_py3_tensorflow integration_py2_mxnet integration_py3_mxnet integration_py2_pytorch integration_py3_pytorch integration_py2_multi_tenancy integration_py3_multi_tenancy integration_py2_docker_metric integration_py3_docker_metric


unittest: unittest_libclipper unittest_management unittest_frontend unittest_rpc_container


integration: integration_py2_admin_unit_test integration_py3_admin_unit_test integration_py2_many_apps_many_models integration_py3_many_apps_many_models integration_py2_pyspark integration_py3_pyspark integration_py2_pyspark_pipeline integration_py3_pyspark_pipeline integration_py2_pysparkml integration_py3_pysparkml integration_py2_tensorflow integration_py3_tensorflow integration_py2_mxnet integration_py3_mxnet integration_py2_pytorch integration_py3_pytorch integration_py2_multi_tenancy integration_py3_multi_tenancy integration_py2_docker_metric integration_py3_docker_metric

