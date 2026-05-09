# Configs

This repository stores my personal development environment settings.

It is designed for a Windows + Ubuntu WSL2 workflow, with PowerShell used for Windows management and WSL2 used for actual web development.

## Overview

This repo keeps my daily development configuration files in one place, including terminal settings, shell profiles, Git ignore rules, themes, and AI-assisted development workflow preferences.

主要用途：

- 管理 Windows Terminal / PowerShell / Ubuntu WSL2 設定
- 保存 Git、shell、theme 等個人化設定
- 維持 `~/projects` 與 `~/configs` 的工作區分工
- 支援 Codex / GPT、Claude Code、Gemini assisted development

## Environment

- Windows Terminal
- PowerShell 7
- Ubuntu WSL2
- Git
- Node.js
- pnpm
- Codex / GPT assisted development
- Claude Code
- Gemini assisted development

## Repository Structure

```text
configs/
├── git/
│   └── ignore
├── powershell/
│   ├── Microsoft.PowerShell_profile.ps1
│   └── themes/
├── windows-terminal/
│   ├── settings.json
│   └── notes.md
└── wsl/
    ├── zshrc
    ├── bashrc.append
    └── themes/
```

## Design Principles

1. PowerShell is used for Windows management. - Windows 系統管理主要使用 PowerShell。
2. Ubuntu WSL2 is used for actual web development. - 實際 Web 開發主要在 Ubuntu WSL2 中進行。
3. Project files should live under `~/projects`. - 專案檔案統一放在 `~/projects`。
4. Config files should live under `~/configs`. - 設定檔統一放在 `~/configs`。
5. Do not use dangerous recursive delete commands. - 避免使用危險的遞迴刪除指令。
6. Do not commit API keys or `.env` files. - 不提交 API keys 或 `.env` 檔案。

## Main Shortcuts / Config Files

### Git

- `git/ignore` - 不同步設定

### PowerShell

- `powershell/themes` - 主題設定
- `powershell/Microsoft.PowerShell_profile.ps1` - 主要設定檔
- `projects` - 專案資料夾捷徑

### Windows Terminal

- `windows-terminal/settings.json` - Windows Terminal 設定檔
- `windows-terminal/notes.md` - Windows Terminal 備註

### WSL2

- `wsl/themes` - 主題設定
- `wsl/zshrc` - 主要設定檔
- `projects` - 專案資料夾捷徑
