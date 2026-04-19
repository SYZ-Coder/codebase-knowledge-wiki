# Error Semantics Map Template

This template is used only when `enable_error_semantics` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to document error codes, failure semantics, fallback behavior, retry points, timeout behavior, and compensation paths across an integration flow.

Typical goals:

- clarify which failures are visible in code
- clarify where error codes are defined or translated
- clarify retry, degrade, and compensation logic
- reduce ambiguity in cross-team failure debugging

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_error_semantics`
- production issues depend on failure-path understanding
- multiple layers may translate or swallow errors

## 3. Preferred Output Structure

Recommended sections:

1. error semantics scope
2. error code table
3. failure path notes
4. retry / fallback / compensation notes
5. unresolved failure gaps

## 4. Error Code Table

Recommended table:

```md
| error code / signal | source layer | meaning | consumer-side handling | retry/degrade/compensation | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- |
```

Possible `error code / signal` values:

- business error code
- HTTP status
- exception type
- callback failure signal
- MQ consumption failure
- timeout or circuit-breaker signal

## 5. Failure Path Notes

Useful items to record:

- where an error is thrown
- where an error is caught or wrapped
- where an error code is translated
- where fallback/default values are returned
- where failure is logged but not surfaced

## 6. Retry / Fallback / Compensation Notes

Useful items to record:

- retry policy or retry trigger
- degrade or fallback path
- compensation task or callback
- timeout handling
- dead-letter or manual intervention clues

## 7. Trustworthiness Rule

Do not infer business meaning for an error code unless the code, enum, message constant, or handling branch supports it.

If an error is visible but the final consumer-side behavior is not visible:

- record the visible failure point
- mark downstream handling as unresolved
- keep the evidence level aligned with the visible code

## 8. Recommended Phrases

Use phrases like:

- `Exception source visible`
- `Error code translated in adapter`
- `Fallback path confirmed in code`
- `Retry behavior partially visible`
- `Consumer-side handling unresolved in current scope`
