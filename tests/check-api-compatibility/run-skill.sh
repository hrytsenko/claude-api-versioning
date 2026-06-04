#!/usr/bin/env bash
set -euo pipefail

SKILL=$(sed '1,/^---$/d' skills/check-api-compatibility/SKILL.md)
FIXTURES="tests/check-api-compatibility/fixtures"

claude -p "${SKILL/\$ARGUMENTS/diff $FIXTURES/$1 $FIXTURES/v1.0.yaml}" \
    --model claude-haiku-4-5 \
    --allowedTools "Read,Bash" \
    --output-format json
