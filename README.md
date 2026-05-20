# claude-api-versioning

A Claude Code plugin and skill to enforce the API versioning policy.

See [check-api-compatibility](skills/check-api-compatibility/README.md) for details.

## Usage

**Install plugin:**

```
/plugin marketplace add hrytsenko/claude-api-versioning
/plugin install api-versioning
```

**Run skill:**

```
/api-versioning:check-api-compatibility head <spec-file>
```

**Test skill:**

```
./tests/check-api-compatibility/run.sh
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
