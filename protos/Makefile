SHELL := bash
.PHONY: go clean

proto_files := $(shell find . -name *.proto )

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

go:
	${mkfile_dir}/make-go-modules.sh ${mkfile_dir} ${proto_files}

clean:
	rm -rf build/*




# vim:noexpandtab

