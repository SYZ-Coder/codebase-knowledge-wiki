# Team Standard Workflow

This document defines the recommended team workflow for using the skill library in real projects.

The goal is not to turn on every feature by default. The goal is to:

- establish reliable boundaries first
- deepen analysis layer by layer
- keep outputs evidence-based and explicitly graded

## 1. Core Principles

### 1.1 Default order

Recommended order:

1. Start with workspace layering
2. Then do single-service deep dives
3. Then do cross-service `create_codemap`
4. Then do `crate_router_map`
5. Only then build domain pages
6. Turn on optional switches only for explicit problem scenarios

### 1.2 What not to do first

Do not start by:

- turning on every optional switch
- writing domain pages before service-level understanding exists
- tracing fields without scope control
- enabling gateway mapping without explicit gateway evidence

That usually causes:

- bloated output
- clue-level content mixed into fact-level pages
- speculative summaries instead of code-grounded structure

## 2. Standard Workflow

### Step 1: Workspace layering

Use when:

- the repository is mixed-stack
- it contains `app / h5 / backend / python`
- the workspace is large and noisy

Outputs:

- workspace layering page
- representative sample list
- `in scope / delayed / excluded / clue-only`

Why it matters:

- sets clear boundaries for later scans
- reduces noise
- prevents undirected full-repo sweeps

### Step 2: Single-service deep dive

Use when:

- you want to fully understand a high-value service first
- later work will include cross-service or domain-level mapping

Outputs:

- service overview
- controllers and interface inventory
- package/module responsibilities
- dependency relationships
- key norms and technical characteristics

Why it matters:

- provides factual foundations for later cross-service work
- gives domain pages stronger service-level evidence

### Step 3: Cross-service `create_codemap`

Use when:

- you want a service-family view
- you want structure and collaboration across related services

Outputs:

- service-family overview
- service responsibility map
- sync/async capability distribution
- Feign / controller / MQ / SSE / WS distribution

Why it matters:

- establishes the cross-service skeleton
- provides entry points for router maps

### Step 4: `crate_router_map`

Use when:

- you need to confirm who calls whom
- you need a concrete request or message path across layers and services

Outputs:

- sync call paths
- async communication paths
- evidence levels
- unresolved gaps

Why it matters:

- gives the most direct context for integration and troubleshooting

### Step 5: Domain pages

Use when:

- the team already has service-level and route-level documents
- you want to elevate scattered knowledge into reusable context

Recommended preconditions:

- ideally after single-service deep dives
- ideally after at least one cross-service codemap pass

Outputs:

- `domain -> entry surfaces -> systems/services/modules -> rules/specs`

Why it matters:

- useful for central knowledge repositories
- helps new team members understand what a group of systems solves together

## 3. How to use optional switches

### 3.1 Do not enable all switches by default

Unless the scenario is explicit, do not turn on all eight optional switches.

Recommended pattern:

- complete the base four steps first
- then enable one to three switches that match the problem

### 3.2 Recommended priority

First priority:

- `enable_contract_map`
- `enable_context_propagation_map`
- `enable_error_semantics`

Second priority:

- `enable_async_contract_map`
- `enable_interface_verification_assets`

Third priority:

- `enable_field_lineage`
- `enable_external_dependency_dossier`
- `enable_gateway_map`

### 3.3 Typical scenarios

Integration scenarios:

- `enable_contract_map`
- `enable_field_lineage`
- `enable_interface_verification_assets`

Gateway/BFF uncertainty:

- `enable_gateway_map`
- `enable_context_propagation_map`

Failure-path troubleshooting:

- `enable_error_semantics`
- `enable_context_propagation_map`
- `enable_async_contract_map`

Kafka / MQ / callback systems:

- `enable_async_contract_map`
- `enable_error_semantics`

Central knowledge repository / dependency governance:

- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`
- `enable_contract_map`

## 4. Three recommended usage patterns

### Pattern A: Service knowledge capture

Order:

1. Workspace layering
2. Single-service deep dives
3. Cross-service codemap
4. Domain pages

### Pattern B: Integration and troubleshooting

Order:

1. Single-service deep dive
2. `crate_router_map`
3. Add `enable_contract_map` if needed
4. Add `enable_context_propagation_map` if needed
5. Add `enable_error_semantics` if needed

### Pattern C: Async and real-time communication

Order:

1. Single-service deep dive
2. `crate_router_map`
3. Turn on `enable_async_contract_map`
4. Turn on `enable_error_semantics`
5. Add `enable_context_propagation_map` if needed

## 5. Final recommendation

The most stable team workflow is:

1. layer first
2. understand high-value services first
3. then build the cross-service skeleton
4. then map concrete routes
5. only then elevate to domains
6. keep optional switches problem-driven, never default-on
