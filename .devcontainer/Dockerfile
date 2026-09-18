# FROM python:3.14.7-trixie AS base
FROM python@sha256:3df083612dec28cf1456da4f38064469561fc2e55da4ebf47e9f0110c62f80e2 AS base

# Install Node.js 24 with NVM
ENV NVM_DIR=/usr/local/share/nvm
ENV NODE_VERSION=24
ENV PATH="$NVM_DIR/current:$PATH"
RUN mkdir -p "$NVM_DIR" \
    && curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | PROFILE=/dev/null bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install "$NODE_VERSION" \
    && nvm alias default "$NODE_VERSION"

FROM base AS requirements

ARG USERNAME="vscode"
ARG HOME="/home/$USERNAME"

# Set timezone to Europe/Berlin
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install uv from official image
COPY --from=ghcr.io/astral-sh/uv:0.12.13 /uv /uvx /bin/
ENV UV_CACHE_DIR=/home/vscode/.cache/uv

# Install Taskfile
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin v3.53.1


# This changes most frequently, so we put it last
FROM requirements AS final

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update
