# Detailed Usage Guide For The Extension Skill

This guide helps users quickly understand what `cross-tech-stack-spec-skill` adds, when to use it, how to turn it on, and how to use it with all switches enabled or with only selected switches enabled.

## 1. What This Is

`cross-tech-stack-spec-skill` is an explicit extension skill.

It does not replace the base `backend-service-spec-skill`. Instead, it adds an adaptation layer for repositories such as:

- mobile projects
- H5 / web frontend repositories
- Python services / workers / tasks
- mixed workspaces spanning app, H5, backend, MQ, callbacks, and tasks
- systems where interface and routing analysis must cross technology-stack boundaries

## 2. What It Enhances

Compared with the base workflow, this extension skill adds two layers of capability.

### Stable enhancement layer

Once the extension skill is enabled, it strengthens these areas:

- workspace layering
- mixed-stack noise control
- communication evidence levels
- interface mapping pages
- mixed-stack domain pages
- incremental update mode

These belong to the stable extension workflow.

### Optional switch-controlled layer

On top of that, you can explicitly enable eight finer-grained switches:

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

These switches are disabled by default and are used only when explicitly requested.

## 3. When To Use This Extension Skill

Enable this extension skill when:

- backend-only wording is no longer accurate enough
- the repository spans app, H5, Python, bridge, backend, callback, or task layers
- you need frontend-to-backend or cross-layer interface mapping
- you need communication analysis across HTTP, MQ, Kafka, WebSocket, callback, or similar boundaries
- you need reusable dossiers for cross-team or third-party dependencies
- you want mixed-stack project knowledge maintained in a central repository

If the repository is just a normal backend microservice landscape, the base `backend-service-spec-skill` is usually enough.

## 4. The Three Most Common Ways To Use It

### Enable only the extension skill

For pure mobile, pure H5, or pure Python projects.

```text
Use $cross-tech-stack-spec-skill to analyze this project.
```

### Base workflow plus extension skill

This is the most recommended wording for mixed workspaces.

```text
Use backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

### Base workflow plus extension skill plus optional switches

Use this when you already know you need deeper analysis.

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_field_lineage for deeper analysis of this flow.
```

## 5. Quick Start

If this is your first time using the extension skill, a good sequence is:

1. enable the extension skill without any optional switches
2. get workspace layering, communication matrix, interface mapping, and router-map results first
3. decide whether deeper pages are really needed
4. enable only one to three relevant switches instead of turning on everything immediately

Recommended starting command:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and first produce workspace layering, codemap, and router-map based strictly on repository evidence.
```

Typical outputs:

- workspace layering page
- communication evidence matrix
- interface mapping page
- mixed-stack key route page

## 6. How To Turn Everything On

### What “turn everything on” means

It means:

- enable the extension skill itself
- enable all eight optional switches at the same time

That includes:

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

### When full enablement is appropriate

Use full enablement only when:

- the project is high-value and central
- the team wants a more complete baseline knowledge pack
- the result will feed a central knowledge repository
- the system is complex enough that one-pass deep documentation is worth the cost

### Recommended full-enable command

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets for a full enhanced project analysis based strictly on code evidence.
```

### Recommended output order when fully enabled

Recommended order:

1. workspace layering page
2. excluded or delayed scope page
3. codemap
4. router-map
5. interface mapping page
6. contract detail page
7. field-lineage page
8. context-propagation page
9. error-semantics page
10. async-contract page
11. external-dependency dossier page
12. verification-assets page
13. mixed-stack domain page

See the full command-to-output mapping here:

- [Command Output Map](./command-output-map.md)

### Caution on full enablement

Do not make full enablement your default habit.

Reasons:

- outputs become much larger
- evidence discipline becomes harder to maintain
- large workspaces need stronger scope control first
- most projects only need two or three deeper pages

## 7. How To Use Partial Enablement

Partial enablement is the recommended everyday usage pattern.

The principle is:

- run the main workflow first
- then enable only the switches that match the current problem
- most of the time, one to three switches are enough

### Frontend-backend integration scenario

Recommended switches:

- `enable_contract_map`
- `enable_field_lineage`
- `enable_interface_verification_assets`

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_field_lineage + enable_interface_verification_assets for this integration flow.
```

### Gateway/BFF routing confusion

Recommended switches:

- `enable_gateway_map`
- `enable_context_propagation_map`

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_gateway_map + enable_context_propagation_map for this request chain.
```

