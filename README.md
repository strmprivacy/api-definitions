# Stream Machine API definitions

All `proto` file definitions for the Stream Machine APIs.

## gRPC Guidelines

We try to adhere to the Google gRPC guidelines (the so called `API Improvement Proposals`), which can be
found [here](https://google.aip.dev). Our idea is to use
the [Google API Linter](https://github.com/googleapis/api-linter) for checking the adherence to the Google AIPs.

## Tasks and goals of this repo

- Uses `buf` to `lint` and check for `breaking` changes.
- Uses `gradle` for compiling Proto files and publishing Java/Kotlin artifacts.
- Uses a `Makefile` for compiling Proto files and generating Go code.

## IntelliJ and protobuf plugin quirks

In order for IntelliJ to work correctly with the proto files, you need to ensure:
- that the `protos` directory is marked as sources root
- that you add the jar that contains the `google/api` proto definitions to the Proto plugin configuration (Languages and Frameworks -> Protocol Buffers)
  - disable `Configure automatically`
  - add a line to a random directory (as you cannot create an empty line ¯\_(ツ)_/¯)
  - modify the line to point to the common protos jar: `jar:///<PATH_TO_M2>/.m2/repository/com/google/api/grpc/proto-google-common-protos/2.1.0/proto-google-common-protos-2.1.0.jar!/`
