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

## Open-Source Files

This repository also includes skill-usage companion files:

- [License](./LICENSE)
- [Installation Guide](./references/installation-guide.md)

It also includes generic integration guidance for other AI development tools that support rules, instructions, prompts, or documentation context.

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
- [Backend Skill Chinese Quick Start](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [Backend Skill Chinese README](./backend-service-spec-skill/README.zh-CN.md)
- [Extension Skill Chinese README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [Extension Chinese Usage Guide](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
