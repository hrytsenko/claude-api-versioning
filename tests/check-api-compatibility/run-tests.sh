#!/usr/bin/env bash
set -euo pipefail

claude -p "$(cat tests/check-api-compatibility/runner.md)" --allowedTools "Read,Bash"
