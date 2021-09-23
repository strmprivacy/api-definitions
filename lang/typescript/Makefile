.PHONY: clean build publish

build_dir := build
dist_dir := dist

clean:
	rm -rf ${build_dir}
	rm -rf ${dist_dir}

build:
	mkdir -p ${build_dir}
	mkdir -p ${dist_dir}
	protoc ${proto_files} ${common_proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
	 	--js_out=import_style=commonjs:${build_dir} \
		--grpc-web_out=import_style=commonjs+dts,mode=grpcwebtext:${build_dir}
	sed -i '' 's/\"version\"\: \".*\",/\"version\"\: \"${streammachine_api_version}\",/g' package.json
	npm install
	npm run dist

publish:

publish-local:
