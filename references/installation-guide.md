# Installation Guide

This repository is best used as a skill and rule source for AI development tools.

It supports two installation styles:

1. native skill-folder installation
2. repository-based rule or instruction integration

Important distinction:

- `Codex` supports native skill-folder installation
- `Claude Code / Claude`, `Cursor`, and most other AI tools usually do not have a one-click install command for this repository
- for those tools, the practical approach is to reference this repository through project rules, instruction files, or copied template folders

## 0. Cross-Platform One-Command Install

This repository now provides cross-platform helper scripts:

- PowerShell: `./scripts/install.ps1`
- Shell: `./scripts/install.sh`

They support three targets:

- `codex`
- `claude`
- `cursor`

Windows examples:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 codex
```

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 claude <target-project-dir>
```

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 cursor <target-project-dir>
```

macOS / Linux examples:

```bash
bash ./scripts/install.sh codex
```

```bash
bash ./scripts/install.sh claude <target-project-dir>
```

```bash
bash ./scripts/install.sh cursor <target-project-dir>
```

Replace `<target-project-dir>` with the root directory of the project where you want the skill files to be installed.

What each command does:

- `codex`: installs both skills into the local `~/.codex/skills/` directory
- `claude`: installs both skills plus `.claude/commands/` into the target project
- `cursor`: installs both skills plus `.cursor/rules/` into the target project

## 1. Quick Choice

Use this table first:

- `Codex`: copy the skill folders into the local Codex skills directory
- `Claude Code / Claude`: no one-click install command; reference the repository from `CLAUDE.md`, `.claude/skills/`, or `.claude/commands/`
- `Cursor`: no one-click install command; reference the repository from `.cursor/rules/`
- `VS Code + AI extension`: reference the repository from project rules, prompts, or docs
- other AI tools: use the generic integration template at the end of this guide

## 2. Codex

One-command install:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 codex
```

```bash
bash ./scripts/install.sh codex
```

Copy these two directories into your Codex skills directory:

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

Common skills directory:

- Windows: `%USERPROFILE%\\.codex\\skills\\`
- macOS: `~/.codex/skills/`
- Linux: `~/.codex/skills/`

Suggested steps:

1. Clone this repository.
2. Copy `backend-service-spec-skill` into your Codex skills directory.
3. Copy `cross-tech-stack-spec-skill` into your Codex skills directory.
4. Restart Codex or open a new session.

Example:

```text
Use $backend-service-spec-skill to analyze this backend microservice project.
```

```text
Use $backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

## 3. Claude Code / Claude

Claude Code does not provide a one-click install command for this repository in the same sense as Codex native skills.

In practice, Claude Code is integrated at three levels.

Project one-command setup provided by this repository:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 claude <target-project-dir>
```

```bash
bash ./scripts/install.sh claude <target-project-dir>
```

The helper script installs:

- `.claude/skills/backend-service-spec-skill/`
- `.claude/skills/cross-tech-stack-spec-skill/`
- `.claude/commands/*.md`

### 3.1 Basic: `CLAUDE.md`

Use this when you only want Claude Code to understand the rules and do not need slash commands.

1. Clone this repository into or beside your project, for example `ai-skill-lib/`.
2. Create or update `CLAUDE.md`.
3. Reference these two files:
   - `./ai-skill-lib/backend-service-spec-skill/SKILL.md`
   - `./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md`

Example `CLAUDE.md`:

```md
Use this repository as the project-analysis rule source:

- ./ai-skill-lib/backend-service-spec-skill/SKILL.md
- ./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md

Requirements:
- stay strictly grounded in code facts
- separate fact-closed, partial, and clue-level evidence
- use create_codemap, build_domain_map, crate_router_map, and service_deep_dive as the core analysis actions
```

With this method, `create_codemap`, `service_deep_dive`, `crate_router_map`, and `build_domain_map` are workflow intents, not native `/create-codemap` slash commands.

### 3.2 Native Skill Folder: `.claude/skills/`

If you want Claude Code to discover and use these capabilities through project-local skill folders, copy the two skill folders into the target project:

```text
<target-project>/
  .claude/
    skills/
      backend-service-spec-skill/
        SKILL.md
      cross-tech-stack-spec-skill/
        SKILL.md
```

Example prompts:

```text
/backend-service-spec-skill create_codemap: mode=service_landscape, scope=current project, goal=generate the service landscape
```

```text
/cross-tech-stack-spec-skill map the login route across page, backend, message, and callback boundaries
```

You can also ask in natural language. Claude Code may use each `SKILL.md` `description` to judge whether the project-local skill context is relevant.

### 3.3 Optional Commands: `.claude/commands/`

If you want users to type commands such as `/create-codemap`, copy this repository's `.claude/commands/` directory into the target project root:

```text
<target-project>/
  .claude/
    commands/
      create-codemap.md
      service-deep-dive.md
      crate-router-map.md
      build-domain-map.md
    skills/
      backend-service-spec-skill/
        SKILL.md
      cross-tech-stack-spec-skill/
        SKILL.md
```

Then use these commands in Claude Code:

```text
/create-codemap mode=service_landscape scope=current-project goal=generate service landscape and key route index
```

```text
/service-deep-dive scope=user-service goal=map APIs, dependencies, MQ, and risk hotspots
```

```text
/crate-router-map scope=login-flow goal=split sync calls, async messages, and closure status
```

```text
/build-domain-map scope=order-domain goal=roll existing service facts up into domain knowledge
```

Notes:

