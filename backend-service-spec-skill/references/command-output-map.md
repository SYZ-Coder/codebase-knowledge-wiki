# Backend Skill Command Output Map

This page explains the typical outputs produced by the common commands in `backend-service-spec-skill`.

## `create_codemap`

Typical outputs:

- service inventory page
- service relationship overview
- technology and module layering page
- upstream/downstream dependency summary
- scope note for the current pass

Typical directory:

```text
mydocs/codemap/
```

## `service_deep_dive`

Typical outputs:

- single-service structure page
- interface inventory page
- module partition page
- dependency page
- service rules/spec page
- open gaps and risks page

Typical directory:

```text
mydocs/services/
```

## `crate_router_map`

Typical outputs:

- key route page
- segmented call path page
- synchronous call page
- asynchronous message page
- retry/compensation/realtime channel page
- route closure status page

Typical directory:

```text
mydocs/routermap/
```

## `build_domain_map`

Typical outputs:

- domain page
- domain -> service -> spec mapping page
- domain-level key route summary
- domain rules page
- fact boundary note

Typical directory:

```text
mydocs/domain/
```

## Lightweight Full Analysis

Typical output set:

- 1 scope page
- 1 codemap overview
- 1 to 2 service deep-dive pages
- 1 to 2 key route pages
- 1 index page

## Heavy Full Analysis

Typical output set:

- 1 scope page
- 1 codemap overview
- multiple service deep-dive pages
- multiple key route pages
- 1 domain page
- 1 validation page
- 1 unresolved list
- 1 index page
