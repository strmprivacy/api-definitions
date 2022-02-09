# Future Improvements

Various improvements can be made to the API definitions that we currently have.

## Proto / gRPC improvements

### Default values for proto messages

In Proto language 3, all fields are optional by default. Google
must [have had their reasons](https://stackoverflow.com/questions/31801257/why-required-and-optional-is-removed-in-protocol-buffers-3)
to change this behavior from Proto language 2, where the keywords `required`
and `optional` exist. Since we're using Proto language 3 (`proto3`), we have to
deal with the fact that not filling out a field in a message means, that the
[default value for that field is used](https://developers.google.com/protocol-buffers/docs/proto3#default):

- For strings, the default value is the empty string.
- For bytes, the default value is empty bytes.
- For bools, the default value is false.
- For numeric types, the default value is zero.
- For [enums](https://developers.google.com/protocol-buffers/docs/proto3#enum),
  the default value is the first defined enum value, which must be 0.
- For message fields, the field is not set. Its exact value is
  language-dependent. See
  the [generated code guide](https://developers.google.com/protocol-buffers/docs/reference/overview)
  for details.

This can lead to undesired behavior, and the developer must always be aware of
this.

### Possible solutions

1. [Field Presence](https://github.com/protocolbuffers/protobuf/blob/master/docs/field_presence.md) [^1]

   This adds `has<field_name>` methods to the generated code, which can be used
   to check whether a field has been set. Additional

2. [Wrapper classes](https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/wrappers.proto)

   Wraps primitives (such as `string`, `int`, etc) in a message, to deal with
   the fact that not setting a primitive means that the default value is used.
   Using a wrapping message, which should be null upon retrieving the message at
   runtime, we know that the primitive wasn't set.

3. Direct primitives

   The developer working with the generated code has no reference whatsoever
   whether a field is optional or not. Currently, we're
   using [`google.api.field_behavior`](https://github.com/googleapis/googleapis/blob/master/google/api/field_behavior.proto)
   , which unfortunately is _documentation only_ (meaning that it does not
   enforce anything in the generated code).

At Google Cloud, they have a preference of option 1. over option 2.

## Changes and refactoring

### Non breaking

1. The APIs, all of them (including internal) should be open sourced. It doesn't
   matter that some of them are not publicly available. This does mean that
   we'll have to implement all CI logic into GitHub actions.
2. `strmprivacy.api.entities.v1.entities_v1.proto` should be split into multiple
   files (they can be under the same package), but it'll help with overview.

### Breaking

1. `Sink` should be replaced by `DataConnector`, as the word `Sink` is confusing
   when used with a source data connection. Furthermore, it contains
   configuration that is specific for AWS S3, which should be in a custom AWS S3
   message.

[^1]: [Changes between Proto3 and Proto2](https://cloud.google.com/apis/design/proto3) 
