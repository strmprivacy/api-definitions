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

## IntelliJ and Protobuf plugin configuration

Run `./setup-ide-protobuf-plugins.sh` to configure the following Protobuf plugins:
- [Protocol Buffers (official)](https://plugins.jetbrains.com/plugin/14004-protocol-buffers): works fine for basic usage.
- [Protobuf (non official)](https://plugins.jetbrains.com/plugin/16422-protobuf): has more functionality than the official plugin.
