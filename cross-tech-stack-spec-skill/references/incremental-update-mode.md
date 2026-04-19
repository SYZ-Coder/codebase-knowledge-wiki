# Incremental Update Mode

This reference defines how to maintain mixed-stack codemaps and knowledge pages over time without re-scanning the whole workspace from scratch.

## 1. Purpose

Use incremental update mode when the repository or central knowledge base already has baseline documents and the goal is to update only the changed areas.

## 2. When To Use

Use this mode when any of these are true:

- baseline codemap pages already exist
- router-map pages already exist and only some subsystems changed
- a team wants low-cost maintenance of a central knowledge repository
- the user asks to update or refresh existing project knowledge instead of starting over

## 3. Recommended Intent Label

Recommended wording:

- `update_codemap`
- `incremental codemap refresh`
- `update router-map for changed scope`
- `update domain page for changed surfaces`

## 4. Required First Step

Before updating documents, identify change scope.

Recommended scope inputs:

- changed repository or subsystem
- changed directories
- changed communication types
- changed domain surfaces
- changed interfaces or contracts

If no scope is available, first produce a change-scope note instead of silently re-running the whole workflow.

## 5. Minimum Output Structure

Recommended structure:

```md
# Incremental Update Note

## 1. Change Scope

- changed area
- current pass boundary

## 2. Newly Confirmed Evidence

- ...

## 3. Affected Documents

| document | action | reason |
| --- | --- | --- |

## 4. Unresolved or Deferred Parts

- ...

## 5. Suggested Next Update

- ...
```

## 6. Document Actions

Useful action labels:

- `create`
- `update`
- `keep`
- `split`
- `archive-note`

## 7. Update Rules

When updating existing knowledge pages:

- prefer patching the impacted pages instead of re-generating everything
- keep unchanged sections stable when evidence has not changed
- add update notes only where they help trace change history
- preserve fact/clue boundaries from the earlier version

## 8. Change-Scope Rule

Do not claim a repository-wide refresh if only part of the repository was re-checked.

Use phrases like:

- `Updated for current change scope only`
- `Unchanged areas not re-verified in this pass`
- `Only affected communication paths were refreshed`

## 9. Mixed-Stack Update Targets

Common mixed-stack update targets include:

- new app or H5 entry surfaces
- changed bridge contracts
- changed backend request paths
- changed callback handlers
- changed Kafka or MQ producers/consumers
- changed domain entry surfaces

## 10. Trustworthiness Rule

An incremental update should make clear:

- what was re-checked
- what was not re-checked
- which conclusions are newly confirmed
- which old conclusions remain untouched

## 11. Recommended Phrases

Use phrases like:

- `Incremental update for current scope`
- `Baseline documents reused`
- `Only changed surfaces re-verified`
- `Unaffected pages kept as-is`
- `Repository-wide refresh not performed in this pass`
