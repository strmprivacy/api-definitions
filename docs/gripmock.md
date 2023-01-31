# Stubbing API responses for tests

## Pre-requisites

Run the following make command, to ensure that the instructions in this document work for you:
```shell
make protoc-gen-validate-dependency default-google-dependencies
```

## Setup
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

## Starting the server

After running `scripts/gripmock.sh`, the Gripmock server is started and serving
the generated code for the proto files you specified. This may take a while, but
you should see:

```shell
Starting GripMock
Serving stub admin on http://:4771
grpc server pid: 552
Serving gRPC on tcp://:4770
```

## Verify whether the stubs are working

You can use any gRPC client to verify this, I'll
use [Evans](https://github.com/ktr0731/evans/) for this:

```shell
evans -r --port 4770
  ______
 |  ____|
 | |__    __   __   __ _   _ __    ___
 |  __|   \ \ / /  / _. | | '_ \  / __|
 | |____   \ V /  | (_| | | | | | \__ \
 |______|   \_/    \__,_| |_| |_| |___/

 more expressive universal gRPC client


strmprivacy.api.account.v1.AccountService@127.0.0.1:4770> service AccountService

strmprivacy.api.account.v1.AccountService@127.0.0.1:4770> call GetAccountDetails
billing_id (TYPE_STRING) => banana
{
  "billingId": "banana",
  "handle": "bananas",
  "internalUserId": "2595a492-80ac-40aa-9276-45c5702dedc0",
  "isOnboardingDone": true,
  "maxInputStreams": 42,
  "organization": "banana-farm",
  "organizationId": "eb9a070c-ee1e-4f2f-a665-fd3a23d8a367",
  "subscription": "SUPER"
}
```

## Viewing the stubs

The admin interface can be used to view the currently active stubs:

```shell
http :4771
HTTP/1.1 200 OK
Content-Length: 407
Content-Type: application/json
Date: Tue, 31 Jan 2023 14:14:50 GMT

{
    "AccountService": {
        "GetAccountDetails": [
            {
                "Input": {
                    "contains": null,
                    "equals": {
                        "billing_id": "banana"
                    },
                    "matches": null
                },
                "Output": {
                    "data": {
                        "billing_id": "banana",
                        "handle": "bananas",
                        "internal_user_id": "2595a492-80ac-40aa-9276-45c5702dedc0",
                        "is_onboarding_done": true,
                        "max_input_streams": 42,
                        "organization": "banana-farm",
                        "organization_id": "eb9a070c-ee1e-4f2f-a665-fd3a23d8a367",
                        "subscription": "SUPER"
                    },
                    "error": ""
                }
            }
        ]
    }
}
```

## Improvements

This obviously is limited to a single proto file. Gripmock does support multiple
proto files at once, feel free to experiment with that. However, my current plan
is to create a new Docker image, that makes sure that all logic that is
contained in the startup command, and the protoc plugin execution that Gripmock
does is only done once, instead on every startup of Gripmock itself. This will
save a lot of time, as the mocks only need to be updated once the API
definitions change.
