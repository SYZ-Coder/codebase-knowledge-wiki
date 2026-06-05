# Backend And Cross-Tech-Stack Spec Skill Library

This repository is an open skill library for code knowledge mapping, legacy-system understanding, central knowledge-repository building, and mixed-stack project analysis.

It is built by drawing on selected ideas and working principles from `zread` and `sdd-riper`, then upgrading and extending them into a more team-oriented skill library for long-term project knowledge reuse, cross-service analysis, mixed-stack mapping, and central knowledge-base maintenance.

## Language Navigation

- English: [README.md](./README.md)
- Chinese: [README.zh-CN.md](./README.zh-CN.md)

## What Is In This Repository

This repository is organized around two sibling skills maintained in one place:

1. `backend-service-spec-skill`
2. `cross-tech-stack-spec-skill`

The goal is to keep backend-oriented knowledge mapping and cross-tech-stack extensions in a single repository so they are easier to maintain, publish, and read.

## Start Here

If this is your first time in the repository:

1. Read this root README for installation, skill selection, and navigation.
2. If your target is a backend, microservice, legacy system, or platform-service repository, continue with the [Backend Service Spec Skill README](./backend-service-spec-skill/README.md).
3. If your target is mobile, H5, Python, or a mixed-stack workspace, continue with the [Cross-Tech-Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md).

## Which Skill Should You Use

| Situation | Recommended skill | Read first |
| --- | --- | --- |
| Backend, microservice, legacy service family, platform repository | `$backend-service-spec-skill` | [Backend Service Spec Skill README](./backend-service-spec-skill/README.md) |
| Mobile, H5, Python, or mixed-stack workspace | `$backend-service-spec-skill` + `$cross-tech-stack-spec-skill` | [Cross-Tech-Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md) |
| Pure non-backend-first repo where backend wording is too narrow | `$cross-tech-stack-spec-skill` | [Cross-Tech-Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md) |

Recommended mixed-stack wording:

```text
Use $backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

## Important Note

The base skill and the extension skill now both use their formal names directly:

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

For example:

```text
Use $backend-service-spec-skill to analyze this backend microservice project.
```

## Quick Install And Tool Setup

For open-source users, this repository provides cross-platform helper scripts:

- PowerShell: `./scripts/install.ps1`
- Shell: `./scripts/install.sh`

### Codex

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 codex
```

macOS / Linux:

```bash
bash ./scripts/install.sh codex
```

This installs:

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

into the local `~/.codex/skills/` directory.

### Claude Code / Claude

