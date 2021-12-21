
# General attribute validation rules.

Most of our customer created entities have a `name` (exceptions are currently the `KafkaUser` and `KafkaExporter`).

After a lot of heated discussions, we are going with the following (copied from Pims comment)

    Unicode, but strict rules for validation/sanitization,

NOTE: this is unclear; we can validate a unicode string to only have code points in the ascii range.

## entity names

My suggestion is check all STRM entity names to have a default limit and no content validation:

*any Unicode string of between 4 and 100 characters.*


## billing id

The `billing-id` is still used all over, and if it goes away it will be replaced by project-id. `billing-id` is often
used in k8s label values, but should be moved to annotations.

Do we need something different than the general entity name validation?


## doc, description, label and tags attributes
My suggestion would be to be generous with these.

* *doc, description: 0 to 5000 characters*
* *label, tags: 0 to 500 characters, no more than 20 labels*


## names in schemas and event contracts.

Names in schemas are defined by [Avro](https://avro.apache.org/docs/current/spec.html#names):

* start with `[A-Za-z_]`
* subsequently contain only `[A-Za-z0-9_]`

I would like to add "have a maximum length of 63 characters"

## field paths
This is used in event contracts and masked fields. A field path is one ore more schema names, with forward slash characters in between.
