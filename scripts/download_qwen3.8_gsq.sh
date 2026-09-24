#!/usr/bin/env bash
# ==============================================================================
# download_qwen3.8_gsq.sh - Download ISTA-DASLab/Qwen3.8-27B-3Bit-GSQ
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VLLM_DIR="$(cd "${SCRIPT_DIR}/../../vllm" 2>/dev/null && pwd || echo "/home/christopher/Documents/ai/vllm")"

if [[ -f "${VLLM_DIR}/download-qwen3.8-gsq.sh" ]]; then
    exec "${VLLM_DIR}/download-qwen3.8-gsq.sh" "$@"
fi

REPO_ID="ISTA-DASLab/Qwen3.8-27B-3Bit-GSQ"
HF_CACHE="${HF_HOME:-${HOME}/.cache/huggingface}"

echo "Descargando ${REPO_ID} en ${HF_CACHE}..."
export HF_HUB_ENABLE_HF_TRANSFER=1
uvx --from huggingface_hub hf download "${REPO_ID}" "$@"
