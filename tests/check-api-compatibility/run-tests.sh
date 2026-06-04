#!/usr/bin/env bash
set -euo pipefail

claude -p "$(cat tests/check-api-compatibility/runner.md)" \
    --model claude-haiku-4-5 \
    --allowedTools "Read,Bash"
