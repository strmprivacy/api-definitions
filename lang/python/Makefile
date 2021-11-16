.PHONY: clean development build banaan

top_level_package_name := strmprivacy
python_version_files := VERSION requirements.txt requirements-dev.txt

VERSION: ../../Makefile ../../VERSION.env
	. ./../../VERSION.env && echo "$$VERSION" > $@

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
	rm -fr ${top_level_package_name}
	rm -fr dist/
	rm -fr build/
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

generate: clean development
		python -m grpc_tools.protoc ${proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--python_out=. \
		--grpc_python_out=. && \
	find ${top_level_package_name} -type d -exec touch "{}/__init__.py" \;

generate-public: clean development
		python -m grpc_tools.protoc ${public_proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--python_out=. \
		--grpc_python_out=. && \
	find ${top_level_package_name} -type d -exec touch "{}/__init__.py" \;

build:
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist

publish-test: generate build
	twine upload --repository-url "https://europe-west4-python.pkg.dev/stream-machine-development/python-test/" dist/*

publish: generate build
	twine upload --repository-url "https://europe-west4-python.pkg.dev/stream-machine-development/python/" dist/*

publish-public-test: generate-public build
	twine upload --repository testpypi dist/*

publish-public: generate-public build
	twine upload dist/*

install: generate build ## install the package to the active Python's site-packages
	python setup.py install
