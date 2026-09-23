# claude-api-versioning

A Claude Code plugin and skill to enforce the API versioning policy.

See [check-api-compatibility](skills/check-api-compatibility/README.md) for details.

## Local

**Install plugin:**

```
/plugin marketplace add hrytsenko/claude-api-versioning
/plugin install api-versioning@claude-api-versioning
```

**Run skill (CLI):**

```
/api-versioning:check-api-compatibility head <spec-file>
```

**Run evals:**

```bash
claude plugin eval . --scaffold --trust-plugin
```
Add `--runs 1 --ablation none` for a quick single run without the no-plugin baseline.

## Pipeline

**Build image:**

```bash
docker build -t hrytsenko/api-versioning docker/
```

**Run skill (CI):**

```bash
docker run \
  -e ANTHROPIC_API_KEY=<your-api-key> \
  -e PROJECT_REPO=<your-repo> \
  -e SPEC_FILE=<your-spec> \
  hrytsenko/api-versioning
```
