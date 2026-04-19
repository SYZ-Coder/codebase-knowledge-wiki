# Python Project Guidelines

## Typical Targets

- Flask / Django / FastAPI services
- Celery / worker repos
- ETL / batch / cron projects
- script collections
- ML inference / data processing repos

## Preferred Analysis Focus

- app/task entrypoints
- router/view/task/module boundaries
- config loading
- pipeline or processing flow
- scheduler / worker / queue boundaries
- data input/output boundaries
- callback / webhook / task retry logic

## Page Suggestions

Prefer these interpretations:

- `entrypoints.md`: app startup, cli entry, task entry, scheduler entry
- `call-chain.md`: request -> handler -> service -> task -> persistence flow
- `route-map.md`: web route / task route / callback route / processing route
- `mq.md`: celery / queue / event usage if present

## Noise Control Reminder

For AI-heavy or worker-heavy repositories, also read `mixed-stack-noise-exclusion-guide.md` when the repository contains:

- training-only directories
- model_zoo trees
- experiment subtrees
- notebooks
- offline evaluation scripts
- generated outputs unrelated to live runtime entrypoints

Do not exclude these silently.
Document them as delayed or excluded for the current pass.

## Evidence Risks

- do not infer deployed topology from package names alone
- do not infer scheduler relationships unless config or startup code confirms them
- do not confuse script import dependency with runtime invocation chain
- do not describe a data pipeline as closed-loop if only one stage is visible
