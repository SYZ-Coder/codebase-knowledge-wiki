# Async Contract Map Template

This template is used only when `enable_async_contract_map` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to document async communication contracts such as producer, topic or queue, consumer, payload schema, retry behavior, dead-letter handling, idempotency rules, and callback-based async flows.

Typical goals:

- clarify which side produces and which side consumes
- clarify visible payload schema and routing keys
- clarify retry, DLQ, and idempotency behavior
- reduce ambiguity in async integration debugging

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_async_contract_map`
- Kafka, MQ, or callback flows are important to the current analysis
- async behavior is blocking system understanding or failure analysis

## 3. Preferred Output Structure

Recommended sections:

1. async scope
2. producer -> topic/queue -> consumer table
3. payload schema notes
4. retry / DLQ / idempotency notes
5. unresolved async gaps

## 4. Producer -> Topic/Queue -> Consumer Table

Recommended table:

```md
| producer side | topic/queue/callback | trigger condition | payload/schema clue | consumer side | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- |
```

Possible `topic/queue/callback` values:

- Kafka topic
- MQ topic
- queue name
- webhook callback path
- event bus subject

## 5. Payload Schema Notes

Useful items to record:

- visible message fields
- message key or partition key
- event type or tag
- serialization format clues
- callback body structure

## 6. Retry / DLQ / Idempotency Notes

Useful items to record:

- producer retry settings
- consumer retry settings
- dead-letter topic or queue clues
- idempotency key or dedup logic
- manual reprocessing or compensation clues

## 7. Trustworthiness Rule

Do not claim an end-to-end async chain unless producer, channel, and consumer evidence are visible.

If only one or two sides are visible:

- record the visible side(s)
- mark the chain as partially closed or unresolved
- keep the evidence level aligned with the visible code or config

## 8. Recommended Phrases

Use phrases like:

- `Producer-side send visible`
- `Topic name confirmed in config`
- `Consumer handler visible`
- `Payload schema partially visible`
- `DLQ behavior unresolved in current scope`
