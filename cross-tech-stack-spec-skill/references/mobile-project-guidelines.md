# Mobile Project Guidelines

## Typical Targets

- Android native
- iOS native
- Flutter
- React Native
- uni-app
- Taro
- hybrid app shells

## Preferred Analysis Focus

- app/module structure
- screen/page entrypoints
- navigation routes
- state management boundaries
- network layer and API contracts
- local storage / cache / config
- push / callback / bridge / WebView boundaries

## Page Suggestions

Prefer these interpretations:

- `overview.md`: app or module positioning
- `entrypoints.md`: screen/page/activity/view-controller/router entrypoints
- `dependencies.md`: module, SDK, native capability, runtime dependency map
- `api.md`: HTTP contract + bridge contract + callback contract
- `route-map.md`: screen -> action -> network -> callback -> page update chain

## Evidence Risks

- do not infer navigation flow from folder names alone
- do not infer native bridge behavior without visible contract code
- do not infer app lifecycle handling unless code confirms it
- do not confuse local state updates with backend route transitions
