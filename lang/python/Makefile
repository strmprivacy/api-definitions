.PHONY: clean build templates

top_level_package_name := strmprivacy
python_version_files := VERSION requirements.txt requirements-dev.txt
generated_dir := src

${generated_dir}/VERSION: ../../Makefile ../../VERSION.env
	. ./../../VERSION.env && echo "$$VERSION" > $@

${generated_dir}/requirements.txt: ../../Makefile
	echo "grpcio==${grpc_version}" > $@

${generated_dir}/requirements-dev.txt: ../../Makefile
	echo "grpcio-tools==${grpc_version}" > $@ && \
	echo "keyring" >> $@ && \
	echo "keyrings.google-artifactregistry-auth" >> $@ && \
	echo "twine" >> $@

${generated_dir}/setup.py:
	cp setup-template.py ${generated_dir}/setup.py

clean:
	rm -rf ${generated_dir}

templates: ${generated_dir} ${generated_dir}/setup.py ${generated_dir}/requirements.txt ${generated_dir}/requirements-dev.txt ${generated_dir}/VERSION

# Build depends on the existence of the lang/python/strmprivacy dir
build: templates
	cd ${generated_dir}; \
	python -m pip install -r requirements-dev.txt; \
	find ${top_level_package_name} -type d -exec touch "{}/__init__.py" \; ; \
	python setup.py sdist; \
	python setup.py bdist_wheel

build-public: templates
	cd ${generated_dir}; \
	rm -rf strmprivacy/internal_api; \
	python -m pip install -r requirements-dev.txt; \
	find ${top_level_package_name} -type d -exec touch "{}/__init__.py" \; ; \
	python setup.py sdist; \
	python setup.py bdist_wheel

publish-test: build
	twine upload --repository-url "https://europe-west4-python.pkg.dev/stream-machine-development/python-test/" ${generated_dir}/dist/*

publish: build
	twine upload --repository-url "https://europe-west4-python.pkg.dev/stream-machine-development/python/" ${generated_dir}/dist/*

publish-public-test: build-public
	twine upload --repository testpypi ${generated_dir}/dist/*

publish-public: build-public
	twine upload ${generated_dir}/dist/*

install: build ## install the package to the active Python's site-packages
	cd ${generated_dir}; python setup.py install
