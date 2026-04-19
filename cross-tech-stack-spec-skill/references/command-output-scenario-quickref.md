# Cross-Tech Skill Quick Reference

This page helps users quickly decide:

- which extension or switch to use
- what it usually produces
- where to store the outputs
- what scenarios it fits best

## Extension enabled without optional switches

Typical outputs:

- workspace layering page
- mixed-stack noise-control page
- communication evidence matrix
- interface mapping page
- mixed-stack key route page

Recommended directory:

```text
mydocs/workspace/
mydocs/codemap/
mydocs/routermap/
```

Best for:

- app / H5 / Python / backend mixed workspaces
- defining boundaries before deeper analysis
- getting the main routes first

## `enable_contract_map`

Typical outputs:

- contract detail page
- request parameter table
- response field table
- caller/handler mapping page

Recommended directory:

```text
mydocs/extensions/
```

Best for:

- frontend/backend integration
- unclear parameter meaning
- contract-heavy interfaces

## `enable_gateway_map`

Typical outputs:

- gateway/forwarding route page
- gateway route list
- rewrite/auth summary
- landing-point mapping

Recommended directory:

```text
mydocs/extensions/
mydocs/routermap/
```

Best for:

- unclear gateway/BFF routing
- request paths that do not line up
- tracing forwarding chains

## `enable_field_lineage`

Typical outputs:

- field lineage page
- field flow table
- rename/transform notes

Recommended directory:

```text
mydocs/extensions/
```

Best for:

- large DTOs
- frequent field renames
- tracing field source and destination

## `enable_context_propagation_map`

Typical outputs:

- context propagation page
- header/token/user/tenant/trace propagation table
- rewrite/gap list

Recommended directory:

```text
mydocs/extensions/
```

Best for:

- auth issues
- trace troubleshooting
- header disputes

## `enable_error_semantics`

Typical outputs:

- error semantics page
- error mapping table
- retry/fallback/compensation summary

Recommended directory:

```text
mydocs/extensions/
```

Best for:

- production failure analysis
- failure path mapping
- complex exception translation

## `enable_async_contract_map`

Typical outputs:

- async contract page
- producer -> topic/queue -> consumer mapping
- payload/schema clue page

Recommended directory:

```text
mydocs/extensions/
mydocs/routermap/
```

Best for:

- Kafka / MQ / callback systems
- message contract analysis
- retry / DLQ / idempotency analysis

## `enable_external_dependency_dossier`

Typical outputs:

- external dependency dossier page
- provider / consumer list
- owner / version / risk clues

Recommended directory:

```text
mydocs/extensions/
mydocs/specs/
```

Best for:

- cross-team collaboration
- central knowledge repositories
- dependency governance

## `enable_interface_verification_assets`

Typical outputs:

- verification assets page
- swagger/openapi/postman/mock/contract test inventory
- coverage page

Recommended directory:

```text
mydocs/extensions/
mydocs/validation/
```

Best for:

- onboarding
- integration preparation
- test-material inventory

## Fully Enabled Mode

Typical output set:

- workspace layering
- noise control
- codemap overview
- multiple service deep dives
- multiple router-map pages
- interface mapping
- 8 deeper extension pages
- mixed-stack domain page
- validation page
- unresolved list
- index page

Recommended directory:

```text
mydocs/
  workspace/
  codemap/
  services/
  routermap/
  domain/
  extensions/
  validation/
```

Best for:

- high-value mixed-stack systems
- baseline packs for a team knowledge repository
- deeper documentation with higher token cost
