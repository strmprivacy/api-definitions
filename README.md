# STRM Privacy API definitions

This project contains all `proto` file definitions for the STRM Privacy APIs.

## Starting with STRM Privacy

Curious what we're building at STRM Privacy? See our [homepage](https://strmprivacy.io) or dive right into
our [documentation](https://docs.strmprivacy.io) to get started.

## Developing API Definitions

For more developer information, see the `docs` directory.

### gRPC Guidelines

We try to adhere to the Google gRPC guidelines (the so
called `API Improvement Proposals`), which can be
found [here](https://google.aip.dev). Our idea is to use
the [Google API Linter](https://github.com/googleapis/api-linter) for checking
the adherence to the Google AIPs.

### IntelliJ and Protobuf plugin configuration

Run `./setup-ide-protobuf-plugins.sh` to configure the following Protobuf
plugins:

- [Protocol Buffers (official)](https://plugins.jetbrains.com/plugin/14004-protocol-buffers):
  works fine for basic usage.
- [Protobuf (non official)](https://plugins.jetbrains.com/plugin/16422-protobuf):
  has more functionality than the official plugin.

### Install

Make sure [buf](https://buf.build) is installed. The `Makefile` is the
entrypoint
of this repository and should be used to generate code and build artifacts for
various languages.

## Proto validations

This repository
uses [bufbuild/protoc-gen-validate](https://github.com/bufbuild/protoc-gen-validate)
to validate Protobuf messages.

**Important!** <br>
If validations are created for messages in `A.proto` and file `B.proto` contains
messages that use messages from `A.proto`, but `B.proto` does not
import `validate.proto`, no validators are generated for `B.proto`, and thus no
validations happen that are defined in `A.proto`, even though `B.proto` might
use messages from `A.proto` in its own messages.
