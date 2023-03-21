FROM ghcr.io/e2fyi/runpod-images:base-v2023.3.21

WORKDIR /home/
RUN git clone --depth 1 https://github.com/tloen/alpaca-lora.git

WORKDIR /home/alpaca-lora/
RUN python -m venv .venv \
    && .venv/bin/pip install -U pip setuptools \
    && .venv/bin/pip install -r requirements.txt

