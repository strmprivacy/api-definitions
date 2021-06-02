.PHONY: buf-breaking

proto_files := $(shell find protos -name *.proto)

buf-breaking:
	bash .buf-breaking.sh

go:
	${MAKE} -C protos go


# vim:noexpandtab
