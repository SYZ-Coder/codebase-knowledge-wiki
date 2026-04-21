# Backend Service Spec Skill

An open skill for backend-oriented, microservice, legacy-system, and platform-repository knowledge mapping.

Its goal is not one-off analysis. It is designed to turn code facts, service boundaries, routing knowledge, and communication structure into reusable central knowledge-repository content.

## Important Note

The directory name is `backend-service-spec-skill`, so it is easier to distinguish from the cross-tech-stack extension skill.

But the actual skill invocation name remains:

- `backend-service-spec-skill`

That means users should still say:

```text
Use backend-service-spec-skill to analyze this backend microservice project.
```

Do not use the directory name as the invocation name.

If you want the shortest starting point, read:

- [Quick Start](./references/quick-start.md)
- [Personal Workflow For Backend-Microservice Projects](./references/personal-workflow.md)
- [Command Output Map](./references/command-output-map.md)
- [Command Quick Reference](./references/command-output-scenario-quickref.md)

## When To Use It

Use this skill for:

- legacy systems
- microservice systems
- backend platform repositories
- service-family knowledge mapping
- central knowledge-repository building
- backend-oriented cross-service routing analysis

If the project is clearly app-first, H5-first, Python-first, or mixed-stack, combine it with:

- [cross-tech-stack-spec-skill](../cross-tech-stack-spec-skill/README.md)

## Four Core Functions

### 1. `create_codemap`

Use it to:

- generate a cross-service map
- clarify service inventory, responsibility boundaries, dependencies, and upstream/downstream roles
- provide the index layer for deeper documentation

How to use it:

- start with it when you have just inherited a system and do not yet know the key services, gateways, jobs, or shared modules
- set `scope` to the system name, service group, or the workspace slice you have confirmed
- set `goal` to the purpose of the pass, such as service-landscape mapping, high-value-service identification, or building an index for later deep dives

Concrete example:

```text
Use backend-service-spec-skill to run create_codemap on this payment platform project.
Requirements:
1. scope=payment-platform
2. mode=service_landscape
3. identify services, gateway entries, scheduled jobs, and message consumers first
4. output service boundaries, upstream/downstream dependencies, and high-value service candidates
5. stay strictly grounded in code facts, and mark anything not fully verified as clue-level
```

Typical situations:

- you are entering the repository for the first time
- you need a full-system map
- you want to decide which services deserve deep dives next

### 2. `build_domain_map`

Use it to:

- promote service-level facts into `domain -> service -> standard` knowledge
- support long-term central repository building

How to use it:

- use it after `create_codemap` and a few `service_deep_dive` runs, once service facts are stable enough
- set `scope` to the system, service group, or business line you want to consolidate
- set `goal` to domain-level organization, central-knowledge-repository structuring, or domain-rule capture

Concrete example:

```text
Use backend-service-spec-skill to run build_domain_map for the order-fulfillment system.
Requirements:
1. scope=order-fulfillment
2. build on the existing codemap and key service deep-dive results
3. output a domain -> service -> rules/specs mapping
4. separate transaction, fulfillment, after-sales, and notification domains
5. do not duplicate service pages; only consolidate and roll facts upward
```

Typical situations:

- the repository has already been mapped once and is ready for knowledge-base consolidation
- the team wants shared business-domain boundaries
- you need durable domain pages for long-term maintenance

### 3. `crate_router_map`

Use it to:

- trace how one real request or message flows across services
- force separation of sync calls, async messages, timed compensation, and realtime channels

Also accepted:

- `create_router_map`

How to use it:

- use it when you already know the entry API, business action, message topic, or callback and want the full route
- set `scope` to an entry endpoint, business action, topic, callback, or key business chain
- set `goal` to tracing an order submission flow, a refund async route, a login/auth path, or another concrete chain

Concrete example:

```text
Use backend-service-spec-skill to run crate_router_map for the "user submits order" chain.
Requirements:
1. scope=create-order
2. trace from the gateway entry through order, inventory, discount, MQ publish, and payment pre-create
3. separate synchronous calls, asynchronous messages, and compensation jobs clearly
4. output code locations, invocation style, evidence source, and closure status for each hop
5. mark any missing evidence as unresolved
```

Typical situations:

- you are debugging a real business chain
- you are preparing interface integration work
- you need to untangle sync and async routes

### 4. `service_deep_dive`

Use it to:

