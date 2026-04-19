---
name: cross-tech-stack-spec-skill
description: Explicit extension skill for cross-tech-stack project analysis and documentation. Use only when the user explicitly wants to enable cross-tech-stack expansion, or when the target is a mobile app project, H5/web frontend project, Python service/data project, or a mixed-stack repository that needs cross-layer mapping across frontend, client, backend, task, callback, or bridge layers. This skill extends project analysis into mobile, H5, Python, and mixed-stack contexts without modifying the default workflow of backend-service-spec-skill for backend-oriented projects.
---

# Cross Tech Stack Spec Skill

## Overview

Use this skill as an explicit extension layer for projects that are not well served by backend-service language alone.
It is designed for mobile projects, H5/web frontend projects, Python projects, and mixed-stack repositories that need cross-layer mapping.

## Activation Boundary

Use this skill only when one of these is true:

- the user explicitly says to enable cross-tech-stack expansion
- the target repository is primarily mobile, H5/web frontend, Python, or mixed-stack
- the user wants cross-layer mapping across page/app/client/backend/task/callback/bridge boundaries

Do not use this skill by default for ordinary backend microservice analysis.
In those cases, continue using the backend-service-spec-skill.

## Core Purpose

This skill adds eight kinds of adaptation:

1. rename backend-oriented analysis concepts into stack-neutral concepts
2. adapt project mapping for mobile / H5 / Python repository shapes
3. adapt router-map thinking for cross-layer routes instead of only service-to-service routes
4. preserve strict evidence boundaries when crossing frontend, client, backend, task, bridge, and callback layers
5. reduce low-signal scan noise in large mixed workspaces
6. make caller-to-handler interface mapping easier in mixed-stack repositories
7. upgrade domain pages from backend-only service structure to mixed-stack context structure when needed
8. support incremental updates for long-term knowledge maintenance

## Default Working Rules

When this skill is active:

- keep the original four function ideas: `create_codemap`, `build_domain_map`, `crate_router_map`, `service_deep_dive`
- reinterpret them in a stack-neutral way
- prefer project/module/page/task/component/bridge wording over backend-only service wording when the codebase requires it
- keep fact/clue discipline exactly as strict as in the existing backend-service-spec-skill workflow

## Stack-Neutral Mapping

When the target is not backend-service oriented, reinterpret the core pages like this:

- `service_deep_dive` -> project/module/app deep dive
- `entrypoints.md` -> route/page/screen/task entrypoints
- `dependencies.md` -> module/dependency/runtime boundary map
- `api.md` -> client contract / HTTP contract / bridge contract / callback contract
- `route-map.md` -> cross-layer route map
- `mq.md` -> message/event/task channel map
- `interface-map.md` -> caller-side to handler-side interface correspondence
- `domain-map.md` -> domain -> entry surfaces -> systems/modules -> rules/specs
- `update-note.md` -> incremental change scope and affected document note

## Workflow

1. identify target stack type first
2. if the workspace is large or mixed, produce a workspace-layering page before deep scanning
3. if scan noise is high, apply mixed-stack exclusion rules and document them
4. if the task is an update rather than a fresh scan, identify change scope first
5. read only the matching reference file(s)
6. keep existing backend-service-spec-skill evidence rules
7. output stack-appropriate pages without forcing backend naming
8. if the repo spans multiple stacks, also read the mixed-stack reference
9. if both caller-side and handler-side contracts are visible, consider adding an interface-mapping page
10. if domain knowledge is needed across app/page/backend/task layers, use the mixed-stack domain mapping guide

## Communication Analysis Extension

When communication mapping is a core goal:

- read `references/communication-matrix-guidelines.md`
- read `references/communication-evidence-levels.md`
- output communication types, count basis, evidence levels, closure state, and code locations

When caller-to-handler clarity is a core goal:

- read `references/interface-mapping-template.md`
- map caller-side contract to handler-side route without over-claiming unresolved matches

When domain context is a core goal in a mixed-stack repository:

- read `references/mixed-stack-domain-mapping-guidelines.md`
- build domain pages on top of lower-level codemap and router-map evidence

When maintaining an existing knowledge base:

- read `references/incremental-update-mode.md`
- update only the affected scope and record impacted documents

## Stack Selection

- For Android / iOS / Flutter / React Native / uni-app / Taro: read `references/mobile-project-guidelines.md`
- For H5 / SPA / SSR frontend / web app: read `references/h5-project-guidelines.md`
- For Flask / Django / FastAPI / Python worker / ETL / script repo: read `references/python-project-guidelines.md`
- For frontend + backend + callback + task + bridge mixed routes: read `references/mixed-stack-routing-guidelines.md`
- For large mixed workspaces: read `references/workspace-layering-template.md`
- For low-signal scan control in mixed workspaces: read `references/mixed-stack-noise-exclusion-guide.md`
- For interface correspondence pages: read `references/interface-mapping-template.md`
- For mixed-stack domain pages: read `references/mixed-stack-domain-mapping-guidelines.md`
- For incremental refreshes: read `references/incremental-update-mode.md`
- For base vs extension cooperation boundaries: read `references/base-vs-extension-boundaries.md`
- For activation boundary and cooperation with the backend-service-spec-skill: read `references/activation-and-boundaries.md`

## Output Rules

- do not force all projects into microservice terminology
- do not confuse page route with backend route
- do not confuse local module dependency with runtime RPC dependency
- do not confuse client callback with server webhook unless code confirms it
- do not infer mobile-native bridge behavior beyond visible code contracts
- do not infer Python task scheduling topology unless code or config closes the loop
- do not claim communication closure without evidence level and closure-state support
- do not exclude noisy directories silently; record delay or exclusion explicitly
- do not claim direct interface mapping unless the caller side and handler side are both visible or defensibly closed
- do not use mixed-stack domain pages as a place to guess business intent without lower-level evidence
- do not claim repository-wide refresh if only current change scope was re-checked

## Recommended Use

Use this skill alongside the backend-service-spec-skill, not as a replacement.
It is an opt-in extension for cross-tech-stack analysis.


