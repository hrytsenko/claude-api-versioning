---
type: llm
---

The output is a report comparing two versions of an OpenAPI specification. Grade only the report’s content; ignore wording, formatting, and line numbers.

PASS only if all of the following hold:

1. The "Breaking changes" section lists no changes (e.g. `None.`).
2. The "Non-breaking changes" section lists no changes (e.g. `None.`).
3. The version verdict states that no changes were detected and the version is unchanged at 1.0.

Otherwise FAIL.
