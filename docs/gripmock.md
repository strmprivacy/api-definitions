# Stubbing API responses for tests

In order to stub API responses, for
tests, [Gripmock](https://github.com/tokopedia/gripmock) can be used.

## Starting the server

The following command starts a Gripmock admin and gRPC server, which allows for
stubbing responses. One sample stub is installed here via a static file, which
is present in the
`mock` directory.
The admin server to install stubs dynamically is exposed on port 4771, and the
gRPC server is exposed on port 4770.

```shell
docker run -it -p 4770:4770 -p 4771:4771 -v mock/sample-stub.json:/stubs/account.json europe-west4-docker.pkg.dev/stream-machine-development/docker/strm-gripmock:v<apiVersion>
```

After a while you should see:

```shell
Starting GripMock
Serving stub admin on http://:4771
grpc server pid: 552
Serving gRPC on tcp://:4770
```

### Verify whether the stubs are working

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

### Viewing the stubs

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

### Improvements

The image currently is only generated for x86-64, not for ARM architectures.
[This tutorial](https://cloud.google.com/architecture/building-multi-architecture-container-images-iot-devices-tutorial)
for Google Cloud Build helps in setting that up.

