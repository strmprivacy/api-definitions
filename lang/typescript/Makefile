.PHONY: clean generate build publish publish-snapshot

build_dir := build
dist_dir := dist

clean:
	rm -rf ${build_dir}
	rm -rf ${dist_dir}

generate:
	mkdir -p ${build_dir}
	mkdir -p ${dist_dir}
	echo ${proto_files}
	echo ${common_proto_files}
	protoc ${proto_files} ${common_proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
	 	--js_out=import_style=commonjs:${build_dir} \
		--grpc-web_out=import_style=commonjs+dts,mode=grpcwebtext:${build_dir}

build:
	npm run authenticate
	npm version "${streammachine_api_version}"
	npm install
	npm run dist

build-snapshot:
	npm run authenticate
	npm version "$$(npm run get-version --silent)-$$CI_PIPELINE_ID"
	npm install
	npm run dist

publish: build
	npm run authenticate
	npm publish

publish-snapshot: build-snapshot
	npm run authenticate
	npm publish