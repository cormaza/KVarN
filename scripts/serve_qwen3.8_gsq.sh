#!/usr/bin/env bash
# ==============================================================================
# serve_qwen3.8_gsq.sh - Serve ISTA-DASLab/Qwen3.8-27B-3Bit-GSQ with KVarN
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VLLM_DIR="$(cd "${SCRIPT_DIR}/../../vllm" 2>/dev/null && pwd || echo "/home/christopher/Documents/ai/vllm")"

if [[ -f "${VLLM_DIR}/start-qwen3.8-gsq.sh" ]]; then
    exec "${VLLM_DIR}/start-qwen3.8-gsq.sh" "$@"
fi

MODEL="ISTA-DASLab/Qwen3.8-27B-3Bit-GSQ"
vllm serve "${MODEL}" \
    --gpu-memory-utilization 0.88 \
    --max-model-len 8192 \
    --limit-mm-per-prompt "image=4,video=1" \
    --reasoning-parser qwen3 \
    --tool-call-parser qwen3_xml \
    --enable-auto-tool-choice \
    "$@"
