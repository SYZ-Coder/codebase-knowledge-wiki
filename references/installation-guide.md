# Installation Guide

This repository is best used as a skill and rule source for AI development tools.

It supports two installation styles:

1. native skill-folder installation
2. repository-based rule or instruction integration

## 1. Quick Choice

Use this table first:

- `Codex`: copy the skill folders into the local Codex skills directory
- `Claude Code / Claude`: reference the repository from `CLAUDE.md` or project instructions
- `Cursor`: reference the repository from `.cursor/rules/`
- `VS Code + AI extension`: reference the repository from project rules, prompts, or docs
- other AI tools: use the generic integration template at the end of this guide

## 2. Codex

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
Use backend-service-spec-skill to analyze this backend microservice project.
```

```text
Use backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

## 3. Claude Code / Claude

Recommended method:

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

## 4. Cursor

Recommended method:

1. Clone this repository into or beside your project, for example `ai-skill-lib/`.
2. Create `.cursor/rules/backend-service-spec.mdc`.
3. Create `.cursor/rules/cross-tech-stack-spec.mdc`.
4. Put short rule summaries in those files.
5. Point those rule files back to this repository.

Example rule snippet:

```md
Use this repository as the analysis rule source:

- ./ai-skill-lib/backend-service-spec-skill/SKILL.md
- ./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md

Rules:
- stay strictly grounded in code facts
- distinguish fact-closed, send-side only, receive-side only, contract-visible, and clue-level evidence
- use create_codemap, build_domain_map, crate_router_map, and service_deep_dive as the main analysis actions
```

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

## 8. What To Do With Generated `mydocs/`

After the skills generate analysis outputs, do not treat `mydocs/` as the final team knowledge destination.

Recommended reading:

- [From `mydocs` To A Central Knowledge Repository](./mydocs-to-central-knowledge-repo.md)
- [Central Knowledge Repository And OpenSpec Collaboration](./knowledge-repo-and-openspec-collaboration.md)
