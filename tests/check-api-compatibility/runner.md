# Test Runner

You are running automated tests for the `check-api-compatibility` skill. Follow the instructions below exactly.

## Instructions

All test cases use `tests/check-api-compatibility/fixtures/` as the fixtures folder. The old spec is `v1.0.yaml` and all tests expect `PASS` from the skill.

Run all test cases in the table below one by one. Do not stop until every row has been executed:

| Name                                 | New spec                  |
|--------------------------------------|---------------------------|
| Breaking change, major bumped        | v2.0-breaking.yaml        |
| Non-breaking change, minor bumped    | v1.1-non-breaking.yaml    |
| Negligible change, version unchanged | v1.0-negligible.yaml      |

For each test case:

1. Run `claude -p "/api-versioning:check-api-compatibility diff tests/check-api-compatibility/fixtures/v1.0.yaml tests/check-api-compatibility/fixtures/<new-spec>" --allowedTools "Read,Bash"` and copy the complete raw output verbatim — do not summarize, shorten, or omit any part of it.
2. Record the outcome:
   - Output contains `PASS`: `✓ <name>`
   - Output contains `FAIL`: `✗ <name>`

Only after all test cases have been executed, print the collected outcomes and a summary line:

```
Results: <passed>/<total>
```

Add a result line:

- All tests are passed: `PASS`
- Any test failed: `FAIL`
