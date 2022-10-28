.PHONY: clean build publish publish-snapshot templates

generated_dir := src

clean:
	rm -rf ${generated_dir}

templates:
	cp .npmrc-template ${generated_dir}/.npmrc
	cp package-template.json ${generated_dir}/package.json

build: templates
	cd ${generated_dir}; \
	rm -rf "strmprivacy/internal_api"; \
	npm run authenticate; \
	npm version "${strmprivacy_api_version}" --allow-same-version --no-commit-hooks --no-git-tag-version; \
	npm install; \
	npm run dist

build-snapshot: templates
	cd ${generated_dir}; \
	rm -rf "strmprivacy/internal_api"; \
	npm run authenticate; \
	npm version "${strmprivacy_api_version}-$$CI_PIPELINE_ID"; \
	npm install; \
	npm run dist

publish: build
	cd ${generated_dir}; \
	npm run authenticate; \
	npm publish

publish-snapshot: build-snapshot
	cd ${generated_dir}; \
	npm run authenticate; \
	npm publish
