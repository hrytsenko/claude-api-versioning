---
type: llm
---

The output is a report comparing two versions of an OpenAPI specification. Grade only the report’s content; ignore wording, formatting, and line numbers.

PASS only if all of the following hold:

1. The "Breaking changes" section lists no changes (e.g. `None.`).
2. The "Non-breaking changes" section lists exactly 1 change: the addition of the optional `genre` query parameter to `GET /books`.
3. The version verdict states that non-breaking changes were detected and the minor version was correctly updated from 1.0 to 1.1.

Otherwise FAIL.
