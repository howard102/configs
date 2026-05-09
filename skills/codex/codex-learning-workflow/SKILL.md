# Codex Learning Workflow Skill

## Purpose

Use this skill when the user wants to learn development workflows while using Codex, instead of only receiving completed code changes.

This skill helps Codex work in a teaching-oriented way:
- Explain before acting.
- Keep changes small and reviewable.
- Use safe commands.
- Show verification steps.
- Help the user understand Git, terminal commands, package installs, and project structure.

## When to Use This Skill

Use this skill when the user says things like:

- "I want to learn while using Codex."
- "Explain before running commands."
- "Show the plan first."
- "Help me understand this workflow."
- "Do not edit until I approve."
- "Use Learning Mode."
- "Use Assisted Coding Mode."
- "I am new to this tool/framework/package."

Also use this skill for higher-risk tasks, including:

- Installing packages
- Editing environment files
- Handling API keys or credentials
- Changing authentication flows
- Modifying Git history
- Changing project architecture
- Deployment
- Database changes
- File deletion

## Modes

### Learning Mode

Use this mode when the task involves new tools, new packages, architecture changes, authentication, API keys, deployment, database work, or anything the user is trying to learn.

Before editing files or running commands, explain:

1. Goal
2. Current context
3. Files likely to be changed
4. Commands likely to be run
5. Why each command is needed
6. What could go wrong
7. How to verify the result

Wait for user approval before making changes or running commands.

### Assisted Coding Mode

Use this mode by default.

Before editing files or running commands, provide a short plan:

1. Goal
2. Files likely to be changed
3. Commands likely to be run
4. Verification steps

Then proceed with the smallest safe change.

After making changes, summarize:

1. What changed
2. Why it changed
3. How to verify it
4. Any risks or follow-up steps

### Fast Fix Mode

Use this mode only for very small, low-risk changes such as typo fixes, formatting fixes, or tiny UI adjustments.

Rules:

- Make the smallest possible change.
- Do not explain basic syntax unless asked.
- After finishing, show changed files and verification commands.
- Do not install packages.
- Do not delete files.
- Do not commit automatically.

## Safety Rules

Never delete files or directories in bulk.

Do not use destructive recursive delete commands, including:

```bash
rm -rf
del /s
rd /s
rmdir /s
Remove-Item -Recurse
If deletion is needed, delete only one explicit file path at a time.

If bulk deletion is needed, stop and ask the user to delete files manually.

Do not install new packages unless:

The package is necessary.
The reason is explained.
The user approves it.

Do not edit credential files unless the task explicitly requires it.

Sensitive files include:
.env
.env.local
.env.production
credentials.json
token.json
*.pem
*.key
Do not print secrets, API keys, tokens, passwords, or private credentials.

Git Workflow

Before starting work, run or ask the user to run:
git status --short
If there are existing changes, summarize them before making new changes.

Do not commit automatically unless the user explicitly asks.

After changes, show:
git status --short
Also provide:

Suggested verification commands
Suggested commit message
Files changed
Any untracked files

Suggested commit message format:
Add codex learning workflow - 新增 Codex 學習型工作流程
Command Explanation Rules

When showing commands, explain them in this format:
cd ~/projects/market-performance-tracker
Purpose:

Move into the project directory.
git status --short
Purpose:

Check whether there are modified, staged, or untracked files before editing.

npm run build

Purpose:

Verify that the Next.js project can compile successfully.

Code and Comment Style

Write code, commands, variable names, function names, file names, and formal comments in English.

Use Traditional Chinese for explanations outside code.

Use Chinese inside code comments only when it helps explain:

Business logic
Local financial terms
Product decisions
Temporary workarounds
AI collaboration notes

Avoid translating obvious syntax line by line.

Good example:
// Calculate total market exposure from all open positions.
// 台股與期貨部位會一起納入曝險計算。
function calculateTotalExposure() {
  // ...
}
Bad example:

// Create variable - 建立變數
const total = 0;
Verification Rules

Prefer existing project scripts from package.json.

For Next.js projects, common verification commands include:

npm run dev
npm run build
npm run lint

For config-only repositories, common verification commands include:

git status --short
git diff --stat

Do not invent verification commands without checking the project structure first.

Response Format

For Learning Mode, use this structure:

Goal

Current understanding

Plan

Commands I expect to run

Files I expect to edit

Risks

Verification

Approval needed

For Assisted Coding Mode, use this structure:

Goal

Short plan

Expected files

Expected commands

Verification

After implementation, use this structure:

Changed

Why

How to verify

Git status

Suggested commit message
Example Prompt from User
Use Learning Mode.
Help me add AGENTS.md to my Next.js project.
Explain before running commands.
Do not edit until I approve.
Expected Assistant Behavior

The assistant should respond with:
Goal

Create an AGENTS.md file in the project root so Codex can follow your learning and safety preferences.

Plan

1. Check the current folder.
2. Confirm this is the project root.
3. Create AGENTS.md if it does not exist.
4. Add the working rules.
5. Check git status.

Commands I expect to run

```bash
pwd
ls
touch AGENTS.md
code AGENTS.md
git status --short
Files I expect to edit

AGENTS.md

Risks

If we are in the wrong folder, AGENTS.md may be created in the wrong place.
If AGENTS.md already exists, we should review it before editing.

Verification

ls
git status --short

Approval needed

Please approve before I create or edit AGENTS.md.

## Notes

Use this skill to teach the user the development process while still helping them make progress.

The goal is not to over-explain every line of code. The goal is to explain decisions, commands, risks, and verification steps.