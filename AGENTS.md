# 全局 AI Agent 规则

## 语言规范

**默认使用中文**。所有输出（包括文档、代码注释、解释、分析、交流和思考过程）均应优先使用简体中文，除非用户明确要求使用其他语言。

### 具体要求

- **文档**：README、设计文档、变更日志等一律用中文撰写。
- **代码注释**：内联注释和文档字符串（docstring）使用中文。
- **交流**：与用户的对话、状态汇报、错误说明均用中文。
- **思考过程**：内部推理、分析和规划使用中文表达。

## 代码风格

- 变量名和函数名使用英文（遵循语言惯例），但注释和文档用中文。
- 错误信息和日志输出首选中文。
- 提交信息（commit message）使用中文。

## 项目背景

本项目为 `ai-coding-base-img`，一个预装最新 AI 编码工具的 Docker 基础镜像，包含：

- Node.js LTS
- Claude Code（`@anthropic-ai/claude-code`）
- OpenCode（`opencode.ai`）
- GitHub Copilot CLI

镜像每晚通过 GitHub Actions 自动重新构建，确保工具始终为最新版本。