Claude Code does not have a native one-click install mechanism for this repository in the same way Codex does, but this repository provides a one-command project setup:

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 claude <target-project-dir>
```

macOS / Linux:

```bash
bash ./scripts/install.sh claude <target-project-dir>
```

This installs into the target project:

- `.claude/skills/backend-service-spec-skill/`
- `.claude/skills/cross-tech-stack-spec-skill/`
- `.claude/commands/*.md`

After installation, Claude Code can use the copied project-local skill folders and command templates inside that project.
This is closer to project-scoped skill or command usage than to Codex-style native skill registry execution.

### Cursor

Cursor also does not have a native one-click install mechanism for this repository, but this repository provides a one-command project setup:

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 cursor <target-project-dir>
```

macOS / Linux:

```bash
bash ./scripts/install.sh cursor <target-project-dir>
```

This installs into the target project:

- `skills/backend-service-spec-skill/`
- `skills/cross-tech-stack-spec-skill/`
- `.cursor/rules/*.mdc`

After installation, Cursor usually does not need extra manual rule setup. The rule files are already copied into `.cursor/rules/`.

Recommended next step:

1. reopen the target project in Cursor, or let Cursor refresh project context
2. ask Cursor Agent to run intents such as `create_codemap`, `service_deep_dive`, `crate_router_map`, or `build_domain_map`

### OpenCode

OpenCode supports project-local skill discovery, so this repository provides a one-command project setup for `.opencode/skills/`:

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 opencode <target-project-dir>
```

macOS / Linux:

```bash
bash ./scripts/install.sh opencode <target-project-dir>
```

This installs into the target project:

- `.opencode/skills/backend-service-spec-skill/`
- `.opencode/skills/cross-tech-stack-spec-skill/`

After installation, reopen the target project in OpenCode or refresh project context so it can discover the copied project-local skills.

More setup details:

- [Shared References Index](./references/README.md)
- [Installation Guide](./references/installation-guide.md)
- [安装指南](./references/installation-guide.zh-CN.md)

## Fastest Way To Start

If you want the shortest path to first use:

1. Pick the skill based on your project type.
2. Reuse one of the prompt examples below.
3. Open the matching child README when you need the full rules, output details, or templates.

### Backend first-use prompt

```text
Use $backend-service-spec-skill to analyze this backend microservice project with standard outputs.
Generate the normal text pages and companion Markdown/Mermaid diagrams together.
```

### Mixed-stack first-use prompt

```text
Use $backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
Generate standard outputs and companion Markdown/Mermaid diagrams together.
```

## Core Capabilities At A Glance

### `backend-service-spec-skill`

This is the primary skill in the repository for backend systems, microservice landscapes, legacy codebases, and platform-style service repositories.

| Command | Use it when | Typical outputs | Read more |
| --- | --- | --- | --- |
| `create_codemap` | you need a first-pass service landscape | service inventory, service boundaries, upstream/downstream dependencies, architecture diagram, service call graph | [Backend Skill README](./backend-service-spec-skill/README.md) |
| `service_deep_dive` | you have identified a high-value service | single-service structure pages, interface inventory, dependency pages, service rule pages, module architecture diagram | [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md) |
| `crate_router_map` | you want to trace a real request or message chain | key route-chain pages, sync/async split views, closure-status pages, sequence diagram, route call graph | [Backend Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md) |
| `build_domain_map` | you want to consolidate service facts into domain knowledge | business-domain pages, domain-to-service mappings, domain-level rule pages, domain context diagram | [Backend Command Output Map](./backend-service-spec-skill/references/command-output-map.md) |
| `requirement_fact_map` | historical requirements are missing and you need factual requirements from code | functional-module requirement fact pages, requirement-to-code evidence matrix, unclosed requirements, requirement indexes | [Requirement Fact Extraction Guide](./backend-service-spec-skill/references/requirement-fact-extraction.md) |

Detailed command semantics, examples, output rules, and directory guidance now live in the child README:

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.md)

### `cross-tech-stack-spec-skill`

Use this as an explicit extension when backend-only wording becomes too narrow.

Typical enhancements:

- workspace layering
- mixed-stack noise control
- interface mapping
- context propagation tracing
- gateway forwarding analysis
- async contract analysis
- mixed-stack architecture and cross-layer diagrams

Detailed extension behavior, optional switches, context rules, and templates live in:

- [Cross-Tech-Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md)
- [Extension Usage Guide](./cross-tech-stack-spec-skill/references/extension-usage-guide.md)

## How To Read The `mydocs/` Output Structure

Many users understand that `mydocs/` is the output root, but do not immediately know what each subdirectory is for.

| Directory | Main question it answers | Best suited for |
| --- | --- | --- |
| `mydocs/codemap/` | What does the overall workspace look like, and what are the core systems and relationships? | People or AI building first-pass global understanding |
| `mydocs/services/` | How is one important service structured internally, and what interfaces and dependencies does it have? | People or AI preparing to modify one service |
| `mydocs/routermap/` | How does one real request chain or message chain run? | People or AI doing integration, route tracing, or incident analysis |
| `mydocs/domains/` | How should service facts be consolidated into durable business-domain knowledge? | People or AI building a central knowledge repository |
| `mydocs/requirements/` | What functional requirements does the current system factually support, and is the evidence closed? | People or AI filling historical requirement gaps and building a requirement knowledge base |
| `mydocs/context/` | What shared cross-service facts exist around contracts, fields, context propagation, error semantics, async contracts, and external dependencies? | People or AI doing cross-module coding, interface alignment, or debugging |
| `mydocs/validation/` | Which conclusions are closed with evidence, which remain clue-level, and what risks are still open? | People or AI validating trustworthiness before reuse |
| `mydocs/index/` | What is the index, reading order, and scope boundary for this analysis pass? | Anyone consuming the outputs |

The directory most likely to be misunderstood is `mydocs/context/`:

- it is not a private folder for one single service
- it is better understood as the global cross-cutting context layer within the current analysis scope
- it mainly serves cross-end, cross-service, and cross-route collaboration
- its boundary is the systems included in the current analysis scope, not every repository in an organization

## Scenario Navigation Table

If you are unsure where to start, choose an entry point by scenario:

| Your scenario | Recommended command or usage | Read first |
| --- | --- | --- |
| You just inherited a backend or microservice repository and need the global picture | `create_codemap` | [Backend Service Spec Skill README](./backend-service-spec-skill/README.md) |
| You already know a high-value service and want a vertical analysis | `service_deep_dive` | [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md) |
| You want to trace a real request chain or message chain | `crate_router_map` | [Backend Skill Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md) |
| You want to consolidate service facts into business-domain knowledge | `build_domain_map` | [Backend Skill Command Output Map](./backend-service-spec-skill/references/command-output-map.md) |
| Historical requirements are missing, and you need factual requirements by functional module | `requirement_fact_map` | [Requirement Fact Extraction Guide](./backend-service-spec-skill/references/requirement-fact-extraction.md) |
| The project is mobile, H5, Python, or mixed-stack | `$backend-service-spec-skill` + `$cross-tech-stack-spec-skill` | [Cross-Tech-Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md) |
| You want a ready-to-send prompt for Codex | reuse the examples in the root README quick-command section | [Quick Commands](#quick-commands) |
| You want the full workflow and supporting documents | read the root README first, then the child README and usage guide | [Recommended Reading Order](#recommended-reading-order) |

## Quick Commands

### Backend skill only

```text
Use $backend-service-spec-skill to analyze this backend microservice project with standard outputs.
Generate the normal text pages and companion Markdown/Mermaid diagrams together.
```

### Backend lightweight full

```text
Use $backend-service-spec-skill to run a lightweight full analysis on this backend microservice project.
Requirements:
1. classify project scope first
2. run create_codemap
3. run service_deep_dive on 1 to 2 high-value services
4. run crate_router_map on 1 to 2 key chains
5. generate standard outputs, including companion Markdown/Mermaid diagrams by default
6. stay strictly grounded in code facts
```

### Backend heavy full

```text
Use $backend-service-spec-skill to run a heavy full analysis on this backend microservice project.
Requirements:
1. classify project scope first
2. run create_codemap
3. run service_deep_dive on multiple high-value services
4. run crate_router_map on multiple key chains
5. run build_domain_map last
6. generate standard outputs, including companion Markdown/Mermaid diagrams by default
7. output validation pages and unresolved-chain summaries
8. stay strictly grounded in code facts
```

### Historical requirement fact extraction

```text
Use $backend-service-spec-skill to extract factual requirements for this historical project.
Requirements:
1. run create_codemap first to identify system boundaries, services, and core entry points
2. run service_deep_dive on high-value services
3. run crate_router_map on key business chains
4. run requirement_fact_map last to extract current factual requirements by functional module
5. output artifacts under mydocs/requirements/
6. stay strictly grounded in code facts, and do not promote clues into confirmed requirements
```

### Extension skill only

```text
Use $cross-tech-stack-spec-skill to analyze this mixed-stack project.
```

### Backend + extension

```text
Use $backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
Generate standard outputs and companion Markdown/Mermaid diagrams together.
```

### Extension skill with all optional switches enabled

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets for a full enhanced analysis.
Generate standard outputs and companion Markdown/Mermaid diagrams together.
```

### Full analysis mode

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets,
and generate separate standard artifacts for all enabled capabilities, including companion Markdown/Mermaid diagrams.
```

Note:

- full analysis mode can consume substantially more tokens
- it also increases scan time and output size
- see [Full Analysis Mode](./references/full-analysis-mode.md) for guidance

## Repository Layout

### 1. Backend Service Skill

Location:

- `./backend-service-spec-skill/`

Use this skill when the repository is mainly a legacy backend system, a microservice landscape, or a platform service family.

Read next:

- [Backend Skill README](./backend-service-spec-skill/README.md)
- [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md)
- [Backend Skill Command Output Map](./backend-service-spec-skill/references/command-output-map.md)
- [Backend Skill Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md)
- [Requirement Fact Extraction Guide](./backend-service-spec-skill/references/requirement-fact-extraction.md)
- [Backend Skill Usage Guide](./backend-service-spec-skill/references/usage-guide.md)

### 2. Cross-Tech-Stack Extension Skill

Location:

- `./cross-tech-stack-spec-skill/`

Use this skill when the repository spans mobile, H5, Python, bridge, backend, MQ, callback, or other cross-tech-stack boundaries.

Read next:

- [Extension README](./cross-tech-stack-spec-skill/README.md)
- [Detailed Extension Usage Guide](./cross-tech-stack-spec-skill/references/extension-usage-guide.md)
- [Extension Skill Command Output Map](./cross-tech-stack-spec-skill/references/command-output-map.md)
- [Extension Skill Command Quick Reference](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.md)
- [Mixed-Stack Diagram Output Guidelines](./cross-tech-stack-spec-skill/references/diagram-output-guidelines.md)
- [Optional Switch Extensions](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.md)

## Recommended Reading Order

### For first use

1. Read this root README.
2. Read the child README that matches your project type.
3. Reuse one of the quick commands above.

### For backend depth

- [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md)
- [Backend Skill README](./backend-service-spec-skill/README.md)
- [Backend Skill Usage Guide](./backend-service-spec-skill/references/usage-guide.md)

### For mixed-stack depth

- [Cross-Tech-Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md)
- [Extension Usage Guide](./cross-tech-stack-spec-skill/references/extension-usage-guide.md)
- [Optional Switch Extensions](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.md)

### Shared References

- [Shared References Index](./references/README.md)
- [Team Standard Workflow](./references/team-standard-workflow.md)
- [Full Analysis Mode](./references/full-analysis-mode.md)
- [From `mydocs` To A Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.md)
- [Central Knowledge Repository And OpenSpec Collaboration](./references/knowledge-repo-and-openspec-collaboration.md)
- [Scenario Command Recipes](./references/scenario-command-recipes.md)
- [Trace A Full Chain From An Interface Or Feature](./references/full-chain-by-interface-or-feature.md)
- [Anchor Selection Guide](./references/anchor-selection-guide.md)

## Additional Navigation

- [Shared References Index](./references/README.md)
- [Installation Guide](./references/installation-guide.md)
- [Directory And Terminology Baseline](./references/directory-and-terminology-baseline.md)
- [Backend Skill Chinese README](./backend-service-spec-skill/README.zh-CN.md)
- [Extension Skill Chinese README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [Chinese Guide: `mydocs` To Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [Chinese Guide: Knowledge Repository And OpenSpec Collaboration](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)
