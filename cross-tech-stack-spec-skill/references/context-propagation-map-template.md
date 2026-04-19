# Context Propagation Map Template

This template is used only when `enable_context_propagation_map` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to trace auth and runtime context propagation such as token, userId, tenantId, device info, traceId, locale, and other request-scoped headers.

Typical goals:

- clarify where context originates
- clarify where context is injected or rewritten
- clarify where propagation breaks across layers
- reduce ambiguity in cross-team auth and trace debugging

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_context_propagation_map`
- auth, tenant, or trace issues are blocking understanding
- cross-team interface behavior depends on headers or request-scoped context

## 3. Preferred Output Structure

Recommended sections:

1. context scope
2. critical context items
3. header/context propagation table
4. injection and rewrite points
5. unresolved propagation gaps

## 4. Critical Context Items

List only context items that materially affect behavior.

Typical examples:

- Authorization token
- userId
- tenantId
- traceId
- requestId
- deviceId
- locale
- appVersion

## 5. Header/Context Propagation Table

Recommended table:

```md
| context item | caller-side source | injection/rewrite point | downstream carrier | consumer side | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- |
```

Possible carriers:

- HTTP header
- cookie
- bridge params
- thread-local context holder
- RPC metadata
- MQ header
- message payload field

## 6. Injection And Rewrite Points

Useful items to record:

- gateway filters
- interceptor or middleware injection
- auth parsing points
- tenant context binding
- trace context generation
- header rename or normalization
- fallback/default context creation

## 7. Trustworthiness Rule

Do not claim end-to-end propagation if an intermediate layer is not visible.

If a context item is visible at the caller and consumer side but the transfer path is missing:

- record the visible endpoints
- mark the middle propagation as unresolved
- keep the evidence level aligned with the visible code

## 8. Recommended Phrases

Use phrases like:

- `Caller-side header visible`
- `Context injected by interceptor`
- `Trace context created in middleware`
- `Propagation partially closed`
- `Downstream carrier unresolved in current scope`
