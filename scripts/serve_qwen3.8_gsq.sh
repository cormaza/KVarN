#!/usr/bin/env bash
# ==============================================================================
# serve_qwen3.8_gsq.sh - Runner for Qwen3.8-27B GSQ on AMD ROCm (RX 9060 XT)
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "${SCRIPT_DIR}/../serve" "$@"
