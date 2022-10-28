.PHONY: clean build

generated_dir := src

clean:
	rm -rf ${generated_dir} && \
	rm -f VERSION

${generated_dir}/VERSION: ../../Makefile ../../VERSION.env
	. ./../../VERSION.env && echo "$$VERSION" > $@

${generated_dir}/README.md:
	cp README-template.md ${generated_dir}/README.md

${generated_dir}/LICENSE:
	cp LICENSE ${generated_dir}/LICENSE

# Build depends on the existence of the lang/go/build dir
build: ${generated_dir}/VERSION ${generated_dir}/README.md ${generated_dir}/LICENSE ${generated_dir}
	cd ${generated_dir}; \
	MAJOR_VERSION=$$(cat VERSION | cut -d"." -f1); \
	rm -rf "internal_api"; \
	go mod init github.com/strmprivacy/api-definitions-go/v$${MAJOR_VERSION}; \
	go get google.golang.org/grpc@v${grpc_version}; \
	go mod tidy
