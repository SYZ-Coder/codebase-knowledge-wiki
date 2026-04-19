# Field Lineage Map Template

This template is used only when `enable_field_lineage` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to trace important fields across caller-side params, DTOs, service models, message payloads, and downstream contracts.

Typical goals:

- clarify where a field originates
- clarify where names change across layers
- clarify visible transformation points
- reduce ambiguity in cross-layer field tracing

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_field_lineage`
- the integration flow depends on a few critical fields
- naming mismatch or field provenance is blocking understanding

## 3. Preferred Output Structure

Recommended sections:

1. lineage scope
2. critical field list
3. field lineage table
4. transformation and rename notes
5. unresolved lineage gaps

## 4. Critical Field List

List only fields that materially affect understanding.

Typical examples:

- id fields
- status fields
- tenant or user context fields
- routing keys
- callback correlation ids
- business identifiers

## 5. Field Lineage Table

Recommended table:

```md
| business meaning | caller-side field | intermediate field(s) | handler/service field | downstream field | transformation note | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- | --- |
```

Possible intermediate layers:

- page form model
- app view model
- api wrapper param
- request DTO
- domain model
- MQ payload
- callback payload
- persistence entity

## 6. Transformation And Rename Notes

Useful items to record:

- field rename points
- type conversion points
- enum or dictionary mapping points
- null/default handling points
- flattening or nesting changes

## 7. Trustworthiness Rule

Do not infer hidden lineage across missing layers.

If two fields look related by naming but the connecting code is not visible:

- record them as clue-level only
- mark the lineage as unresolved
- keep the evidence level aligned with the visible code

## 8. Recommended Phrases

Use phrases like:

- `Caller-side source visible`
- `Rename point confirmed in mapper`
- `Transformation visible in adapter`
- `Downstream mapping partially closed`
- `Lineage unresolved in current scope`
