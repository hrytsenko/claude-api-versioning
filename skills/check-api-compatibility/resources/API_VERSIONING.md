# API Compatibility Policy

This document defines what constitutes a breaking vs. non-breaking change to an API specification.

A breaking change requires a major version bump. A non-breaking change may be released as a minor or patch version.

## Negligible changes

The following changes do not affect compatibility and do not impact version, so they must be ignored:

- Changes to contract metadata.
- Adding, editing, or removing comments.

## Breaking changes

The following changes break compatibility and require bump of major version:

- Remove an entire operation.
- Make an optional request parameter, header, or field required.
- Add a required request parameter, header, or field without a default value.
- Remove or rename a parameter, request field, or response field.
- Change the data type of a parameter, header, or field.
- Narrow the value space of a parameter, header, or field (e.g. reducing `maximum`, removing an `enum` value).
- Change a success response status code.

## Non-breaking changes

The following changes preserve compatibility but require bump of the minor version:

- Add a new operation.
- Add an optional request parameter, header, or field.
- Add a required request parameter, header, or field with a default value.
- Add a response header or field.
- Extend the value space of a parameter, header, or field (e.g. increasing `maximum`, adding an `enum` value).
- Add a new success response status code alongside the existing one.

## Versioning rules

The following table summarizes the required action for each type of detected changes:

| Detected changes        | Required action                                           |
|-------------------------|-----------------------------------------------------------|
| Any breaking            | Increment major and reset minor to 0, e.g. `1.2` → `2.0`. |
| Non-breaking only       | Increment minor, e.g. `1.2` → `1.3`.                      |
| Negligible only or none | Do nothing.                                               |
