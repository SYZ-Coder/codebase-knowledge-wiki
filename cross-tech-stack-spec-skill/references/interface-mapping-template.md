# Interface Mapping Template

This reference defines how to build a frontend-to-backend or cross-layer interface mapping page.

## 1. Purpose

Use this page when the goal is to make request chains and interface ownership easier to understand.

Typical targets:

- H5 / frontend request layer to backend route layer
- app request declaration to backend API layer
- page action to API wrapper to backend handler
- bridge call to native handler to downstream request

## 2. When To Use

Use this page when any of these are true:

- the user asks whether interface paths are clear
- the repo contains both request declarations and backend handlers
- cross-team collaboration depends on knowing who owns which interface
- communication mapping alone is not enough to show caller-handler correspondence

## 3. Preferred Output Structure

Recommended sections:

1. current mapping boundary
2. interface mapping table
3. unresolved interfaces
4. confidence and evidence notes

## 4. Mapping Table

Recommended table:

```md
| caller side | request path | method | wrapper / sdk / api fn | handler side | mapping status | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- | --- |
```

Examples of `caller side`:

- page component
- frontend api module
- app service interface
- bridge wrapper
- python client module

Examples of `handler side`:

- backend controller
- FastAPI router
- gateway route
- callback handler
- native handler

## 5. Mapping Status Labels

Use clear labels such as:

- `direct match`
- `path match, handler not closed`
- `wrapper visible, route unresolved`
- `contract visible, provider not found`
- `partial match`

## 6. Evidence Rule

For each important row, provide:

- code-visible request declaration or invocation
- code-visible handler declaration if found
- evidence level
- exact code locations when practical

Do not claim a direct mapping unless both sides are visible or a clearly defensible closure path exists.

## 7. Matching Hints

Useful matching signals include:

- same HTTP method and path
- same route prefix plus handler suffix
- wrapper function naming plus imported backend contract
- gateway path forwarding config
- shared constant or route registration source

These are hints, not automatic proof.

## 8. Trustworthiness Rule

If only the caller side is visible:

- record the contract
- mark the provider as unresolved
- keep the evidence level aligned with what is actually visible

If only the handler side is visible:

- record the handler
- mark the caller as unresolved
- do not invent a frontend or app owner

## 9. Recommended Phrases

Use phrases like:

- `Caller-side contract visible`
- `Handler-side route visible`
- `Direct match confirmed by method + path`
- `Only wrapper layer visible in current repository`
- `Provider not closed in current scope`
