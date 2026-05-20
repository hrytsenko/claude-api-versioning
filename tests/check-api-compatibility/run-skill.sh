#!/usr/bin/env bash
set -euo pipefail

SKILL=$(sed '1,/^---$/d' skills/check-api-compatibility/SKILL.md)
FIXTURES="tests/check-api-compatibility/fixtures"

claude -p "${SKILL/\$ARGUMENTS/diff $FIXTURES/v1.0.yaml $FIXTURES/$1}" --allowedTools "Read,Bash"
