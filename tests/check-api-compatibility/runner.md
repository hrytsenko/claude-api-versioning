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

1. Run `bash tests/check-api-compatibility/run-skill.sh <new-spec>`.
2. Parse the JSON output. Extract `result` for the verdict, `usage.input_tokens + usage.output_tokens` for total tokens, and `duration_ms` for duration.
3. Record:
   - When `result` ends with `PASS`: `✓ <name> — <tokens> tokens, <duration_ms> ms`
   - When `result` ends with `FAIL`: `✗ <name> — <tokens> tokens, <duration_ms> ms`

## Step 2 — Report results

Print the following report:

```
# Test Report

<bulleted list of test results>

<PASS when all tests passed, FAIL when any test failed>
```
