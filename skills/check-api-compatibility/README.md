# Check API compatibility

This skill detects changes in the API specification, reports breaking and non-breaking changes, and verifies that the version bump is consistent with the detected changes.

## Usage

```
/api-versioning:check-api-compatibility <mode> <spec-file>
```

## Modes

- `head <spec>` — check changes before committing (previous repository version vs. current disk version).
- `log <spec>` — check trunk changes (previous repository version vs. latest repository version).
- `base <spec>` — check pull requests (branch point version vs. branch tip version).
- `diff <old-spec> <new-spec>` — compare local files (old disk version vs. new disk version).

## Output

- **Compatibility verdict** — breaking and non-breaking changes between the two versions.
- **Version verdict** — whether `info.version` is consistent with the detected changes.

## Policy

Compatibility and versioning rules are defined in `assets/API_VERSIONING_POLICY.md`.

To override them for a specific project, place an `API_VERSIONING_POLICY.md` file in the project root.
