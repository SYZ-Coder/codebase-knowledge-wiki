# Mixed Stack Routing Guidelines

## Typical Targets

- frontend + backend monorepo
- app + H5 + backend integration repo
- callback-heavy payment or auth flow spanning multiple stacks
- client + server + task + bridge mixed systems

## Required First Step

For large mixed workspaces, do not jump directly into route tracing.

Read `workspace-layering-template.md` first and establish:

- current workspace type
- subsystem boundaries
- representative targets for the current pass
- explicit exclusions for noise control

## Preferred Analysis Focus

- cross-layer route handoff
- frontend action to backend request path
- app bridge / webview callback path
- callback / webhook / task compensation path
- where evidence stops between stacks

## Route Types To Separate

Always separate:

- client/page interaction path
- frontend request path
- backend synchronous path
- async task or message path
- callback/webhook path
- bridge/native handoff path

## Route Output Recommendation

Recommended chain wording:

- `page -> api -> backend handler`
- `app click -> native route -> H5 page`
- `frontend submit -> backend -> task -> callback`
- `H5 bridge call -> native handler -> app action`

When evidence breaks, say where it stops.

## Evidence Risks

- do not merge page navigation and backend routing into one unnamed chain
- do not merge bridge callback and server callback
- do not assume the downstream stack behavior if only the upstream contract is visible
- keep `fact` and `clue` separation stricter when stacks change across layers
- add evidence level labels when the chain crosses stacks and only one side is visible
