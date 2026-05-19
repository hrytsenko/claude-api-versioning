#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing plugin"
claude plugin marketplace add hrytsenko/claude-api-versioning
claude plugin install api-versioning

echo "==> Running tests"
claude -p "$(cat tests/check-api-compatibility/runner.md)" --allowedTools "Read,Bash"

echo "==> Uninstalling plugin"
claude plugin uninstall api-versioning
claude plugin marketplace remove claude-api-versioning
