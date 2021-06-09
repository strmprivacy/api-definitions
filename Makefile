.PHONY: buf-breaking go clean mvn

proto_files := $(shell find protos -name *.proto)

buf-breaking:
	bash .buf-breaking.sh

go:
	${MAKE} -C protos clean go

clean:
	./gradlew clean
	make -C protos clean

mvn:
	./gradlew publishToMavenLocal
# vim:noexpandtab
