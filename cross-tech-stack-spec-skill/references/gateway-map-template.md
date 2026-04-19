# Gateway Map Template

This template is used only when `enable_gateway_map` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to document gateway, BFF, forwarding, path rewrite, auth gates, and final route landing points.

Typical goals:

- explain why request paths do not match final handlers directly
- clarify forwarding layers across teams
- identify rewrite and auth checkpoints

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_gateway_map`
- the repository contains gateway or BFF routing logic
- path mismatch is blocking interface understanding

## 3. Preferred Output Structure

Recommended sections:

1. gateway scope
2. gateway route table
3. rewrite / forward chain
4. auth and policy checkpoints
5. unresolved routing gaps

## 4. Gateway Route Table

Recommended table:

```md
| entry path | method | gateway/bff layer | rewrite/forward rule | final destination | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- |
```

## 5. Rewrite / Forward Chain

Recommended chain format:

- client path -> gateway path -> rewritten path -> destination handler

If one layer is missing, say where the chain stops.

## 6. Auth And Policy Checkpoints

Useful items to record:

- auth middleware
- tenant or user context injection
- traffic control or allow-list logic
- version or gray-route conditions

## 7. Trustworthiness Rule

Do not claim a final landing handler unless it is visible through code or config.

If only the gateway layer is visible:

- record the gateway rule
- mark final destination unresolved
- keep the evidence level aligned with the visible layer

## 8. Recommended Phrases

Use phrases like:

- `Gateway entry path visible`
- `Rewrite rule confirmed in config`
- `Forward chain partially closed`
- `Final destination unresolved in current scope`
- `Auth checkpoint visible before forwarding`
