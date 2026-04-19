# Backend Service Skill Quick Start

This is a one-page quick-start guide for users who need to decide in one to three minutes when to use `backend-service-spec-skill` and what command to start with.

## 1. What It Is Best For

Use it first for:

- legacy systems
- microservice systems
- backend platform repositories
- service-family documentation
- central knowledge-repository building

If the project is clearly mobile, H5, Python-worker, or mixed-stack, combine it with:

- [cross-tech-stack-spec-skill](../../cross-tech-stack-spec-skill/README.md)

## 2. Remember One Invocation Name

Even though the directory name is now:

- `backend-service-spec-skill`

The actual invocation name is still:

- `backend-service-spec-skill`

Users should still type `backend-service-spec-skill` in commands.

## 3. Four Core Functions

- `create_codemap`: build the cross-service landscape and index layer
- `build_domain_map`: build `domain -> service -> standard` knowledge pages
- `crate_router_map`: trace one real request or message chain
- `service_deep_dive`: document one service in depth

## 4. How To Start The First Time

### If you want the system landscape first

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<landscape-goal>
```

### If you want one high-value service first

```text
service_deep_dive: scope=<service-name>, goal=<deep-dive-goal>
```

### If you want one request or message chain first

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<router-goal>
```

### If you want central-repository domain pages

```text
build_domain_map: scope=<system-or-service-group>, goal=<domain-goal>
```

## 5. Recommended Order

A stable order is usually:

1. `create_codemap`
2. `service_deep_dive`
3. `crate_router_map`
4. `build_domain_map`

The most important rule is:

- do single-service deep dives first
- then build domain pages

## 6. Minimal Command Set

### System-level landscape

```text
create_codemap: mode=service_landscape, scope=<system>, goal=<output service landscape>
```

### Service-level deep dive

```text
service_deep_dive: scope=<service>, goal=<output structure, APIs, dependencies, and standards>
```

### Chain-level analysis

```text
crate_router_map: scope=<entry-or-chain>, goal=<output sync, async, and compensation routes>
```

### Domain-level knowledge pages

```text
build_domain_map: scope=<system>, goal=<output domain -> service -> standard>
```

## 7. Typical Outputs Per Command

- `create_codemap`: service inventory, service relationship overview, technology/module layering
- `service_deep_dive`: single-service structure page, interface inventory, dependency page, rules/spec page
- `crate_router_map`: key route page, sync/async route page, closure status page
- `build_domain_map`: domain page, domain -> service -> standard mapping

See the full mapping here:

- [Command Output Map](./command-output-map.md)

## 8. Read Next

- [Usage Guide](./usage-guide.md)
- [Command Output Map](./command-output-map.md)
- [Quality Checklist](./quality-checklist.md)
- [Output Templates](./output-templates.md)
- [Workspace Classification](./workspace-classification.md)

