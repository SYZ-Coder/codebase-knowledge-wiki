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

## Practical Operation Example

If the project repository is `D:\repo\sample-project`, the generated docs are in `D:\repo\sample-project\mydocs`, and the central knowledge repository is `D:\repo\central-knowledge-repo`, you can send these two instructions to the AI in order.

### Example 1: Import Into The Source Layer

```text
Please execute import_mydocs_to_sources:
source_repo=D:\repo\sample-project
source_docs=D:\repo\sample-project\mydocs
target_repo=D:\repo\central-knowledge-repo
batch=2026-04-20-sample-project
mode=safe
Requirements:
1. follow the rules in mydocs-to-central-knowledge-repo.md
2. import only into project/sources/codemap-import/<batch>/
3. generate IMPORT-README.md
4. do not directly update project/services, project/domains, project/standards, or openspec/specs
```

### Example 2: Recover Into Stable Knowledge Pages

```text
Please execute recover_sources_to_project:
target_repo=D:\repo\central-knowledge-repo
batch=2026-04-20-sample-project
recover=services,domains,standards
mode=guided
Requirements:
1. follow the rules in mydocs-to-central-knowledge-repo.md
2. read project/sources/codemap-import/2026-04-20-sample-project/IMPORT-README.md first
3. mark clue-level content explicitly
4. do not directly write into openspec/specs
```

## One-Sentence Rule

Let the skill generate `mydocs/`, but let the central repository absorb only reviewed, mapped, and properly recovered knowledge.