- document one high-value service in depth
- provide a stable factual base for later domain mapping

How to use it:

- use it after `create_codemap` identifies a key service worth deeper analysis
- set `scope` directly to the service name, module name, or the target subservice in the repository
- set `goal` to interface mapping, module layering, dependency analysis, or service-rule extraction

Concrete example:

```text
Use backend-service-spec-skill to run service_deep_dive on order-service.
Requirements:
1. scope=order-service
2. map controller / application / domain / infrastructure layers
3. output core interfaces, main dependencies, database access points, and message producers/consumers
4. show its calling relationships with inventory, payment, and marketing
5. strictly separate code facts, inferred conclusions, and pending clues
```

Typical situations:

- the service is a key node in several business chains
- you are preparing refactoring, handoff, or risk review
- you need reliable service pages before domain-level consolidation

## How The Four Functions Work Together

The most common sequence is:

1. use `create_codemap` for the global view
2. use `service_deep_dive` on key services
3. use `crate_router_map` on key business chains
4. finish with `build_domain_map` for domain-level consolidation

Full example:

```text
Use backend-service-spec-skill to run a structured analysis of this ecommerce backend project.
Requirements:
1. start with create_codemap to identify core services and dependencies
2. run service_deep_dive on order-service and payment-service
3. run crate_router_map for "submit order" and "payment callback"
4. finish with build_domain_map to organize facts into transaction, fulfillment, payment, and after-sales domains
5. keep all outputs strictly grounded in code evidence
```

## Most Common Commands

### Cross-service landscape

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<analysis-goal>
```

### Cross-service domain map

```text
build_domain_map: scope=<system-or-service-group>, goal=<domain-analysis-goal>
```

### Request or message chain

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<router-analysis-goal>
```

### Single-service deep dive

```text
service_deep_dive: scope=<service-name>, goal=<deep-dive-goal>
```

## What Each Command Usually Produces

- `create_codemap`: service inventory, service relationship overview, technology/module layering
- `service_deep_dive`: single-service structure page, interface inventory, dependency page, service rules/spec page
- `crate_router_map`: key route page, synchronous/asynchronous route segments, closure status page
- `build_domain_map`: domain page, domain -> service -> spec mapping, domain-level rules

See the full mapping here:

- [Command Output Map](./references/command-output-map.md)

## Recommended Workflow

Recommended order:

1. classify workspace scope first
2. run `create_codemap`
3. run `service_deep_dive` on key services
4. run `crate_router_map` on key chains
5. build `build_domain_map` only after service facts stabilize

The most important rule is:

- do single-service deep dives first
- then build cross-service domain pages

That sequence produces more accurate and more reusable documentation.

## Recommended Personal Flow

If you are personally entering a backend-microservice project for the first time, the best next read is:

- [Personal Workflow For Backend-Microservice Projects](./references/personal-workflow.md)

That guide explains:

- why the workflow improves accuracy
- why it improves detail
- why it improves coverage
- how to use a lightweight mode with lower token cost
- how to use a deeper mode when building durable knowledge assets

## Suggested Output Structure

Process artifacts usually go into:

```text
mydocs/
  codemap/
  routermap/
  context/
  specs/
```

Stable knowledge pages usually go into:

```text
project/
  services/
  domains/
  standards/
  index/
```

If the team uses a central knowledge repository, read next:

- [From `mydocs` To A Central Knowledge Repository](../references/mydocs-to-central-knowledge-repo.md)
- [Central Knowledge Repository And OpenSpec Collaboration](../references/knowledge-repo-and-openspec-collaboration.md)

## Read Next

- [Quick Start](./references/quick-start.md)
- [Personal Workflow For Backend-Microservice Projects](./references/personal-workflow.md)
- [Command Output Map](./references/command-output-map.md)
- [Command Quick Reference](./references/command-output-scenario-quickref.md)
- [Skill Metadata](./SKILL.md)
- [Usage Guide](./references/usage-guide.md)
- [Quality Checklist](./references/quality-checklist.md)
- [Output Templates](./references/output-templates.md)
- [Workspace Classification](./references/workspace-classification.md)

## Relationship To The Extension Skill

If the project is clearly mixed-stack, use:

```text
Use backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

Extension entry points:

- [Extension README](../cross-tech-stack-spec-skill/README.md)
- [Detailed Extension Usage Guide](../cross-tech-stack-spec-skill/references/extension-usage-guide.md)
