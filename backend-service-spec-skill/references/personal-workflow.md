# Personal Workflow For Backend-Microservice Projects

## Who This Is For

This workflow is useful when an individual is:

- entering a microservice project for the first time
- trying to understand a legacy backend system
- turning scattered service knowledge into reusable documents
- trying to get more accurate, more detailed, and more complete results without wasting tokens

## Why A Workflow Matters

The same skill set produces much better results when used in order instead of randomly.

The value of using a workflow is:

1. build the big picture first, then go deeper, so boundaries are more accurate
2. collect service facts first, then lift them into chains and domains, so inference stays low
3. focus on high-value services before expanding globally, so the outputs get deeper without losing stability
4. control token usage better by avoiding deep scans of low-value areas too early

## Recommended Personal Workflow

### Step 1: Classify The Project Scope

Goal:

- determine whether this is a single service, a service family, or a large microservice workspace
- define `in scope / delayed / excluded` boundaries for the current run

### Step 2: Start With `create_codemap`

Recommended command:

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<map the service landscape>
```

### Step 3: Use `service_deep_dive` On High-Value Services

Recommended command:

```text
service_deep_dive: scope=<service-name>, goal=<deep-dive this service>
```

Prioritize services with:

- many controllers
- many feign interfaces
- many Kafka entries
- many external HTTP dependencies
- obvious placement on the main business path

### Step 4: Use `crate_router_map` On Key Chains

Recommended command:

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<trace the key routing chain>
```

### Step 5: Use `build_domain_map` Last

Recommended command:

```text
build_domain_map: scope=<system-or-service-group>, goal=<build the cross-service domain view>
```

## Recommended Usage Modes

### Lightweight Personal Mode

Best for:

- first entry into a project
- a lower-token first pass

Recommended order:

1. scope classification
2. `create_codemap`
3. `service_deep_dive` for 1 to 2 high-value services
4. `crate_router_map` for 1 to 2 key chains

### Deep Personal Mode

Best for:

- projects already confirmed to be important
- cases where the result will be added to a central knowledge repository

Recommended order:

1. scope classification
2. `create_codemap`
3. multiple `service_deep_dive` runs on high-value services
4. multiple `crate_router_map` runs on key chains
5. `build_domain_map`
6. validation pages and unresolved-chain summaries

## Rules That Improve Accuracy, Detail, And Coverage

### More Accurate

- service facts before domain lifting
- caller / handler evidence before chain claims
- use `partially closed` or `clue-level` when the chain is not closed

### More Detailed

- do not stop at service-name level
- break services into controller, feign, mq, external dependency, and module structure
- always deep-dive the key services

### More Complete

- do not look at HTTP only
- inspect Feign, Kafka, external HTTP, callback, and realtime channels together
- preserve the full set of outputs: landscape, service deep dives, routing maps, and domain pages

## When To Add The Extension Skill

If the project is no longer purely backend-microservice oriented and also includes:

- App
- H5
- Python
- gateways
- MQ / callback / task layers

then combine this workflow with:

- [cross-tech-stack-spec-skill](../../cross-tech-stack-spec-skill/README.md)

## Conclusion

For backend-microservice projects, the highest-value way to use this skill library is not a single all-purpose command.

It is usually:

- map the landscape first
- deep-dive the high-value services
- trace the key chains
- lift into domains only after the facts are stable

That is what most often produces results that are:

- more accurate
- more detailed
- more complete

and more reusable over time.

## Recommended Extra Reading

- [Command Output Map](./command-output-map.md)
