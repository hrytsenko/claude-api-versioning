# claude-api-versioning

A Claude Code plugin to enforce the API versioning policy for compatibility checks and version bumps.

## Skills

- [check-api-compatibility](skills/check-api-compatibility/README.md) — check API compatibility and verify the version bump.
- [bump-api-version](skills/bump-api-version/README.md) — bump the API specification version according to detected API changes.

## Installation

```
/plugin marketplace add hrytsenko/claude-api-versioning
/plugin install api-versioning
```

## CI/CD

The `docker` directory contains a Docker image that runs `check-api-compatibility` against an arbitrary repository.

**Build:**

```bash
docker build -t hrytsenko/api-versioning docker/
```

**Run:**

```bash
docker run
  -e ANTHROPIC_API_KEY=<your-api-key> \
  -e PROJECT_REPO=<your-repo> \
  -e SPEC_FILE=<your-spec> \
  hrytsenko/api-versioning
```

To override the model (default: `claude-sonnet-4-5`):

```bash
docker run \
  ...
  -e ANTHROPIC_MODEL=claude-opus-4-5 \
  hrytsenko/api-versioning
```

The container exits with code `1` if the version verdict fails, making it suitable for use as a pipeline gate.