### Production-failure troubleshooting

Recommended switches:

- `enable_error_semantics`
- `enable_context_propagation_map`
- `enable_async_contract_map`

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_error_semantics + enable_context_propagation_map + enable_async_contract_map for this failure path.
```

### Kafka / MQ / callback systems

Recommended switches:

- `enable_async_contract_map`
- `enable_error_semantics`

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_async_contract_map + enable_error_semantics for this async flow.
```

### Central knowledge repository / dependency governance

Recommended switches:

- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`
- `enable_contract_map`

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_external_dependency_dossier + enable_interface_verification_assets + enable_contract_map for knowledge-repository-oriented analysis.
```

## 8. What Each Switch Is For

### `enable_contract_map`

Purpose: deeper request/response contract mapping.
Best for: integration work, ambiguous parameters, contract-heavy APIs.
Typical outputs: contract detail page, request parameter table, response field table.

### `enable_gateway_map`

Purpose: gateway/BFF/forwarding/path-rewrite mapping.
Best for: routing confusion and gateway-heavy flows.
Typical outputs: gateway forwarding page, route list, landing-point mapping.

### `enable_field_lineage`

Purpose: trace critical fields across layers.
Best for: large DTOs, frequent renames, field provenance analysis.
Typical outputs: field lineage page, field flow table, rename/transform notes.

### `enable_context_propagation_map`

Purpose: trace token/userId/tenantId/traceId and similar context.
Best for: auth, tenant, trace, and header propagation issues.
Typical outputs: context propagation page, header propagation table, gap list.

### `enable_error_semantics`

Purpose: trace error code, failure behavior, retry, fallback, and compensation.
Best for: production troubleshooting and failure-path analysis.
Typical outputs: error semantics page, error mapping table, retry/compensation summary.

### `enable_async_contract_map`

Purpose: trace producer/topic/consumer/payload/retry/DLQ/idempotency.
Best for: Kafka, MQ, callback-heavy systems.
Typical outputs: async contract page, producer/topic/consumer mapping, DLQ/idempotency summary.

### `enable_external_dependency_dossier`

Purpose: document cross-team or third-party dependency dossiers.
Best for: knowledge repositories, dependency governance, onboarding.
Typical outputs: dependency dossier page, provider/consumer list, risk clues.

### `enable_interface_verification_assets`

Purpose: connect interfaces with swagger/openapi/postman/mock/contract tests and similar assets.
Best for: onboarding, integration preparation, and test-material inventory.
Typical outputs: verification assets page, asset location inventory, coverage page.

## 9. Recommended Combinations

Common combinations:

- contract integration combo: `enable_contract_map + enable_field_lineage`
- gateway tracing combo: `enable_gateway_map + enable_context_propagation_map`
- failure-troubleshooting combo: `enable_error_semantics + enable_context_propagation_map`
- async-governance combo: `enable_async_contract_map + enable_error_semantics`
- knowledge-repository combo: `enable_external_dependency_dossier + enable_interface_verification_assets`

## 10. Default Boundaries

These boundaries always apply:

- if a switch is not explicitly enabled, do not output its deeper page
- do not treat optional pages as baseline default output
- do not automatically turn everything on because the project is complex
- do not go beyond repository evidence
- if only one side is visible, mark it as unresolved or clue-level only

## 11. Recommended Real-World Workflow

### First-time analysis

1. run the base mixed-stack workflow
2. add one to three switches only where needed
3. consider a fully enabled baseline pack only after the first pass is useful

### Long-term maintenance

1. identify the change scope first
2. decide whether the current change needs any optional switch
3. update only the affected pages instead of rerunning everything

## 12. Minimal Command Set

### Minimal main workflow

```text
Use backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

### Minimal fully enabled workflow

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets for a full enhanced analysis.
```

### Minimal partial-enable workflow

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill, and turn on enable_contract_map + enable_field_lineage for deeper analysis of the target flow.
```

## 13. Read Next

- [Command Output Map](./command-output-map.md)
- [Usage And Differences](./usage-and-differences.md)
- [Optional Switch-Controlled Extensions](./optional-switch-controlled-extensions.md)
- [High-Priority Optional Switch Templates](./priority-switch-templates.md)





