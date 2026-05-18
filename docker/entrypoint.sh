#!/usr/bin/env bash
set -euo pipefail

: "${ANTHROPIC_API_KEY:?ANTHROPIC_API_KEY is required}"
: "${PROJECT_REPO:?PROJECT_REPO is required}"
: "${SPEC_FILE:?SPEC_FILE is required}"
ANTHROPIC_MODEL="${ANTHROPIC_MODEL:-claude-sonnet-4-5}"

echo "==> Cloning project: $PROJECT_REPO"
git clone "$PROJECT_REPO" /workspace/project

echo "==> Registering marketplace"
claude plugin marketplace add hrytsenko/claude-api-versioning

echo "==> Installing skill"
claude plugin install api-versioning

echo "==> Running skill"
cd /workspace/project
OUTPUT=$(claude -p "/api-versioning:check-api-compatibility log $SPEC_FILE" \
    --model "$ANTHROPIC_MODEL" \
    --allowedTools "Read,Bash" \
    2>&1)
echo "$OUTPUT"

if echo "$OUTPUT" | grep -q "^FAIL$"; then
    echo "==> Inconsistent versioning"
    exit 1
fi

echo "==> Done"
