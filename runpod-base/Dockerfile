FROM runpod/pytorch:3.10-1.13.1-116

WORKDIR /home/

# setup git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && apt-get install -y git-lfs python3.10-venv

RUN git config --global credential.helper 'cache'

ENV PIPX_VERSION=1.2.*

# install and update setuptools and pipx
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install -U --user setuptools pipx==$PIPX_VERSION \
    && python3 -m pipx ensurepath \
    && ln -s /root/.local/bin/pipx /usr/bin/pipx \
    && pipx completions

ENV PIP_NO_CACHE_DIR=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VERSION=1.4.0 \
    POETRY_HOME=/home/poetry \
    HUGGINGFACE_VERSION=0.13.*

# install cli required
RUN pipx install poetry==$POETRY_VERSION \
    && pipx install huggingface-hub==$HUGGINGFACE_VERSION

COPY ./run.sh /run.sh