# External Dependency Dossier Template

This template is used only when `enable_external_dependency_dossier` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to document dependencies involving external teams, third-party systems, or platform services across interface boundaries.

Typical goals:

- clarify who provides and who consumes an interface
- clarify which contracts and code locations are visible
- record owner clues, dependency scope, and change risk
- reduce ambiguity in cross-team onboarding and dependency inventory

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_external_dependency_dossier`
- cross-team or third-party dependencies are important to the current analysis
- the repository acts as a provider or consumer across team boundaries

## 3. Preferred Output Structure

Recommended sections:

1. dependency scope
2. provider/consumer dossier table
3. contract and owner clues
4. version/risk/change notes
5. unresolved dependency gaps

## 4. Provider/Consumer Dossier Table

Recommended table:

```md
| dependency name | provider side | consumer side | interface/channel | visible contract/code | owner clue | risk note | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
```

Possible `interface/channel` values:

- HTTP API
- callback
- Kafka topic
- MQ queue
- RPC interface
- SDK integration
- webhook

## 5. Contract And Owner Clues

Useful items to record:

- swagger/openapi/doc links visible in repo
- interface path or topic names
- team name clues in package, config, or comments
- owner or maintainer clues in code, docs, or config
- internal vs third-party dependency notes

## 6. Version / Risk / Change Notes

Useful items to record:

- visible version or SDK version
- unstable contract clues
- external SLA or timeout clues
- change sensitivity or migration note
- one-sided visibility risk

## 7. Trustworthiness Rule

Do not invent provider ownership or team mapping if the repository does not show it.

If only one side of a dependency is visible:

- record the visible side
- mark the other side as unresolved or clue-level only
- keep the evidence level aligned with the visible code or config

## 8. Recommended Phrases

Use phrases like:

- `Provider-side contract visible`
- `Consumer-side integration visible`
- `Owner clue visible in config`
- `Version clue partially visible`
- `Counterparty unresolved in current scope`
