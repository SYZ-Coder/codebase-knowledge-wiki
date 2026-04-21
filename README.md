# Backend And Cross-Tech-Stack Spec Skill Library

This repository is an open skill library for code knowledge mapping, legacy-system understanding, central knowledge-repository building, and mixed-stack project analysis.

It is built by drawing on selected ideas and working principles from zread and sdd-riper, then upgrading and extending them into a more team-oriented skill library for long-term project knowledge reuse, cross-service analysis, mixed-stack mapping, and central knowledge-base maintenance.

## Chinese README

For Chinese readers, start here:

- [README.zh-CN.md](./README.zh-CN.md)

It is organized around two sibling skills maintained in one place:

1. `backend-service-spec-skill`
2. `cross-tech-stack-spec-skill`

The goal is to keep backend-oriented knowledge mapping and cross-tech-stack extensions in a single repository so they are easier to maintain, publish, and read.

## Important Note

The base skill and the extension skill now both use their formal names directly:

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

That means users should now invoke the base skill directly by its current formal name.

For example:

```text
Use backend-service-spec-skill to analyze this backend microservice project.
```

## Quick Start Here

If this is your first time in the repository, use this root README as the entry guide:

1. Read this file to understand the two skills, their boundaries, and the common entry prompts.
2. If your target is a backend, microservice, legacy system, or platform service repository, continue with the [Backend Service Spec Skill README](./backend-service-spec-skill/README.md).
3. If your target is mobile, H5, Python, or a mixed-stack workspace, continue with the [Cross Tech Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md).

If you mainly want to know what `backend-service-spec-skill` can do before reading the full child README, start with the command overview below.

## `backend-service-spec-skill` At A Glance

This is the primary skill in the repository for backend systems, microservice landscapes, legacy codebases, and platform-style service repositories.

### 1. `create_codemap`

Use it when:

- you need a first-pass service landscape
- you want to identify which services deserve deeper analysis next

Typical outputs:

- service inventory
- service boundaries
- upstream/downstream dependencies
- service-landscape overview pages

Read more:

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.md)
- [Backend Skill Command Output Map](./backend-service-spec-skill/references/command-output-map.md)

### 2. `service_deep_dive`

Use it when:

- you have identified a high-value service
- you want a vertical analysis of modules, interfaces, dependencies, and responsibilities

Typical outputs:

- single-service structure pages
- interface inventory
- dependency pages
- service rule or convention pages

Read more:

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.md)
- [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md)

### 3. `crate_router_map`

Use it when:

- you want to trace a real request chain or message chain
- you need to separate sync calls, async messaging, compensation, and real-time channels

Typical outputs:

- key route-chain pages
- sync/async split views
- closure-status pages

Read more:

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.md)
- [Backend Skill Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md)

### 4. `build_domain_map`

Use it when:

- you already have service-level facts and want to consolidate them into domain-level knowledge
- you are preparing long-lived artifacts for a central knowledge repository

Typical outputs:

- business-domain pages
- domain-to-service mapping pages
- domain-level rule pages

Read more:

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.md)
- [From `mydocs` To A Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.md)

## Suggested Reading Path

If you want the shortest path to first use:

1. Read [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md)
2. Read [Backend Skill Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md)
3. Return to the [Backend Service Spec Skill README](./backend-service-spec-skill/README.md) for the complete explanation

If you want the full picture:

1. Read this root README first
2. Then read the [Backend Service Spec Skill README](./backend-service-spec-skill/README.md)
3. Then read the [Backend Skill Usage Guide](./backend-service-spec-skill/references/usage-guide.md)
4. If the project is mixed-stack, continue with the [Cross Tech Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md)

## Scenario Navigation Table

If you are unsure where to start, choose an entry point by scenario:

