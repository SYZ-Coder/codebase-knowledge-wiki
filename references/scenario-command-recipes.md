# Scenario Command Recipes

This page provides ready-to-copy command templates for common usage scenarios.

## 1. First pass on a backend microservice project

```text
Use backend-service-spec-skill to run a lightweight full analysis on this backend microservice project.
Requirements:
1. classify project scope first
2. run create_codemap
3. run service_deep_dive on 1 to 2 high-value services
4. run crate_router_map on 1 to 2 key chains
5. stay strictly grounded in code facts
```

## 2. Build a backend knowledge baseline

```text
Use backend-service-spec-skill to run a heavy full analysis on this backend microservice project.
Requirements:
1. classify project scope first
2. run create_codemap
3. run service_deep_dive on multiple high-value services
4. run crate_router_map on multiple key chains
5. run build_domain_map last
6. output validation pages and unresolved-chain summaries
7. stay strictly grounded in code facts
```

## 3. Mixed workspace with app/H5/Python/backend

```text
Use backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
Requirements:
1. start with workspace layering
2. run create_codemap
3. run service_deep_dive on key services
4. run crate_router_map on key chains
5. stay strictly grounded in code evidence
```

## 4. Frontend-backend integration

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_field_lineage + enable_interface_verification_assets
to refine this integration flow and output parameters, field flow, and verification assets.
```

## 5. Unclear gateway/BFF routing

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_gateway_map + enable_context_propagation_map
to output gateway forwarding, context propagation, and final handling points for this request chain.
```

## 6. Kafka / MQ / callback system

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_async_contract_map + enable_error_semantics
to output producer, topic, consumer, payload, retry, DLQ, and compensation information.
```

## 7. Trace a full chain from one interface

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier
to build a full-chain view around interface <path or method name>.
Requirements:
1. start from the caller entry
2. identify gateway/BFF/controller/service/feign/http/mq/kafka
3. output parameters, addresses, field flow, context propagation, external dependencies, topics, and producer/consumer relations
4. clearly mark closed / partially closed / clue-level / unresolved
```

## 8. Trace a full chain from one business feature

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets
to build a full-chain view around feature <feature name>.
Requirements:
1. start from the feature entry page, button, app/H5 call site, or first interface
2. output frontend, gateway, backend, external service, MQ, and Kafka chains
3. output parameters, addresses, topics, producers, consumers, failure paths, and verification assets
4. stay strictly grounded in code facts
```

## 9. Incremental maintenance for a team knowledge repository

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and perform an incremental update on top of the existing knowledge base.
Requirements:
1. identify the change scope first
2. update only affected pages
3. enable optional switches only if the changed area needs them
4. output new evidence and any areas not revalidated in this pass
```

## 10. Turn on everything in one pass

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets
to run a full analysis and generate separate artifacts for every enabled capability.
```

Note:

- full mode can significantly increase token usage
- for large workspaces, phased execution is still recommended
