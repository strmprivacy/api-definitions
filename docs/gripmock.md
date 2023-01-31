# Stubbing API responses for tests

In order to stub API responses, for
tests, [Gripmock](https://github.com/tokopedia/gripmock) can be used. As the
STRM Privacy APIs use various imports, the Docker command is not straight
forward. To run one of the STRM Privacy gRPC services, and install stubs with
Gripmock, do the following:

1. Make sure your current working directory is the root of this repository
2. Change the path to the proto file for which you want to run a stub in the
   file `scripts/gripmock.sh`
3. Update the stub following the API logic of Gripmock in `scripts/stub.json`
4. Run the Gripmock server by executing the `scripts/gripmock.sh` file

## Improvements

This obviously is limited to a single proto file. Gripmock does support multiple
proto files at once, feel free to experiment with that. However, my current plan
is to create a new Docker image, that makes sure that all logic that is
contained in the startup command, and the protoc plugin execution that Gripmock
does is only done once, instead on every startup of Gripmock itself. This will
save a lot of time, as the mocks only need to be updated once the API
definitions change.
