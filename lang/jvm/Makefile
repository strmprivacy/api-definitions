.PHONY: clean build publish

clean:
	rm -f gradle.properties && \
	rm -rf build

gradle.properties: ../../Makefile
	cat gradle-template.properties > $@ && \
	echo "version = ${streammachine_api_version}" >> $@ && \
	echo "googleCommonProtosVersion = ${google_common_protos_version}" >> $@ && \
	echo "protobufVersion = ${protobuf_version}" >> $@ && \
	echo "grpcVersion = ${grpc_version}" >> $@

build: gradle.properties
	./gradlew build

publish: gradle.properties
	./gradlew publish

publish-local: gradle.properties
	./gradlew publishToMavenLocal
