# High-Priority Optional Switch Templates

This page collects the eight highest-priority optional switch-controlled extensions.

These remain:

- opt-in
- disabled by default
- outside the stable baseline workflow

## 1. `enable_contract_map`

Use when:

- request or response contracts are complex
- frontend-backend coordination depends on field-level clarity
- required / optional / enum / unresolved field distinctions matter

Template:

- `references/contract-map-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map for this interface flow.
```

Expected output focus:

- request field table
- response field table
- enum source note
- unresolved field note

## 2. `enable_gateway_map`

Use when:

- gateway or BFF layers make paths hard to trace
- path rewrite or forward logic matters
- auth gates or forwarding checkpoints block interface understanding

Template:

- `references/gateway-map-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_gateway_map for this request chain.
```

Expected output focus:

- gateway route table
- rewrite / forward chain
- auth and policy checkpoints
- unresolved routing gaps

## 3. `enable_field_lineage`

Use when:

- critical fields change across frontend params, DTOs, service layers, or message payloads
- rename or conversion points affect understanding
- the team often needs to trace where a field comes from and where it goes

Template:

- `references/field-lineage-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_field_lineage for critical field tracing in this flow.
```

Expected output focus:

- critical field list
- field lineage table
- transformation and rename notes
- unresolved lineage gaps

## 4. `enable_context_propagation_map`

Use when:

- token, userId, tenantId, traceId, or similar context travels across multiple layers
- gateway, interceptor, or middleware logic injects or rewrites request context
- cross-team interface debugging depends on knowing where context is added, changed, or lost

Template:

- `references/context-propagation-map-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_context_propagation_map for auth and context propagation tracing in this flow.
```

Expected output focus:

- critical context items
- header/context propagation table
- injection and rewrite points
- unresolved propagation gaps

## 5. `enable_error_semantics`

Use when:

- error codes, exceptions, HTTP statuses, or callback failures propagate across multiple layers
- retry, fallback, timeout, or compensation behavior affects understanding
- the team needs to know where failure is thrown, translated, swallowed, or downgraded

Template:

- `references/error-semantics-map-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_error_semantics for failure semantics tracing in this flow.
```

Expected output focus:

- error code table
- failure path notes
- retry / fallback / compensation notes
- unresolved failure gaps

## 6. `enable_async_contract_map`

Use when:

- Kafka, MQ, or callback flows are part of the critical path
- the team needs a clearer view of producer, topic or queue, consumer, payload, retry, DLQ, and idempotency behavior
- async behavior is blocking integration, debugging, or knowledge capture

Template:

- `references/async-contract-map-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_async_contract_map for async contract tracing in this flow.
```

Expected output focus:

- producer -> topic/queue -> consumer table
- payload schema notes
- retry / DLQ / idempotency notes
- unresolved async gaps

## 7. `enable_external_dependency_dossier`

Use when:

- third-party, platform, or other-team dependencies need to be documented as reusable knowledge
- the team needs provider/consumer ownership clues, contract locations, and risk notes
- a central repository needs dependency dossiers instead of only call chains

Template:

- `references/external-dependency-dossier-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_external_dependency_dossier for cross-team and third-party dependency capture.
```

Expected output focus:

- provider/consumer dossier table
- contract and owner clues
- version/risk/change notes
- unresolved dependency gaps

## 8. `enable_interface_verification_assets`

Use when:

- the team needs swagger/openapi/postman/apifox/mock/contract-test visibility tied to interface knowledge
- onboarding, joint debugging, or knowledge maintenance depends on finding verification assets quickly
- the goal is to identify which interfaces are documented or tested and which still lack verification material

Template:

- `references/interface-verification-assets-template.md`

Recommended wording:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_interface_verification_assets for verification-asset tracing in this flow.
```

Expected output focus:

- verification asset inventory
- coverage and gap notes
- sample request or mock clues
- unresolved verification gaps

## 9. Safety Reminder

Do not enable these switches implicitly.

If the user does not explicitly request them, keep the default outputs unchanged.

