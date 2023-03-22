# runpod-images

This repo contains custom images for usage in https://www.runpod.io.

All images can be found [here](https://github.com/e2fyi/runpod-images/pkgs/container/runpod-images).

The images are of the form:

> `ghcr.io/e2fyi/runpod-images:<tag>`

## Available images
---
### `runpod-images:base-*`:
Base pytorch image + [huggingface-cli](https://huggingface.co/docs/hub/repositories-getting-started) + [git-lfs](https://git-lfs.com/) + [pipx](https://pypa.github.io/pipx/) + [poetry](https://python-poetry.org/docs/)

The base image has a util script (`/run.sh`) which takes in a command argument.

```bash
# example
/run.sh python -m finetune
```
The script will
- first clone your hugging face model repo into `/workspace/$HF_MODEL`
- execute the command provided - remember to save your model weights to `/workspace/$HF_MODEL`
- git add/commit/push your model to hugging face
- stop the pod (`NOTE` NOT terminate)

You will need to provide the following env variables:
- `HF_EMAIL`
- `HF_REPO`
- `HF_MODEL`
- `HF_TOKEN`
- `COMMIT_MSG`

> tags:
> - `base-v2023.3.21`: py=310, pytorch=1.13.1, cuda=116, pipx=1.2, poetry=1.4, hf=0.13
---
### `runpod-images:alpaca-lora-*`:
Project image to finetune `alpaca-lora` model (see https://github.com/tloen/alpaca-lora.git)

> tags:
> - `alpaca-lora-v2023.3.21`