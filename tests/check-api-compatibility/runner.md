# Test Runner

You are running automated tests for the `check-api-compatibility` skill. Follow every step below in order.

## Step 1 — Run tests

All test cases use `tests/check-api-compatibility/fixtures/` as the fixtures folder.

For each row in the table, run the skill and silently record the result.
Do not move to Step 2 until every row has been executed.

| Name                                 | New spec                  |
|--------------------------------------|---------------------------|
| Breaking change, major bumped        | v2.0-breaking.yaml        |
| Non-breaking change, minor bumped    | v1.1-non-breaking.yaml    |
| Negligible change, version unchanged | v1.0-negligible.yaml      |

For each test case:

1. Run `claude -p "/api-versioning:check-api-compatibility diff tests/check-api-compatibility/fixtures/v1.0.yaml tests/check-api-compatibility/fixtures/<new-spec>" --allowedTools "Read,Bash"`.
2. Check whether the output ends with `PASS` or `FAIL` and record:
   - When `PASS`: `✓ <name>`
   - When `FAIL`: `✗ <name>`

## Step 2 — Report results

Print the following report:

```
# Test Report

<bulleted list of test results>

<PASS when all tests passed, FAIL when any test failed>
```
