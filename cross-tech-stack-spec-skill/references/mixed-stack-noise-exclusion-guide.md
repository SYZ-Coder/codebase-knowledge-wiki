# Mixed-Stack Noise Exclusion Guide

This reference defines how to reduce analysis noise in large mixed-stack workspaces without hiding important evidence.

## 1. Purpose

Use exclusion rules to improve focus, not to skip hard parts.

The goal is to:

- reduce unrelated scan volume
- prioritize business-chain evidence
- delay non-core directories until needed
- keep the current evidence boundary explicit

## 2. When To Use

Use this page when any of these are true:

- the workspace is large and mixed-stack
- the repository contains training code, vendor code, generated output, or model assets
- initial scans are dominated by low-signal files
- the user wants a business-facing codemap rather than a source-file inventory

## 3. Priority Scan Targets

Prefer scanning these first:

- `main`, `app`, `src/main`
- `routers`, `controllers`, `views`, `pages`, `screens`
- `api`, `request`, `network`, `services`
- `bridge`, `webview`, `callback`, `webhook`
- `mq`, `kafka`, `consumer`, `producer`, `task`, `worker`
- startup files, config-loading files, entry scripts

These usually contain the highest-signal evidence for routing, dependency, and communication analysis.

## 4. Typical Low-Priority Directories

These should usually be delayed or excluded in the first pass unless the user explicitly wants them:

- `vendor`
- `third_party`
- `node_modules`
- `dist`, `build`, `out`
- generated SDKs or generated code directories
- `model_zoo`
- training-only directories
- experiment-only directories
- static media asset directories
- archived or deprecated directories when clearly marked

## 5. Special Handling For AI / Python Repositories

In AI-heavy or Python-heavy repositories, these often need delayed treatment:

- model checkpoints
- training configs not referenced by runtime entrypoints
- experimental notebooks
- offline evaluation scripts
- research subtrees with no visible link to current service entrypoints

Do not exclude them forever.
Treat them as second-pass material unless current evidence shows they are part of the runtime chain.

## 6. What Must Not Be Auto-Excluded

Do not auto-exclude a directory if code shows it is part of the current runtime chain.

Examples:

- a `task` directory actually called by startup code
- a `callback` handler directory referenced by router registration
- a `model` directory imported directly by live inference code
- a generated client actually used by production request paths

If in doubt, downgrade to `delayed` rather than `excluded`.

## 7. Exclusion States

Use clear states such as:

- `in scope now`
- `delayed for second pass`
- `excluded in current pass`
- `clue-level only until linked to runtime path`

## 8. Documentation Rule

When exclusion is used, record it in the workspace-layering page.

Recommended table:

```md
| path or subsystem | state | reason | condition to re-include |
| --- | --- | --- | --- |
```

## 9. Trustworthiness Rule

Exclusion must never be silent.

Always state:

- what was excluded or delayed
- why it was excluded or delayed
- what evidence would bring it back into scope

This keeps the codemap honest and auditable.

## 10. Recommended Phrases

Use phrases like:

- `Delayed for second pass because no live route or communication evidence is visible yet`
- `Excluded in current pass to reduce non-business noise`
- `Re-include if startup wiring or runtime import path is later confirmed`
- `Currently clue-level only`
