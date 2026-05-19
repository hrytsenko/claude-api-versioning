# claude-api-versioning

A Claude Code plugin to enforce the API versioning policy for compatibility checks and version bumps.

## Skills

- [check-api-compatibility](skills/check-api-compatibility/README.md) — check API compatibility and verify the version bump.
- [bump-api-version](skills/bump-api-version/README.md) — bump the API specification version according to detected API changes.

## Use

**Install plugin:**

```
/plugin marketplace add hrytsenko/claude-api-versioning
/plugin install api-versioning
```

**Run skill:**

```
/api-versioning:check-api-compatibility head <spec-file>
```

## CI/CD

**Build image:**

```bash
docker build -t hrytsenko/api-versioning docker/
```

**Run check:**

```bash
docker run \
  -e ANTHROPIC_API_KEY=<your-api-key> \
  -e PROJECT_REPO=<your-repo> \
  -e SPEC_FILE=<your-spec> \
  hrytsenko/api-versioning
```

## Test

**Run tests:**

```
./tests/check-api-compatibility/run.sh
```
