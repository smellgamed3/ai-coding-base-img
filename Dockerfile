FROM node:lts-slim

LABEL org.opencontainers.image.source="https://github.com/smellgamed3/ai-coding-base-img"
LABEL org.opencontainers.image.description="AI 编码工具基础镜像：Node.js LTS、Claude Code、OpenCode、GitHub Copilot CLI"

# 安装系统依赖（curl、ca-certificates、git）以及 GitHub CLI
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

# 安装 Claude Code
RUN npm i -g @anthropic-ai/claude-code@latest

# 安装 OpenCode
RUN curl -fsSL https://opencode.ai/install | bash

# 安装 GitHub Copilot CLI
RUN curl -fsSL https://gh.io/copilot-install | bash

# 写入 OpenCode 全局配置：默认中文优先
# 配置文件路径遵循 XDG 规范（~/.config/opencode/config.json）
RUN mkdir -p /root/.config/opencode
COPY opencode-config.json /root/.config/opencode/config.json

# 将 AGENTS.md 复制至 /root，使 OpenCode 在默认工作目录（/root）下即可自动读取规则
# OpenCode 会沿目录树向上查找 AGENTS.md，因此放置于 /root 可覆盖容器内所有子目录
COPY AGENTS.md /root/AGENTS.md

# 打印各工具版本（构建日志作为版本清单）
RUN node -v && claude --version && opencode --version && copilot --version

# 安全清理
RUN rm -rf /tmp/* /root/.npm/_cacache

# 健康检查：验证 opencode 二进制文件可执行
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD opencode --version || exit 1
