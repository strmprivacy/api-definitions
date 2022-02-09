# API Definitions

## Introduction

The API Definitions consists of two parts:

1. Public APIs (found in `protos/strmprivacy/api`)

   These APIs are exposed through the API Gateway, which is, next to the Event
   Gateway, the only application that is publicly exposed. Our plan is to These
   APIs can be found in the respective artifactories of the various languages we
   generate the protos to (e.g. JVM artifacts for these APIs can be found in
   Maven Central)

2. Internal APIs (found in `protos/strmprivacy/internal_api`)

   These APIs are not exposed through the API Gateway, but are used within
   various of our applications to communicate with data that is applicable to
   multiple end-users.

## Structure of the repository

The repository more or less has the following structure:

```
api-definitions
├── Makefile
├── lang
├── protos
├── scripts
├── .api-linter.yaml
├── buf.yaml
├── catalog-info
├── catalog-info.yaml
├── docs
├── mkdocs.yml
├── package.json
└── renovate.json5
```

Look at the tabs below to see what the purpose of each file is:

1. `Makefile`

  Entrypoint for all tools involved in this repository. Contains commands to setup
your IDE, running the proto compiler, generating code, building/compiling the
code into artifacts, and more.

2. `lang`

  Per language, a separate directory, with at least a `Makefile`. This `Makefile`
contains all details and commands required for generating and building/compiling
generated code for this specific language.

3. `protos`

  The protos directory contains all `.proto` files, defining `message`, `service`
and `rpc` elements that make up our APIs. The directory structure **must** be
reflected in the package name at the top of a `.proto` file.

4. `scripts`

  Contains various shell scripts, used for setting up your IDE, or generating
Backstage YAML files.

5. `buf.yaml`

  [Buf](https://buf.build) aims to provide a unified toolset of Protocol buffers.
Read more about it on their site. We only use Buf for checking that no breaking
changes are made to existing APIs.

6. `.api-linter.yaml`

  Contains the configuration (actually only exclusions)
for [Google's AIP (API Improvement Proposals)](https://google.aip.dev/general)
linter. This is meant to keep our Proto messages and gRPC services + RPCs
conform a specification in order to maintain consistency and prevent errors.

7. `catalog-info and catalog-info.yaml`
 
  Contains all files for Backstage, generated from the proto files and defining
this repository as a system that contains the source of truth for our APIs.

8. `docs and mkdocs.yml`

  MkDocs documentation directory

9. `package.json`

  Every project within STRM Privacy contains a `package.json`, which is used
for [semantic-release](https://github.com/semantic-release/semantic-release).

10. `renovate.json5`

  Renovate is used for automatic dependency upgrades, presented as Merge Requests
on this repository. As the `Makefile` is the single source of truth of the used
Protobuf and gRPC versions (these are propagated into every language in
the `lang` directory), we have custom rules defined to ensure that only the
versions in the top level `Makefile` are updated.

## Languages

The supported languages at the moment are:

- Golang
  
  :exclamation: At one point, we needed to release a new version and bumped into
  the versioning logic of Go modules. This led to the fact that we're still on
  API major version 1, while the generated Go code already contains `v2` in the
  module name.

- JVM (Java / Kotlin)

  In the code generation, we already include the native Kotlin code generation
  of `protoc`, however, at the moment this only includes message builder DSLs.

- Python
- TypeScript
