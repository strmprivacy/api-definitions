.PHONY: clean development build banaan

build_dir := build
python_version_files := VERSION requirements.txt requirements-dev.txt

VERSION: ../../Makefile
	GIT_BRANCH="$${CI_COMMIT_REF_NAME:-${git_branch}}" && \
	if [ -n "$$CI_COMMIT_TAG" ] || [ "$$GIT_BRANCH" = "master" ]; then echo ${streammachine_api_version} > $@; else echo "${streammachine_api_version}-${git_sha}" > $@; fi

requirements.txt: ../../Makefile
	echo "grpcio==${grpc_version}" > $@

requirements-dev.txt: ../../Makefile
	echo "grpcio-tools==${grpc_version}" > $@ && \
	echo "keyring" >> $@ && \
	echo "keyrings.google-artifactregistry-auth" >> $@ && \
	echo "twine" >> $@

clean: clean-build clean-pyc

clean-build:
	rm -f ${python_version_files}
	rm -fr ${build_dir}
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

development: ${python_version_files}
	python -m pip install -r requirements-dev.txt

build: clean development
	mkdir ${build_dir} && \
	python -m grpc_tools.protoc ${proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--python_out=${build_dir} \
		--grpc_python_out=${build_dir} && \
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist

publish-test: build
	twine upload --repository-url "https://europe-west4-python.pkg.dev/stream-machine-development/python-test/" dist/*

publish: build
	twine upload --repository-url "https://europe-west4-python.pkg.dev/stream-machine-development/python/" dist/*

install: clean build ## install the package to the active Python's site-packages
	python setup.py install
