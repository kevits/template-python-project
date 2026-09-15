#FROM python:3.14.7-trixie AS base
FROM python@sha256:3df083612dec28cf1456da4f38064469561fc2e55da4ebf47e9f0110c62f80e2 AS base


FROM base AS requirements

# Set timezone to Europe/Berlin
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install uv from official image
COPY --from=ghcr.io/astral-sh/uv:0.12.13 /uv /uvx /bin/
ENV UV_CACHE_DIR=/home/vscode/.cache/uv

# Install Taskfile
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin v3.53.1
