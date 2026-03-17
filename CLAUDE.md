# Claude Code 项目指令

## 语言规范

**默认使用简体中文**进行所有文档、注释、解释和交流。除非用户明确切换语言，否则始终以中文回复。

## 项目简介

`ai-coding-base-img` 是一个 Docker 基础镜像，预装以下 AI 编码工具：

- **Node.js LTS** — 运行时基础
- **Claude Code** — `npm i -g @anthropic-ai/claude-code@latest`
- **OpenCode** — `https://opencode.ai/install`
- **GitHub Copilot CLI** — `https://gh.io/copilot-install`

镜像通过 GitHub Actions 每晚自动构建并推送至 `ghcr.io/smellgamed3/ai-coding-base`。

## 开发规范

- 代码注释使用中文。
- 提交信息（commit message）使用中文。
- Dockerfile 中的注释使用中文。
- 文档（README 等）以中文为主，可附英文说明。
