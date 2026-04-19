# Communication Matrix Guidelines

This reference defines how to analyze communication across layers and how to present evidence with code locations.

## 1. Scope

Use this page when the goal includes any of the following:

- HTTP / REST communication mapping
- WebSocket / SSE / IM communication mapping
- callback / webhook mapping
- MQ / Kafka / async task communication mapping
- counting communication points that can be enumerated from code

## 2. Preferred Output Structure

When communication analysis is requested, try to produce these sections:

1. communication type inventory
2. communication matrix
3. communication count table
4. key end-to-end chains
5. evidence and code locations
6. current boundary

If the repository contains both caller-side contracts and handler-side routes, also consider adding an interface-mapping page.

## 3. Communication Type Inventory

Separate communication by type:

- `http`
- `rpc`
- `websocket`
- `sse`
- `im`
- `callback`
- `mq`
- `kafka`
- `task`
- `bridge`

Do not merge these into one generic `communication` block.

## 4. Communication Matrix Table

Recommended table:

```md
| type | from layer | to layer | provider/consumer or caller/handler | count | evidence level | closure state | code locations |
| --- | --- | --- | --- | --- | --- | --- | --- |
```

Examples of `from layer` / `to layer`:

- page -> backend
- app -> bridge
- frontend -> backend
- backend -> platform-service
- backend -> mq
- mq -> consumer
- callback -> backend handler
- task -> downstream service

## 5. Communication Count Table

Only count what can be stably enumerated from code or config.

Recommended table:

```md
| communication type | count basis | count | evidence level | evidence |
| --- | --- | --- | --- | --- |
```

Valid examples:

- number of HTTP client call sites visible in code
- number of controller callback endpoints visible in code
- number of WebSocket handlers visible in code
- number of producer topics visible in code/config
- number of Kafka listeners visible in code/config

Do not present runtime traffic volume unless code/config/metrics artifacts explicitly support it.

## 6. Interface Mapping Recommendation

Also read `interface-mapping-template.md` when communication clarity depends on caller-to-handler correspondence.

This is especially useful for:

- frontend api modules + backend routes
- app service declarations + backend handlers
- bridge wrappers + native handlers
- callback declarations + callback handlers

## 7. Code Location Rule

For every important communication conclusion, provide code locations.

Preferred evidence forms:

- source file path
- interface / handler / topic producer / listener path
- key method or class name
- config key path when communication is config-driven

Recommended wording:

- `confirmed in <file>:<symbol>`
- `visible at <path> via <class/method>`
- `count based on <set of files or handlers>`

## 8. Evidence Level Rule

Also read `communication-evidence-levels.md` when communication credibility matters.

Minimum recommendation:

- use `L1` for direct declarations
- use `L2` for configuration-backed evidence
- use `L3` for clue-level only evidence

Do not present an L3 signal as if it were a closed-loop confirmed communication path.

## 9. Trustworthiness Rule

To improve credibility:

- do not write communication counts without count basis
- do not write closed-loop claims without both sides or a defensible closure path
- always pair counts with code location evidence
- always state whether the count is `code-visible count` or `runtime-confirmed count`
- always downgrade claims when the visible evidence is weaker than the wording

## 10. Boundaries

Do not claim:

- runtime message volume
- actual online WebSocket session count
- actual IM traffic volume
- real production call frequency

unless the repository explicitly contains metrics/config/evidence that closes the loop.

## 11. Recommended Phrases

Use phrases like:

- `Code-visible communication count`
- `Currently enumerable from source`
- `Closed-loop confirmed`
- `Send-side confirmed only`
- `Receive-side confirmed only`
- `Contract visible, provider not yet closed`
- `L1 direct declaration in code`
- `L2 configuration-backed evidence`
- `L3 clue-level only`
