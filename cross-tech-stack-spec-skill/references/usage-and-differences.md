# Usage And Differences

This document explains how the cross-tech-stack skill should be used, how it differs from the base backend-service-spec-skill, and how the two should cooperate.

## 1. Positioning

`cross-tech-stack-spec-skill` is not a replacement for `backend-service-spec-skill`.
It is an explicit extension layer for repositories where backend-service terminology is too narrow.

Use it when analysis must cross technical layers such as:

- mobile client
- H5 / web frontend
- Python service / worker / task repo
- mixed-stack repositories spanning page, app, bridge, backend, callback, and task layers

## 2. Relationship To The Base Skill

### Base skill: `$backend-service-spec-skill`

Use as the default main workflow for:

- backend microservice projects
- service landscapes
- domain mapping
- router maps centered on service-to-service communication
- long-term central repository maintenance

### Extension skill: `$cross-tech-stack-spec-skill`

Use as an opt-in extension when the target is not well described by backend-service language alone.

It keeps the same four core action ideas:

- `create_codemap`
- `build_domain_map`
- `crate_router_map`
- `service_deep_dive`

But it reinterprets them in a stack-neutral way.

## 3. Core Difference

### What stays the same

- evidence discipline
- fact vs clue boundaries
- range identification mindset
- codemap / router-map / deep-dive / domain-map structure

### What changes

- wording becomes stack-neutral
- analysis focus shifts from service-only to project/module/page/task/bridge boundaries
- router mapping becomes cross-layer, not only service-to-service
- frontend route, app route, backend route, callback route, and task route are separated more carefully

## 4. When To Use Only The Base Skill

Use only `$backend-service-spec-skill` when:

- the repository is a normal backend microservice or service family
- service language already describes the codebase well
- there is no need to map across mobile / frontend / Python / bridge layers

## 5. When To Enable The Extension Skill

Enable `$cross-tech-stack-spec-skill` when:

- the user explicitly asks for cross-tech-stack expansion
- the repository is mobile-first
- the repository is H5 / frontend-first
- the repository is Python-first
- the route must cross page/app/client/backend/task/callback/bridge layers
- mixed-stack language is needed to avoid forcing everything into backend-service terms

## 6. Recommended Usage Patterns

### Pattern A: Base skill only

```text
Use $backend-service-spec-skill to map this backend microservice repository.
```

### Pattern B: Extension skill only, explicit

```text
Use $cross-tech-stack-spec-skill to analyze this Flutter project.
```

### Pattern C: Base workflow plus extension layer

```text
Use $backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

This is the most accurate wording for mixed-stack projects.

## 7. Example Commands

### Mobile project

```text
Please enable $cross-tech-stack-spec-skill and analyze this mobile app project.
```

### H5 project

```text
Please enable $cross-tech-stack-spec-skill and create a project codemap for this H5 repository.
```

### Python project

```text
Please enable $cross-tech-stack-spec-skill and do a deep dive on this Python worker project.
```

### Mixed-stack route

```text
Please use $backend-service-spec-skill as the base workflow and enable $cross-tech-stack-spec-skill to trace the page -> api -> callback -> task route.
```

## 8. Default Activation Rule

This skill is not implicitly invoked by default.
Users should explicitly enable it when needed.

That is intentional:

- it avoids polluting the stable backend-oriented skill
- it keeps the extension opt-in
- it makes the boundary between default workflow and mixed-stack adaptation clear

## 9. Communication Analysis Enhancement

When the goal includes HTTP, WebSocket, MQ, Kafka, IM, callback, or mixed communication analysis, explicitly request:

- communication type inventory
- communication matrix
- count basis
- code locations
- evidence level

Recommended wording:

```text
Please enable $cross-tech-stack-spec-skill and map HTTP, WebSocket, MQ, Kafka, and callback communication for this mixed-stack project, with code locations and count basis.
```

By default, the count should be understood as a code-visible count, not a runtime traffic count.
