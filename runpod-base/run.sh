#!/bin/bash
set -e

git config --global user.email $HF_EMAIL
huggingface-cli login --token $HF_TOKEN --add-to-git-credential
git clone https://huggingface.co/$HF_REPO/$HF_MODEL /workspace/$HF_MODEL

$@

git add .
git commit -m "$COMMIT_MSG"

huggingface-cli login --token $HF_TOKEN --add-to-git-credential
git push

echo "stop pod"
runpodctl stop pod $RUNPOD_POD_ID