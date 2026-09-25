---
type: llm
---

The output is a report comparing two versions of an OpenAPI specification. Grade only the report’s content; ignore wording, formatting, and line numbers.

PASS only if all of the following hold:

1. The "Breaking changes" section lists exactly one change: the removal of the `author` field from the response of `GET /books`.
2. The "Non-breaking changes" section lists exactly one change: the addition of the optional `genre` query parameter to `GET /books`.
3. The version verdict states that breaking changes were detected and the major version was correctly updated from 1.0 to 2.0.

Otherwise FAIL.
