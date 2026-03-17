FROM node:lts-slim

LABEL org.opencontainers.image.source="https://github.com/smellgamed3/ai-coding-base-img"
LABEL org.opencontainers.image.description="AI coding tools base image: Node.js LTS, Claude Code, OpenCode, GitHub Copilot CLI"

# Install system dependencies (curl, ca-certificates, git) and GitHub CLI
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        git \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
        | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install -y --no-install-recommends gh \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code
RUN npm i -g @anthropic-ai/claude-code@latest

# Install OpenCode
RUN curl -fsSL https://opencode.ai/install | bash

# Install GitHub Copilot CLI
RUN curl -fsSL https://gh.io/copilot-install | bash

# Print installed versions (build log serves as version manifest)
RUN node -v && claude --version && opencode --version && copilot --version

# Security cleanup
RUN rm -rf /tmp/* /root/.npm/_cacache
