# Optional Switch-Controlled Interface Extensions

This page lists deeper interface and cross-team communication analysis capabilities that should remain optional.

These are not part of the default mixed-stack workflow.
They should be enabled only when the user explicitly asks for them.

## 1. Design Rule

All capabilities on this page are:

- opt-in
- switch-controlled
- disabled by default
- intended to extend, not replace, the existing skill flow

## 2. Recommended Switches

### `enable_contract_map`

Purpose:

- map request and response contracts in more detail
- document required fields, optional fields, enums, and unresolved fields

Useful outputs:

- request field table
- response field table
- enum source note
- unresolved field note

Best for:

- frontend-backend joint debugging
- unclear parameter semantics
- contract-heavy APIs

### `enable_gateway_map`

Purpose:

- map gateway, BFF, forwarding, path rewrite, auth gates, and final landing handlers

Useful outputs:

- gateway route table
- rewrite chain
- auth or traffic-control checkpoints
- final destination note

Best for:

- multi-team collaboration
- path mismatch debugging
- gateway-heavy architectures

### `enable_field_lineage`

Purpose:

- trace important fields across caller DTO, handler DTO, service model, message payload, and downstream contract

Useful outputs:

- field lineage table
- transformation points
- name mismatch notes

Best for:

- large DTOs
- naming inconsistencies
- field provenance debugging

### `enable_context_propagation_map`

Purpose:

- trace auth and runtime context such as token, userId, tenantId, traceId, and device info across multiple layers
- record where these context items are injected, rewritten, propagated, or lost

Useful outputs:

- header/context propagation table
- auth/context injection points
- trace context path
- unresolved propagation gaps

Best for:

- login-state debugging
- traceability debugging
- tenant-context issues
- cross-team header conventions

### `enable_error_semantics`

Purpose:

- document error codes, exceptions, HTTP statuses, callback failures, and other failure semantics
- record retry, fallback, timeout, compensation, and error translation points

Useful outputs:

- error code table
- failure path notes
- retry / fallback / compensation notes
- unresolved failure gaps

Best for:

- production issue analysis
- unclear failure behavior
- cross-team troubleshooting
- multi-layer error translation or fallback logic

### `enable_async_contract_map`

Purpose:

- document async communication contracts for Kafka, MQ, callback, webhook, or event-bus flows
- clarify producer, channel, consumer, payload, retry, DLQ, and idempotency behavior

Useful outputs:

- producer -> topic/queue -> consumer table
- payload schema notes
- retry / DLQ / idempotency notes
- unresolved async gaps

Best for:

- Kafka / MQ-heavy systems
- callback-heavy systems
- async debugging
- long-term async knowledge capture

### `enable_external_dependency_dossier`

Purpose:

- build a dossier for interfaces involving external teams, platform capabilities, or third-party systems
- capture provider/consumer roles, contract locations, owner clues, versions, and risk notes

Useful outputs:

- provider/consumer dossier table
- contract and owner clues
- version/risk/change notes
- unresolved dependency gaps

Best for:

- central knowledge repositories
- dependency inventory
- cross-team onboarding
- third-party dependency governance

### `enable_interface_verification_assets`

Purpose:

- connect interface knowledge with swagger, openapi, postman, apifox, mock data, contract tests, and other verification assets
- identify which flows are documented or tested and which still lack visible verification material

Useful outputs:

- verification asset inventory
- coverage and gap notes
- sample request or mock clues
- unresolved verification gaps

Best for:

- onboarding
- integration preparation
- central knowledge maintenance
- verification material inventory

## 3. Recommended Enablement Rule

Do not enable these switches automatically.

Recommended phrasing:

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

## 4. Recommended User Wording

Examples:

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_field_lineage for this integration flow.
```

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_context_propagation_map for auth and context propagation tracing in this flow.
```

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_error_semantics for failure semantics tracing in this flow.
```

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_async_contract_map for async contract tracing in this flow.
```

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_external_dependency_dossier for cross-team and third-party dependency capture.
```

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_interface_verification_assets for verification-asset tracing in this flow.
```

## 5. Safety Rule

These switches should not change the base output unless explicitly enabled.

If the user does not enable them:

- do not add the deeper pages by default
- do not expand the default workflow
- do not change the stable baseline outputs

## 6. Currently Available Priority Templates

Eight high-priority switch templates have already been added for explicit opt-in use:

- [Contract Map Template](./contract-map-template.md)
- [Gateway Map Template](./gateway-map-template.md)
- [Field Lineage Template](./field-lineage-template.md)
- [Context Propagation Map Template](./context-propagation-map-template.md)
- [Error Semantics Map Template](./error-semantics-map-template.md)
- [Async Contract Map Template](./async-contract-map-template.md)
- [External Dependency Dossier Template](./external-dependency-dossier-template.md)
- [Interface Verification Assets Template](./interface-verification-assets-template.md)
- [Priority Switch Template Index](./priority-switch-templates.md)

These templates remain optional and are not part of the default output.

## 7. Recommended Rollout Priority

If these optional switches are implemented gradually, a useful order is:

1. `enable_contract_map`
2. `enable_gateway_map`
3. `enable_field_lineage`
4. `enable_context_propagation_map`
5. `enable_error_semantics`
6. `enable_async_contract_map`
7. `enable_external_dependency_dossier`
8. `enable_interface_verification_assets`
