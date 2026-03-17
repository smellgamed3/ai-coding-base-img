# ai-coding-base-img

预装最新 AI 编码工具的 Docker 基础镜像，每晚自动重新构建。

> A nightly-rebuilt Docker base image pre-loaded with the latest AI coding tools.

## 包含工具 / Included Tools

| 工具 | 来源 |
|------|------|
| **Node.js LTS** | `node:lts-slim` 基础镜像 |
| **Claude Code** | `npm i -g @anthropic-ai/claude-code@latest` |
| **OpenCode** | `https://opencode.ai/install` |
| **GitHub Copilot CLI** | `https://gh.io/copilot-install` |

## 镜像地址 / Image

```
ghcr.io/smellgamed3/ai-coding-base:latest
ghcr.io/smellgamed3/ai-coding-base:YYYY-MM-DD
```

## 使用方式 / Usage

```dockerfile
FROM ghcr.io/smellgamed3/ai-coding-base:latest
# node、claude、opencode 和 copilot 均已就绪
```

## 全局规则 / Global Rules

镜像内置了**中文优先**的全局 AI 规则：

- 所有 AI 工具的输出（文档、注释、解释、交流、思考过程）默认使用**简体中文**。
- 规则文件存放在：
  - `AGENTS.md` — 通用 Agent 规则
  - `CLAUDE.md` — Claude Code 项目指令
  - `.github/copilot-instructions.md` — GitHub Copilot 自定义指令
  - `/root/.config/opencode/config.json` — OpenCode 全局配置（已写入镜像）

### 健康测试 / Health Check

启动容器后，运行以下命令验证镜像健康状态：

```bash
opencode run "汇报当前系统状态"
```

OpenCode 应以中文汇报当前系统环境信息。

## 每晚构建 / Nightly Build

镜像通过 GitHub Actions 在每天 UTC 02:00 自动重新构建（无缓存），确保所有工具始终为最新版本。也可通过 `workflow_dispatch` 手动触发构建。

构建目标平台：**linux/amd64** 和 **linux/arm64**（兼容 Apple Silicon）。

> **安全说明**：OpenCode 和 GitHub Copilot CLI 通过官方 `curl | bash` 脚本安装（`opencode.ai/install` 和 `gh.io/copilot-install`）。这是厂商推荐的安装方式。如您的安全策略要求，请在使用前审查这些脚本。
>
> **Security note**: OpenCode and GitHub Copilot CLI are installed via their official `curl | bash` scripts (`opencode.ai/install` and `gh.io/copilot-install`). This is the vendor-recommended installation method. Review these scripts before use if your policy requires it.
