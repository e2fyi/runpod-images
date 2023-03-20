#!/bin/bash
set -e

huggingface-cli login --token $HF_TOKEN
git clone https://huggingface.co/$HF_REPO/$HF_MODEL /workspace/$HF_MODEL

$@

git add .
git commit -m $COMMIT_MSG

huggingface-cli login --token $HF_TOKEN
git push

echo "stop pod"
runpodctl stop pod $RUNPOD_POD_ID