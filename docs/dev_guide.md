# Development guide

## Getting started with Intellij

Run `make default-google-dependencies` to download and unpack the Google proto
files. They are stored under `lang/.common-protos/google`.

Run `make intellij` to set up the IDE protobuf plugins.

## Installing generated JVM code to the local maven repository

Run `make jvm-publish-local`. When running on a branch, the version resolves to
`99.99.99-branch-name-SNAPSHOT`.

## Where to find published snapshot versions

When GitLab CI runs on a branch, snapshot builds will be published to the Google
Artifact Registry, as well as the Go repo:

- JVM: see [here](https://console.cloud.google.com/artifacts/maven/stream-machine-development/europe-west4/snapshot/io.strmprivacy.api:api-definitions-kotlin?project=stream-machine-development).
The version will be named after the branch, similar to a local publish, i.e.
`99.99.99-branch-name-SNAPSHOT`.
- Typescript: see [here](https://console.cloud.google.com/artifacts/npm/stream-machine-development/europe-west4/npm/@strmprivacy-internal%2Fapi-definitions?project=stream-machine-development).
The version will set to the current latest version post-fixed with the CI pipeline ID.
- Go: a snapshot version will be pushed to the [GitHub repo](https://github.com/strmprivacy/api-definitions-go),
with the version set to the current latest version post-fixed with the commit SHA.
- Python: see [here](https://console.cloud.google.com/artifacts/python/stream-machine-development/europe-west4/python-test/strmprivacy-api-definitions?project=stream-machine-development).
The version will be set to the current latest version, post-fixed with `.dev`
and a timestamp.
