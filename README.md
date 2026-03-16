# ai-coding-base-img

A nightly-built Docker base image pre-loaded with the latest AI coding tools.

## Included Tools

| Tool | Source |
|------|--------|
| **Node.js LTS** | `node:lts-slim` base image |
| **Claude Code** | `npm i -g @anthropic-ai/claude-code@latest` |
| **OpenCode** | `https://opencode.ai/install` |
| **GitHub Copilot CLI** | `https://gh.io/copilot-install` |

## Image

```
ghcr.io/smellgamed3/ai-coding-base:latest
ghcr.io/smellgamed3/ai-coding-base:YYYY-MM-DD
```

## Usage

```dockerfile
FROM ghcr.io/smellgamed3/ai-coding-base:latest
# node, claude, opencode, and copilot are ready to use
```

## Nightly Build

The image is rebuilt automatically every night at UTC 02:00 via GitHub Actions (no-cache), ensuring all tools are always at their latest versions. You can also trigger a build manually via `workflow_dispatch`.

Builds target **linux/amd64** and **linux/arm64** (Apple Silicon compatible).

> **Security note**: OpenCode and GitHub Copilot CLI are installed via their official `curl | bash` scripts (`opencode.ai/install` and `gh.io/copilot-install`). This is the vendor-recommended installation method. Review these scripts before use if your policy requires it.
