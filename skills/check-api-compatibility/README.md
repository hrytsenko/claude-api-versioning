# Check API compatibility

This skill detects changes in the API specification, reports breaking and non-breaking changes, and verifies that the version bump is consistent with the detected changes.

## Usage

```
/api-versioning:check-api-compatibility <mode> <spec-file>
```

## Modes

- `head <spec>` — check changes before committing (current disk version vs. previous repository version).
- `log <spec>` — check trunk changes (latest repository version vs. previous repository version).
- `base <spec>` — check pull requests (branch tip version vs. branch point version).
- `diff <new-spec> <old-spec>` — compare local files (new disk version vs. old disk version).

## Output

- **Compatibility verdict** — breaking and non-breaking changes between the two versions.
- **Version verdict** — whether the contract version is consistent with the detected changes.

## Policy

Compatibility and versioning rules are defined in `references/API_VERSIONING_POLICY.md`.

To override them for a specific project, place an `API_VERSIONING_POLICY.md` file in the project root.