| Your scenario | Recommended command / usage | Read first |
| --- | --- | --- |
| You just inherited a backend or microservice repository and need the global picture | `create_codemap` | [Backend Service Spec Skill README](./backend-service-spec-skill/README.md) |
| You already know a high-value service and want a vertical analysis | `service_deep_dive` | [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md) |
| You want to trace a real request chain or message chain | `crate_router_map` | [Backend Skill Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md) |
| You want to consolidate service facts into business-domain knowledge | `build_domain_map` | [Backend Skill Command Output Map](./backend-service-spec-skill/references/command-output-map.md) |
| The project is mobile, H5, Python, or mixed-stack | `backend-service-spec-skill` + `$cross-tech-stack-spec-skill` | [Cross Tech Stack Spec Skill README](./cross-tech-stack-spec-skill/README.md) |
| You want a ready-to-send prompt for Codex | reuse the examples in the root README quick-command section | [Quick Commands](#quick-commands) |
| You want the full workflow and supporting documents | read the root README first, then the child README and usage guide | [Suggested Reading Path](#suggested-reading-path) |

## One-Line Selection Guide

- For the overall service landscape: start with `create_codemap`
- For one important service: start with `service_deep_dive`
- For a real cross-service chain: start with `crate_router_map`
- For long-lived domain knowledge: finish with `build_domain_map`
- For mixed-stack projects: use `backend-service-spec-skill` as the base workflow and enable `$cross-tech-stack-spec-skill`

## Open-Source Files

This repository also includes skill-usage companion files:

- [License](./LICENSE)
- [Installation Guide](./references/installation-guide.md)
- [From `mydocs` To A Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.md)
- [Central Knowledge Repository And OpenSpec Collaboration](./references/knowledge-repo-and-openspec-collaboration.md)

It also includes generic integration guidance for other AI development tools that support rules, instructions, prompts, or documentation context.

If your main question is how skill outputs should land in a central knowledge repository, the shortest path is:

1. read [From `mydocs` To A Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.md)
2. then read [Central Knowledge Repository And OpenSpec Collaboration](./references/knowledge-repo-and-openspec-collaboration.md)

## Repository Layout

### 1. Backend Service Skill

Location:

- `./backend-service-spec-skill/`

Use this skill when the repository is mainly a legacy backend system, a microservice landscape, or a platform service family.

Core capabilities:

- cross-service `create_codemap`
- cross-service `build_domain_map`
- `crate_router_map`
- `service_deep_dive`

Read next:

- [Backend Skill Quick Start](./backend-service-spec-skill/references/quick-start.md)
- [Backend Skill Command Output Map](./backend-service-spec-skill/references/command-output-map.md)
- [Backend Skill Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md)
- [Backend Skill Metadata](./backend-service-spec-skill/SKILL.md)
- [Backend Skill Usage Guide](./backend-service-spec-skill/references/usage-guide.md)
- [Backend Skill README](./backend-service-spec-skill/README.md)

### 2. Cross-Tech-Stack Extension Skill

Location:

- `./cross-tech-stack-spec-skill/`

Use this skill when the repository spans mobile, H5, Python, bridge, backend, MQ, callback, or other cross-tech-stack boundaries.

Core enhancements:

- workspace layering
- mixed-stack noise control
- communication evidence levels
- interface mapping
- mixed-stack domain mapping
- incremental update mode
- eight optional switch-controlled deep-analysis pages

Read next:

- [Extension Skill Metadata](./cross-tech-stack-spec-skill/SKILL.md)
- [Detailed Extension Usage Guide](./cross-tech-stack-spec-skill/references/extension-usage-guide.md)
- [Extension Skill Command Output Map](./cross-tech-stack-spec-skill/references/command-output-map.md)
- [Extension Skill Command Quick Reference](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.md)
- [Full Analysis Mode](./references/full-analysis-mode.md)
- [Optional Switch Extensions](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.md)
- [Extension README](./cross-tech-stack-spec-skill/README.md)

## How To Choose

### Use only `backend-service-spec-skill` when:

- the repository is mainly backend or microservice oriented
- service-level language is still accurate enough
- cross-stack adaptation is not needed

### Use `cross-tech-stack-spec-skill` when:

- the repository is mobile-first, H5-first, Python-first, or mixed-stack
- interface and router analysis must cross frontend, gateway, backend, MQ, callback, or task layers
- backend-only wording would distort the project structure

### Use both together when:

- you want the backend skill as the main workflow
- and you need mixed-stack adaptation on top of it

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

## Quick Commands

### Backend skill only

```text
Use backend-service-spec-skill to analyze this backend microservice project.
```

### Backend lightweight full

```text
Use backend-service-spec-skill to run a lightweight full analysis on this backend microservice project.
Requirements:
1. classify project scope first
2. run create_codemap
3. run service_deep_dive on 1 to 2 high-value services
4. run crate_router_map on 1 to 2 key chains
5. stay strictly grounded in code facts
```

### Backend heavy full

```text
Use backend-service-spec-skill to run a heavy full analysis on this backend microservice project.
Requirements:
1. classify project scope first
2. run create_codemap
3. run service_deep_dive on multiple high-value services
4. run crate_router_map on multiple key chains
5. run build_domain_map last
6. output validation pages and unresolved-chain summaries
7. stay strictly grounded in code facts
```

### Extension skill only

```text
Use $cross-tech-stack-spec-skill to analyze this mixed-stack project.
```

### Backend + extension

```text
Use backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

### Extension skill with all optional switches enabled

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets for a full enhanced analysis.
```

### Full analysis mode

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets,
and generate separate artifacts for all enabled capabilities.
```

Note:

- full analysis mode can consume substantially more tokens
- it also increases scan time and output size
- see [Full Analysis Mode](./references/full-analysis-mode.md) for guidance

## Recommended Reading Order

- [Team Standard Workflow](./references/team-standard-workflow.md)
- [Full Analysis Mode](./references/full-analysis-mode.md)
- [From `mydocs` To A Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.md)
- [Central Knowledge Repository And OpenSpec Collaboration](./references/knowledge-repo-and-openspec-collaboration.md)
- [Scenario Command Recipes](./references/scenario-command-recipes.md)
- [Trace A Full Chain From An Interface Or Feature](./references/full-chain-by-interface-or-feature.md)
- [Anchor Selection Guide](./references/anchor-selection-guide.md)

1. Read the backend quick-start guide first.
2. Then read the backend-service README or usage guide.
3. If the project is mixed-stack, continue to the extension README.
4. If deeper interface analysis is needed, continue to the extension usage guide and optional-switch guide.

## Additional Navigation

- [Team Standard Workflow](./references/team-standard-workflow.md)
- [Personal Workflow For Backend-Microservice Projects](./backend-service-spec-skill/references/personal-workflow.md)
- [Backend Skill Command Output Map](./backend-service-spec-skill/references/command-output-map.md)
- [Backend Skill Command Quick Reference](./backend-service-spec-skill/references/command-output-scenario-quickref.md)
- [Extension Skill Command Output Map](./cross-tech-stack-spec-skill/references/command-output-map.md)
- [Extension Skill Command Quick Reference](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.md)

## Chinese Navigation

For Chinese readers, start here:

- [Chinese Root README](./README.zh-CN.md)
- [Chinese Guide: `mydocs` To Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [Chinese Guide: Knowledge Repository And OpenSpec Collaboration](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)
- [Backend Skill Chinese Quick Start](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [Backend Skill Chinese README](./backend-service-spec-skill/README.zh-CN.md)
- [Extension Skill Chinese README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [Extension Chinese Usage Guide](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
