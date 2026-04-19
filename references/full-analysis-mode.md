# Full Analysis Mode

## Purpose

Use full analysis mode when a user wants the broadest possible one-pass analysis of a project and expects both the base skill and all extension capabilities to produce their own artifacts.

This mode is suitable for:

- full-stack projects
- App + H5 + backend + MQ + SSE/WebSocket mixed projects
- large microservice workspaces
- cases where the team wants all standard and optional artifacts generated in one run

## Important Warning

Full analysis mode significantly increases:

- token usage
- scan duration
- number of output documents
- amount of content that still needs human review

For large workspaces, this is not a lightweight action. Users should understand:

1. Full analysis mode means all major skills and optional switches are exercised.
2. Full analysis mode does not guarantee that every chain is 100% closed.
3. Any chain that cannot be fully closed must still be marked as:
   - `partially closed`
   - `clue-level`
   - `unresolved`

## Execution Principle

Full analysis mode should usually be understood as:

- full capability coverage
- phased execution

In other words:

- the base workflow and all optional extensions can belong to the same overall task
- but they should not all be applied with equal depth in the very first pass

For large projects, a phased approach is usually more accurate than a one-pass deep scan of everything at once.

## Why Multi-Stage Execution Is Recommended

### 1. Layer first, then deepen

If a project contains:

- App
- H5
- gateway
- backend microservices
- MQ / Kafka
- SSE / WebSocket
- Python worker / task / service layers

then an immediate all-at-once deep scan can easily turn:

- directory existence
- file hits
- config clues

into overstated claims about real end-to-end chains.

### 2. Wide scan first, closure second

In full analysis mode, the first pass is better used to establish:

- workspace inventory
- stack layering
- communication evidence matrix
- high-signal project groups

Only after that should the workflow move into:

- caller -> callee
- route -> handler
- producer -> topic -> consumer

style closure.

### 3. Optional switches are not equally useful at the same time

For example:

- `enable_contract_map` is more useful after initial interface matching exists
- `enable_gateway_map` is more useful once gateway presence and entry boundaries are confirmed
- `enable_field_lineage` is more useful after the main chains are narrowed down
- `enable_external_dependency_dossier` is more useful after dependency hotspots are identified

So full analysis mode should not mean “everything digs deep from the first minute”.
It should mean “everything is in scope, but each capability is applied at the right stage”.

### 4. Multi-stage execution usually saves tokens

It may look slower, but on large workspaces it is often more efficient:

- identify high-signal zones first
- spend deep analysis on the chains that matter most

That is usually cheaper and more reliable than applying the same depth everywhere.

## Recommended Prompt

```text
Use [$backend-service-spec-skill](../backend-service-spec-skill/SKILL.md) as the base workflow,
enable [$cross-tech-stack-spec-skill](../cross-tech-stack-spec-skill/SKILL.md),
and run a full analysis on the target project.

Requirements:
1. Follow the team standard workflow strictly:
   workspace layering -> single-service deep dive -> cross-service create_codemap -> crate_router_map -> domain pages.
2. Enable all optional switches:
   enable_contract_map
   enable_gateway_map
   enable_field_lineage
   enable_context_propagation_map
   enable_error_semantics
   enable_async_contract_map
   enable_external_dependency_dossier
   enable_interface_verification_assets
3. Identify frontend, App, H5, backend microservices, gateways, MQ/Kafka, SSE/WebSocket, and third-party HTTP dependencies.
4. Generate separate artifact documents for every enabled capability.
5. Stay strictly grounded in code facts with no extra inference.
6. Mark each chain with:
   closed / partially closed / clue-level / unresolved
7. Generate a top-level index document for navigation.
8. If the project is large, first produce a workspace inventory, then a workspace-wide evidence scan, then move into chain closure.
```

## Recommended Output Layout

```text
mydocs/
  README.md
  workspace/
  services/
  codemap/
  routermap/
  domain/
  extensions/
  validation/
```

## Recommended Execution Order

For large projects, the more stable approach is usually a six-stage workflow.

### Stage 1: Workspace Layering And Inventory

Goal:

- define workspace boundaries
- identify stack types
- establish `in scope / delayed / excluded` boundaries

Typical outputs:

- workspace layering page
- workspace inventory
- stack overview page

### Stage 2: Workspace-Wide Evidence Matrix

Goal:

- identify high-signal project groups
- identify communication-pattern distribution
- provide hotspots for later chain closure

Typical outputs:

- communication evidence matrix
- terminal entry summary
- high-signal service list

### Stage 3: High-Value Service Deep Dives

Goal:

- inspect the internal structure of key services
- capture controller / feign / mq / external http / stream structure

Typical outputs:

- single-service deep-dive pages
- service dependency summaries

### Stage 4: Main Chain Closure

Goal:

- identify closed or partially closed main chains from terminal, gateway, service, and async layers
- produce the main codemap and router-map outputs

Typical outputs:

- cross-service `create_codemap`
- `crate_router_map`
- global chain summary

### Stage 5: Optional Extension Deep Analysis

Goal:

- apply fine-grained analysis on top of already identified main chains
- focus optional switches on the most valuable chains rather than the whole workspace uniformly

Typical outputs:

- `contract-map`
- `gateway-map`
- `field-lineage-map`
- `context-propagation-map`
- `error-semantics-map`
- `async-contract-map`
- `external-dependency-dossier`
- `interface-verification-assets`

### Stage 6: Domain And Validation

Goal:

- lift service knowledge into conservative domain knowledge
- summarize what is closed and what still needs verification

Typical outputs:

- domain pages
- validation pages
- unresolved-chain list

## Stage Progression Rules

The following rules are recommended in full analysis mode:

1. Do not claim the global project structure is clear before stage 1 is complete.
2. Do not draw a strong workspace-wide global chain map before stage 2 is complete.
3. Do not start heavy field-lineage and dependency-dossier work before stage 3 is complete.
4. Keep domain pages conservative or clue-level until stage 4 is complete.
5. Apply optional extension depth primarily to high-signal chains rather than every project equally.

## Lightweight Full vs Heavy Full

To make the mode easier for teams to use, it is helpful to distinguish between two variants.

### Lightweight Full

Meaning:

- all capabilities are in scope
- the workflow mainly completes the first four stages
- optional switches focus on high-signal chains only

Best for:

- first entry into a very large workspace
- producing a trustworthy global first pass
- controlling token cost

### Heavy Full

Meaning:

- all six stages are executed
- all eight optional switches produce their own artifacts
- the workflow pushes as far as possible toward chain closure

Best for:

- central knowledge-repository building
- generating the fullest possible project knowledge map in one campaign
- teams willing to spend more tokens and time

## Recommended Usage

For a first pass on a large project, `lightweight full` is usually the better starting point.

If the project is already confirmed to be high value and the goal is durable team knowledge capture, `heavy full` is more appropriate.

## When Not To Use It First

Do not start with full analysis mode when:

- the user only wants a quick understanding of one backend service
- the target repository is small and a single-service deep dive is enough
- the user wants a lower-token, faster first pass

In those cases, use the base workflow or a partial-switch workflow first.
