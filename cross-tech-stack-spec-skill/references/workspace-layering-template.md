# Workspace Layering Template

This reference defines how to establish analysis boundaries before scanning a mixed-stack workspace.

## 1. When To Use

Use this page when any of these are true:

- the repository root contains multiple top-level systems
- the workspace contains app + H5 + backend + task layers together
- the user asks for cross-stack or whole-workspace analysis
- full-repo scanning would produce too much unrelated output

## 2. Required First Step

Before deep analysis, produce a workspace layering page.

Do this before:

- create_codemap for a large mixed workspace
- crate_router_map across stacks
- build_domain_map for a mixed business domain

## 3. Minimum Output Structure

Recommended structure:

```md
# Workspace Layering

## 1. Workspace Classification

- workspace type
- primary stacks present
- current analysis boundary

## 2. Subsystem Inventory

| subsystem | repository/path | stack type | role | entry files | status |
| --- | --- | --- | --- | --- | --- |

## 3. Recommended Analysis Order

1. ...
2. ...
3. ...

## 4. Current Exclusions

- ...

## 5. Evidence Boundary

- fact
- clue
- unresolved
```

## 4. Workspace Type Suggestions

Useful workspace-type labels:

- `single-service-repo`
- `single-stack-project`
- `multi-service-workspace`
- `mixed-stack-workspace`
- `platform-plus-clients-workspace`

Only use labels that the code layout supports.

## 5. Subsystem Table Rules

For each subsystem, try to capture:

- subsystem name
- repository or path
- stack type
- primary role
- entry files or entry directories
- whether it is in scope now

Examples of stack type:

- android
- ios
- flutter
- react-native
- h5
- web-admin
- java-service
- python-service
- python-worker
- gateway
- task-runner
- shared-sdk

Examples of role:

- client app
- H5 site
- admin console
- backend API
- async worker
- bridge layer
- shared component library

## 6. Recommended Analysis Order Rule

Prefer this order for mixed workspaces:

1. classify workspace
2. identify representative subsystems
3. map single-subsystem entrypoints and dependencies
4. map cross-layer communication
5. build higher-level domain pages only after lower-level evidence is stable

## 7. Exclusion Rule

The workspace layering page should explicitly state what is excluded for the current pass.

Also read `mixed-stack-noise-exclusion-guide.md` when the workspace contains a large amount of training code, vendor code, generated outputs, or research assets.

Typical exclusions:

- generated files
- vendor / third_party
- model_zoo
- training-only directories
- static assets unrelated to route or communication analysis
- archived or deprecated directories when clearly marked

## 8. Trustworthiness Rule

A workspace layering page should reduce noise, not hide unknowns.

Always state:

- what is definitely in scope
- what is currently excluded
- what is only a clue-level subsystem
- where the current evidence boundary stops

## 9. Recommended Phrases

Use phrases like:

- `Workspace classified as mixed-stack-workspace`
- `Representative subsystem selected for current pass`
- `Excluded in this pass to reduce noise`
- `Domain analysis deferred until subsystem codemaps are stable`
