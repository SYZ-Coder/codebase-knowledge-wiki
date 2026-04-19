# Backend Skill Quick Reference

This page helps users quickly decide:

- which command to use
- what it usually produces
- where to store the outputs
- what scenarios it fits best

## `create_codemap`

Typical outputs:

- service inventory page
- service relationship overview
- technology/module layering page
- upstream/downstream summary

Recommended directory:

```text
mydocs/codemap/
```

Best for:

- first-time system entry
- getting the overall structure first
- identifying high-value services

## `service_deep_dive`

Typical outputs:

- single-service structure page
- interface inventory page
- module partition page
- dependency page
- service rules/spec page

Recommended directory:

```text
mydocs/services/
```

Best for:

- high-value service analysis
- understanding one service deeply
- preparing later route or domain work

## `crate_router_map`

Typical outputs:

- key route page
- synchronous route page
- asynchronous route page
- retry/compensation page
- closure status page

Recommended directory:

```text
mydocs/routermap/
```

Best for:

- tracing one real request
- tracing one message flow
- separating sync / async / compensation paths

## `build_domain_map`

Typical outputs:

- domain page
- domain -> service -> spec mapping page
- domain route summary
- domain rules page

Recommended directory:

```text
mydocs/domain/
```

Best for:

- team central knowledge repositories
- cross-service domain abstraction
- lifting service facts into reusable knowledge pages

## Lightweight Full

Typical output set:

- scope page
- codemap overview
- 1 to 2 service deep dives
- 1 to 2 key route pages
- index page

Recommended directory:

```text
mydocs/
  codemap/
  services/
  routermap/
```

Best for:

- first pass on a project
- lower token cost
- building a reliable first baseline

## Heavy Full

Typical output set:

- scope page
- codemap overview
- multiple service deep dives
- multiple key route pages
- domain page
- validation page
- unresolved list
- index page

Recommended directory:

```text
mydocs/
  codemap/
  services/
  routermap/
  domain/
  validation/
```

Best for:

- core system knowledge capture
- central knowledge repository building
- building a more complete long-term baseline
