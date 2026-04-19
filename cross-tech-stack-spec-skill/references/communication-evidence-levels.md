# Communication Evidence Levels

This reference defines how to label evidence strength for communication analysis.

## 1. Purpose

Use evidence levels to prevent over-claiming when mapping communication across stacks.

This is especially important for:

- HTTP path mapping
- bridge contracts
- IM SDK usage
- SSE / WebSocket conclusions
- Kafka / MQ producer-consumer claims
- callback closure claims

## 2. Evidence Levels

### L1: Direct Declaration

Use `L1` when the communication point is directly declared in code.

Examples:

- `@GET`, `@POST`, route decorators, `include_router(...)`
- explicit HTTP client call sites with path or target
- explicit producer topic send calls
- explicit listener / consumer registration
- explicit SDK import plus concrete usage
- explicit `EventSourceResponse`, `WebSocket` handler, bridge handler registration

Recommended wording:

- `L1 direct declaration`
- `Directly declared in code`

### L2: Configuration Evidence

Use `L2` when the communication point is visible through config, base settings, or environment wiring, but not fully closed in executable call sites.

Examples:

- `baseURL`
- `kafka:` config blocks
- `redis:` config blocks
- SDK app id config
- queue/topic names visible in config only
- callback base path visible in gateway or route config

Recommended wording:

- `L2 configuration evidence`
- `Visible through configuration`

### L3: Clue-Level Evidence

Use `L3` when the repository only provides hints, naming signals, or structural clues.

Examples:

- directory names like `im`, `callback`, `mq`, `bridge`
- class names suggesting a communication role without a visible call site
- commented code mentioning a topic or endpoint
- placeholder adapter or wrapper without visible registration or invocation

Recommended wording:

- `L3 clue-level evidence`
- `Naming or structure suggests this communication point`

## 3. Closure States

Evidence level is not the same as closure state.

Recommended closure labels:

- `closed-loop confirmed`
- `send-side confirmed only`
- `receive-side confirmed only`
- `contract visible, provider not closed`
- `consumer visible, producer not closed`

## 4. Usage Rule

For each important communication item, try to record:

- communication type
- evidence level
- closure state
- count basis
- code locations

Recommended table:

```md
| type | from layer | to layer | point | evidence level | closure state | count basis | code locations |
| --- | --- | --- | --- | --- | --- | --- | --- |
```

## 5. Counting Rule

Never present a count without both:

- count basis
- evidence level

Example:

- `Kafka producers: 4, count basis = code-visible send call sites, evidence level = L1`
- `Bridge methods: 12, count basis = registered handlers + exposed wrappers, evidence level = mixed L1/L2`

## 6. Escalation Rule

If the evidence is weaker than the claim, downgrade the claim.

Examples:

- do not call an L3 signal a confirmed dependency
- do not call config-only topics a closed-loop producer-consumer relationship
- do not call a bridge wrapper a live app-native path unless registration or invocation is visible

## 7. Recommended Phrases

Use phrases like:

- `L1 direct declaration in code`
- `L2 configuration-backed evidence`
- `L3 clue-level only`
- `Closure not fully confirmed`
- `Evidence level downgraded because only one side is visible`
