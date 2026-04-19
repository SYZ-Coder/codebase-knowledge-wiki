# Cross-Tech Stack Skill Upgrade Roadmap

This document records the main improvement directions identified after validating the skill against a representative real mixed workspace.

It focuses on three questions:

- what should be improved next
- whether the capability belongs in the base skill or the extension skill
- how teams should use the capability in practice

## 1. Current Maturity

The extension skill is already usable for:

- mobile app repositories
- H5 / web frontend repositories
- Python service / worker / AI repositories
- mixed workspaces containing app, page, bridge, backend, task, and messaging layers

The real-project validation proved that it can extract code-based evidence for:

- native routing
- app-to-H5 jumps
- H5-to-backend HTTP calls
- H5-to-native bridge calls
- IM SDK access
- FastAPI routes
- SSE
- Kafka
- Redis
- async HTTP clients

However, it is not yet at the stage where a team can use it long-term at scale without stronger boundary rules and maintenance rules.

## 2. Priority Upgrade List

### Priority 1: Stronger Workspace Layering

Problem:

In a large mixed workspace, direct full-repo scanning produces too much noise before the analysis boundary is established.

Upgrade:

Always support a first-step workspace classification page:

- workspace
- subsystem
- repository
- stack type
- entry files
- recommended analysis order

Why it matters:

This gives all later outputs the same boundary baseline.

Recommended ownership:

- Base skill: should absorb the generic workspace-classification idea
- Extension skill: should keep the mixed-stack-specific classification rules

### Priority 2: Evidence Strength Levels for Communication Analysis

Problem:

The skill can already find communication evidence, but outputs are still easier to over-read than they should be.

Upgrade:

Every communication conclusion should carry a strength level such as:

- L1 direct declaration
- L2 configuration evidence
- L3 clue-level evidence

Examples:

- L1: `@POST("/api/...")`, `include_router(...)`, `import TIM from 'tim-js-sdk'`
- L2: `baseURL`, `kafka:` config, `redis:` config
- L3: naming or directory hints without a direct call site

Why it matters:

This makes the skill more credible and keeps it aligned with fact-first analysis.

Recommended ownership:

- Base skill: should absorb the generic evidence-level discipline
- Extension skill: should keep the communication-type-specific examples

### Priority 3: Built-in Noise Exclusion Rules

Problem:

Mixed repositories often contain model code, training code, generated code, vendor code, or experimental directories that dilute business-chain outputs.

Upgrade:

The extension skill should explicitly prioritize:

- main
- routers
- controllers
- api
- request
- services
- bridge
- im
- mq
- kafka
- task entrypoints

And explicitly de-prioritize or delay:

- vendor
- third_party
- model_zoo
- training directories
- generated outputs
- static assets unrelated to communication analysis

Why it matters:

This keeps outputs closer to business knowledge instead of source-file inventories.

Recommended ownership:

- Base skill: should keep only generic exclusion principles
- Extension skill: should own the mixed-stack-specific exclusion lists

### Priority 4: Frontend-to-Backend Interface Mapping Pages

Problem:

The skill can already find frontend request declarations and backend route declarations, but it does not yet consistently produce a clear comparison page between them.

Upgrade:

Add an optional interface mapping output:

- frontend caller
- request path
- request method
- backend route
- code locations
- whether the match is direct, partial, or unresolved

Why it matters:

This makes interface chains much clearer for cross-team debugging and knowledge reuse.

Recommended ownership:

- Base skill: may adopt the interface-mapping output pattern later
- Extension skill: should own the first implementation because this problem is strongest in mixed-stack projects

### Priority 5: Cross-Stack Domain Page Upgrade

Problem:

The previous `domain -> service -> spec` structure is still slightly backend-centered when applied to mixed repositories.

Upgrade:

For mixed-stack domain pages, extend the structure to:

- domain
- entrypoints / surfaces
- systems / services / modules
- rules / specs

Entry surfaces may include:

- app screens
- H5 pages
- backend APIs
- Python tasks
- bridge entrypoints
- callbacks

Why it matters:

This makes domain pages more useful as team context instead of backend-only summaries.

Recommended ownership:

- Base skill: should keep the stable domain-level structure
- Extension skill: should provide the cross-stack adaptation layer

### Priority 6: Incremental Update Mode

Problem:

The current flow is stronger for first-pass analysis than for long-term maintenance.

Upgrade:

Add an incremental mode such as `update_codemap` that focuses only on changed areas and outputs:

- change scope
- newly confirmed evidence
- affected documents
- unresolved parts

Why it matters:

This is essential if the skill is used in a central knowledge repository over time.

Recommended ownership:

- Base skill: should own the generic incremental-update discipline
- Extension skill: should provide mixed-stack examples and update heuristics

## 3. What Should Go Into the Base Skill

The following improvements are generic enough that they should eventually enter the stable base workflow:

- workspace classification as a standard first step
- evidence-strength discipline
- incremental update discipline
- document impact tracking

Reason:

These are not unique to mobile, H5, or Python. They improve repository analysis quality in general.

## 4. What Should Stay in the Extension Skill

The following should remain in the extension layer unless the base skill later becomes explicitly stack-neutral:

- stack-specific classification rules for app / H5 / Python / mixed repos
- bridge-oriented communication analysis
- app-to-H5 and H5-to-native routing patterns
- IM / SSE / callback / task / mixed-entry communication examples
- mixed-stack noise exclusion rules
- cross-stack domain-page adaptations

Reason:

These are valuable, but they would pollute the simpler mental model of the base backend-oriented skill if made default too early.

## 5. Recommended Rollout Order

A practical rollout order is:

1. strengthen workspace layering
2. add evidence strength levels
3. add noise exclusion rules
4. add frontend-backend interface mapping pages
5. upgrade cross-stack domain pages
6. add incremental update mode

Reason:

The first three make outputs more reliable.
The next two make outputs more useful.
The last one makes the workflow sustainable.

## 6. Recommended Team Guidance

When teams use this extension skill, the most reliable order is:

1. classify the workspace first
2. do single-repo or single-subsystem codemap pages second
3. do cross-layer router-map pages third
4. do domain pages only after the lower-level evidence is already stable

This is especially important for domain analysis.

For mixed workspaces, domain pages are more reliable after the lower-level codemap and router-map outputs already exist.

## 7. Conclusion

The extension skill does not need a full redesign.

What it needs most now is:

- stronger boundaries
- stronger evidence labeling
- stronger long-term maintenance support

That is the difference between a skill that can analyze a mixed project once and a skill that a team can trust as part of a long-lived central knowledge repository.

