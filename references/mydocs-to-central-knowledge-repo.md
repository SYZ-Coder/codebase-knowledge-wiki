# From `mydocs` To A Central Knowledge Repository

## Purpose

This page explains how to use skill outputs after analysis is complete.

The key idea is:

- let the skill generate process artifacts into `mydocs/`
- then migrate and recover those artifacts into a long-term central knowledge repository

Do not treat `mydocs/` as the final destination for team knowledge.

## Recommended Mapping Rules

Use these mappings by default:

- `mydocs/codemap/`
  -> `project/sources/codemap-import/<batch>/`

- `mydocs/routermap/`
  -> first `project/sources/codemap-import/<batch>/`
  -> then recover into:
  - `project/services/<service>/`
  - `project/domains/<domain>/`
  - `project/architecture/`

- `mydocs/services/`
  -> `project/services/<service>/`

- `mydocs/domain/`
  -> `project/domains/<domain>/`

- `mydocs/specs/`
  -> first `project/standards/`
  -> then, only if mature enough, `openspec/specs/`

## Recommended Two-Step Workflow

### Step 1: Import Into The Source Layer

```text
Please execute import_mydocs_to_sources:
source_repo=<project-repo>
source_docs=<path-to-mydocs>
target_repo=<central-knowledge-repo>
batch=<YYYY-MM-DD-workspace-or-topic>
mode=safe
```

### Step 2: Recover Into Stable Knowledge Pages

```text
Please execute recover_sources_to_project:
target_repo=<central-knowledge-repo>
batch=<YYYY-MM-DD-workspace-or-topic>
recover=services,domains,standards
mode=guided
```

## One-Sentence Rule

Let the skill generate `mydocs/`, but let the central repository absorb only reviewed, mapped, and properly recovered knowledge.
