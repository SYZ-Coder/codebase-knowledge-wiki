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

### 2. `build_domain_map`

Use it to:

- promote service-level facts into `domain -> service -> standard` knowledge
- support long-term central repository building

### 3. `crate_router_map`

Use it to:

- trace how one real request or message flows across services
- force separation of sync calls, async messages, timed compensation, and realtime channels

Also accepted:

- `create_router_map`

### 4. `service_deep_dive`

Use it to:

- document one high-value service in depth
- provide a stable factual base for later domain mapping

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
