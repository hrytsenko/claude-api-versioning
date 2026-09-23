---
name: check-api-compatibility
description: Check API compatibility and verify the version bump.
argument-hint: <mode> <spec-file>
---

## Instructions

You are performing a structured API backward-compatibility review based on the provided policy. Follow every step below in order.

### Step 1 — Read policy

Check whether `API_VERSIONING_POLICY.md` exists in the project root. If it does, use it as the policy. Otherwise fall back to `references/API_VERSIONING_POLICY.md` bundled with this skill.
This is your authoritative definition of what constitutes a breaking vs. non-breaking change. Keep it in mind throughout.

### Step 2 — Determine specifications

Parse `$ARGUMENTS` as `<mode> <args...>`. If the mode is missing or not one of the values below, tell the user the valid modes and stop.

**`head <spec>`** — previous version from the repository, current version from disk.

1. Confirm `<spec>` exists on disk and is in OpenAPI format. If not, tell the user and stop.
2. **Previous version:** run `git show HEAD:"<spec>"`. If it fails, tell the user "No committed version found for `<spec>`." and stop.
3. **Current version:** read `<spec>` from disk.

**`log <spec>`** — both versions from the repository.

1. Run `git log --follow -n 2 --format="%H" -- "<spec>"`. If no output, tell the user "No committed version found for `<spec>`." and stop. If only one commit, tell the user "Only one committed version found for `<spec>` — no previous version to compare against." and stop.
2. Let `<latest>` be the first hash and `<previous>` be the second hash.
3. **Previous version:** run `git show <previous>:"<spec>"`.
4. **Current version:** run `git show <latest>:"<spec>"`.

**`base <spec>`** — previous version from the branch point, current version from the tip of the branch.

1. Determine the base branch by running `git symbolic-ref refs/remotes/origin/HEAD | sed 's|refs/remotes/origin/||'`. If it fails, tell the user "Cannot determine base branch." and stop.
2. Run `git merge-base HEAD "origin/<base-branch>"` to find the commit where the branch diverged. If it fails, tell the user "Cannot determine merge base." and stop.
3. **Previous version:** run `git show <merge-base>:"<spec>"`. If it fails, the file did not exist at the branch point — tell the user "File was introduced in this branch — no previous version to compare against." and stop.
4. **Current version:** run `git show HEAD:"<spec>"`. If it fails, tell the user "No committed version found for `<spec>`." and stop.

**`diff <new-spec> <old-spec>`** — both versions from disk.

1. Confirm both files exist and are in OpenAPI format. If not, tell the user and stop.
2. **Current version:** read `<new-spec>` from disk.
3. **Previous version:** read `<old-spec>` from disk.

### Step 3 — Compare specifications

Carefully compare the two spec versions yourself. Identify every difference: added, removed, renamed, or changed operations, parameters, request fields, response fields, headers, data types, and value constraints.

Do not count changes to `info.version` as a functional API change.

### Step 4 — Report results

Classify each difference from Step 3 as breaking, non-breaking, or negligible per policy. Leave negligible changes out of the report and treat them as no change when choosing the verdict.

Format each change as a bullet on one line: the operation name, a concise description of what changed, and the line number in the current specification where the change is located, e.g. `GET /books: added optional isbn query parameter (line 42)`.

Prepare the following inputs:

**Breaking changes** — bullets for breaking changes. Write `None.` if there are none.

**Non-breaking changes** — bullets for non-breaking changes. Write `None.` if there are none.

**Version verdict line** — extract `info.version` from both specs as a `major.minor` string. Determine the required bump using the versioning rules from the policy. Compute the expected version. Choose the matching verdict line:

1. No changes, version unchanged: `✓ No changes — version unchanged (<old>).`
2. Breaking changes, major bumped: `✓ Breaking changes — major version correctly updated (<old> → <new>).`
3. Non-breaking changes, minor bumped: `✓ Non-breaking changes — minor version correctly updated (<old> → <new>).`
4. No changes, incorrect version: `✗ No changes detected — expected <old> (unchanged), not <new>.`
5. Breaking present, incorrect version: `✗ Breaking changes detected — expected <expected>, not <new>.`
6. Non-breaking present, incorrect version: `✗ Non-breaking changes detected — expected <expected>, not <new>.`

**Result** — `PASS` for verdict cases 1–3, `FAIL` for cases 4–6.

Print the report to the output using `assets/API_VERSIONING_REPORT.md` as the structure template.

The report must be your entire final output. Do not add any text before or after it, such as a summary, analysis, or recommendations. The last line must be exactly `PASS` or `FAIL` with no other characters, so that external tools can parse the result.
