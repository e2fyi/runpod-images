FROM runpod/pytorch:3.10-1.13.1-116

WORKDIR /home/

ENV PIP_NO_CACHE_DIR=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VERSION=1.2.0 \
    POETRY_HOME=/home/poetry

# install poetry
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && ln -s $POETRY_HOME/bin/poetry /usr/bin/poetry

RUN git clone --depth 1 https://github.com/tloen/alpaca-lora.git
WORKDIR /home/alpaca-lora/

RUN pip install -U pip setuptools --user \
    && pip install -r requirements.txt --user



# RUN python -m venv .venv \
#     && .venv/bin/pip install -U pip setuptools \
#     && .venv/bin/pip install -r requirements.txt

