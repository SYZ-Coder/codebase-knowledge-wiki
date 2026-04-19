# H5 Project Guidelines

## Typical Targets

- SPA frontend
- SSR frontend
- management console
- portal / activity page repo
- Next.js / Nuxt / React / Vue / Vite style projects

## Preferred Analysis Focus

- page and route structure
- component and module boundaries
- state management
- API client layer
- websocket / sse / callback handling
- build/runtime config
- frontend to backend interaction paths

## Page Suggestions

Prefer these interpretations:

- `entrypoints.md`: route/page/component entrypoints
- `api.md`: request contract / response clarity / callback boundary
- `route-map.md`: page -> action -> api client -> backend -> state update chain
- `external-dependencies.md`: CDN, SDK, auth provider, analytics, third-party widgets

## Evidence Risks

- do not confuse frontend route with backend route
- do not infer DTO field clarity from a request wrapper alone
- do not infer runtime feature flags unless config closes the loop
- do not treat every fetch wrapper as an independent downstream system
