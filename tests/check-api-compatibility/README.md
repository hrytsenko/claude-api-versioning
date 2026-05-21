# Skill Tests

The test suite verifies the skill's ability to recognize breaking, non-breaking, and negligible changes, and to validate the version bump.

The suite uses the [runner prompt](runner.md) that orchestrates test execution. The runner includes a list of fixtures and their descriptions.

## Usage

**Run all tests:**

```bash
./tests/check-api-compatibility/run-tests.sh
```

**Debug single test:**

```bash
./tests/check-api-compatibility/run-skill.sh <fixture>
```
