# ============================================================
# Chiahao PowerShell Profile - Chiahao 的 PowerShell 個人設定檔
# Purpose - 用途:
# - Manage Windows tools - 管理 Windows 工具
# - Jump into WSL2 projects - 快速進入 WSL2 專案
# - Provide safe Git shortcuts - 提供安全的 Git 快捷指令
# - Avoid dangerous bulk-delete commands - 避免危險的批量刪除指令
# ============================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# ------------------------------------------------------------
# WSL2 project shortcuts - WSL2 專案快捷指令
# ------------------------------------------------------------

function Open-Projects {
  wsl bash -lc "cd ~/projects && exec bash"
}
Set-Alias -Name projects -Value Open-Projects

function Open-MarketTracker {
  wsl bash -lc "cd ~/projects/market-performance-tracker && exec bash"
}
Set-Alias -Name tracker -Value Open-MarketTracker

function Open-Configs {
  wsl bash -lc "cd ~/configs && exec bash"
}
Set-Alias -Name configs -Value Open-Configs

# ------------------------------------------------------------
# Development server shortcuts - 開發伺服器快捷指令
# ------------------------------------------------------------

function Start-DevServer {
  wsl bash -lc "cd ~/projects/market-performance-tracker && pnpm dev"
}
Set-Alias -Name devtracker -Value Start-DevServer

# ------------------------------------------------------------
# Git shortcuts - Git 快捷指令
# Note - 注意:
# - Avoid using gcm because PowerShell reserves it for Get-Command.
#   避免使用 gcm，因為 PowerShell 已將它保留給 Get-Command。
# - Avoid using gp because PowerShell reserves it for Get-ItemProperty.
#   避免使用 gp，因為 PowerShell 已將它保留給 Get-ItemProperty。
# ------------------------------------------------------------

function Git-Status {
  git status
}
Set-Alias -Name gs -Value Git-Status

function Git-AddAll {
  git add .
}
Set-Alias -Name gaa -Value Git-AddAll

function Git-CommitMessage {
  git commit -m "$args"
}
Set-Alias -Name gitcm -Value Git-CommitMessage

function Git-Push {
  git push
}
Set-Alias -Name gitp -Value Git-Push

function Git-Pull {
  git pull
}
Set-Alias -Name gpl -Value Git-Pull

# ------------------------------------------------------------
# Environment helper - 環境變數輔助工具
# ------------------------------------------------------------

function Refresh-Environment {
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}
Set-Alias -Name refreshenv -Value Refresh-Environment

# ------------------------------------------------------------
# Profile editor shortcut - Profile 編輯快捷指令
# ------------------------------------------------------------

function Open-PowerShellProfile {
  code $PROFILE
}
Set-Alias -Name profile -Value Open-PowerShellProfile

# ------------------------------------------------------------
# Startup message - 啟動提示訊息
# ------------------------------------------------------------

Write-Host "Chiahao PowerShell profile loaded." -ForegroundColor Green
Write-Host "Available commands: profile, projects, tracker, configs, devtracker, gs, gaa, gitcm, gitp, gpl, refreshenv" -ForegroundColor Cyan

oh-my-posh init pwsh --config "$HOME\configs\powershell\themes\catppuccin-frappe.omp.json" | Invoke-Expression