- `.claude/commands/*.md` files are Claude Code slash command templates and do not require an MCP Server.
- A slash command turns user input into a stable workflow; the actual analysis still depends on `SKILL.md`, code search, config reading, and any necessary terminal commands.
- If the target project has custom scripts, add their execution details to the command templates.
- If no scripts exist, Claude Code should inspect code directly and generate `mydocs/` artifacts according to the project-local skill rules.

## 4. Cursor

Cursor also does not provide a one-click install command for this repository.

In practice, the normal approach is to copy or reference rule files and then let Cursor Agent follow them.

Project one-command setup provided by this repository:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 cursor <target-project-dir>
```

```bash
bash ./scripts/install.sh cursor <target-project-dir>
```

The helper script installs:

- `skills/backend-service-spec-skill/`
- `skills/cross-tech-stack-spec-skill/`
- `.cursor/rules/*.mdc`

Recommended method:

1. Clone this repository into the target project, for example `ai-skill-lib/`, or copy the two skill folders into the target project's `skills/` directory.
2. Copy this repository's `.cursor/rules/` directory into the target project root.
3. Open the target project in Cursor.
4. Ask Cursor Agent to run workflow intents such as `create_codemap`, `service_deep_dive`, `crate_router_map`, or `build_domain_map`.

Recommended layout:

```text
<target-project>/
  .cursor/
    rules/
      backend-service-spec-skill.mdc
      cross-tech-stack-spec-skill.mdc
  ai-skill-lib/
    backend-service-spec-skill/
      SKILL.md
    cross-tech-stack-spec-skill/
      SKILL.md
```

You can also place the skills under:

```text
<target-project>/
  skills/
    backend-service-spec-skill/
      SKILL.md
    cross-tech-stack-spec-skill/
      SKILL.md
```

Example prompts in Cursor:

```text
create_codemap: mode=service_landscape, scope=current project, goal=generate the service landscape and key route index first
```

```text
service_deep_dive: scope=user-service, goal=map APIs, dependencies, MQ, and risk hotspots
```

```text
crate_router_map: scope=login flow, goal=split sync calls, async messages, and closure status
```

Notes:

- `.mdc` files are Cursor rules, not native plugins, MCP tools, slash commands, or native skill-registry entries.
- Names such as `create_codemap` are workflow intents in Cursor; the Agent follows the rules, reads code, and generates artifacts.
- The `skills/` folder in Cursor should be understood as supporting context, not as Codex-style native skill execution.
- If the target project provides executable entries under `scripts/`, `bin/`, `tools/`, `package.json`, or `Makefile`, Cursor Agent can prefer running them.
- If no executable script exists, Cursor Agent should manually inspect code and config, then generate `mydocs/` documentation.
- The cross-tech-stack rule is only for mobile, H5, Python, mixed-stack projects, or explicit cross-stack analysis requests.

## 5. VS Code

VS Code usually works through an AI extension rather than through a native skill system.

Recommended method:

1. Clone this repository into or beside your workspace, for example `ai-skill-lib/`.
2. Add a project guide such as `docs/ai-analysis-guide.md`.
3. Reference the two `SKILL.md` files from that guide.
4. If your extension supports project rules, point it to the same files.

Example guide content:

```md
For project analysis and code knowledge mapping, use:

- ./ai-skill-lib/backend-service-spec-skill/SKILL.md
- ./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md

Priority rules:
- strict fact grounding
- closure-state separation
- codemap first, then deeper chain analysis
```

## 6. Generic AI Tool Template

If your AI development tool is not listed above, use this repository with a rule file, prompt template, custom instruction, or docs context.

Minimal portable template:

```md
Use this repository as the project-analysis rule source:

- ./backend-service-spec-skill/SKILL.md
- ./cross-tech-stack-spec-skill/SKILL.md

Core rules:
- stay strictly grounded in code facts
- separate fact-closed, partial, and clue-level evidence
- organize analysis around create_codemap, build_domain_map, crate_router_map, and service_deep_dive
- if the project spans mobile, H5, Python, frontend/backend, callback, task, or message layers, enable the cross-tech-stack extension guidance
```

## 7. One-Line Summary

Treat this repository as:

- a native skill install for Codex
- a repository-based rule source for Claude, Cursor, VS Code, and similar AI development tools
- project-local skill/command support for Claude Code when `.claude/skills/` or `.claude/commands/` is installed
- rule-driven workflow support for Cursor rather than native skill execution
- not a one-click install package for Claude Code or Cursor

## 8. What To Do With Generated `mydocs/`

After the skills generate analysis outputs, do not treat `mydocs/` as the final team knowledge destination.

Recommended reading:

- [From `mydocs` To A Central Knowledge Repository](./mydocs-to-central-knowledge-repo.md)
- [Central Knowledge Repository And OpenSpec Collaboration](./knowledge-repo-and-openspec-collaboration.md)

Shortest practical flow:

1. import the project `mydocs/` into the source layer of the central knowledge repository
2. then recover stable content following the `mydocs/services/`, `mydocs/domains/`, and `mydocs/specs/` structure

Copyable two-step wording:

```text
Please execute import_mydocs_to_sources:
source_repo=<project-repo>
source_docs=<path-to-mydocs>
target_repo=<central-knowledge-repo>
batch=<YYYY-MM-DD-workspace-or-topic>
mode=safe
```

```text
Please execute recover_sources_to_project:
target_repo=<central-knowledge-repo>
batch=<YYYY-MM-DD-workspace-or-topic>
recover=services,domains,standards
mode=guided
```
