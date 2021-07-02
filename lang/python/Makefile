.PHONY: clean requirements build

build_dir := build

clean:
	rm -rf ${build_dir}

requirements:
	pip install -r requirements.txt

build: requirements clean
	mkdir ${build_dir} && \
	python -m grpc_tools.protoc ${proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--python_out=${build_dir} \
		--grpc_python_out=${build_dir}
