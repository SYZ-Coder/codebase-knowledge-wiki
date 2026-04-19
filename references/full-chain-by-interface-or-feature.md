# How To Trace A Full Chain From An Interface Or Feature

This page explains how to use the skill library when a user wants one complete chain around:

- a specific interface
- a specific feature
- its parameters and addresses
- frontend/backend feature flow
- gateway/BFF/backend handling
- external service integrations
- MQ / Kafka / callback / topic-based producer-consumer relations

## 1. What this scenario really is

This is not just "look at one interface definition".
It is:

- using one interface or feature as the anchor
- tracing the full cross-layer chain
- supplementing contracts, field flow, context, async edges, and external dependencies

The most reliable way is therefore:

- use `backend-service-spec-skill` as the base workflow
- enable `$cross-tech-stack-spec-skill`
- turn on selected optional switches

## 2. Recommended capability sets

### Minimal usable set

Good for getting the main route first:

- `backend-service-spec-skill`
- `$cross-tech-stack-spec-skill`
- `enable_contract_map`
- `enable_gateway_map`

### Standard full-chain set

Good for tracing one complete chain:

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`

### Heavy full-chain set

Good when the problem is more complex and also needs failure paths and verification assets:

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

## 3. If the anchor is an interface

Use this when you already know:

- an interface path
- a method name
- a controller method
- a frontend call URL

Recommended command:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier
to build a full-chain analysis around interface <path / method / controller method>.
Requirements:
1. start from the caller entry
2. output request address, parameters, and response fields
3. output gateway / BFF / controller / service / feign / http / mq / kafka / callback chains
4. if Kafka or MQ exists, output topics, producers, consumers, and payload clues
5. if external-team services exist, output an external dependency dossier
6. clearly mark closed / partially closed / clue-level / unresolved
```

## 4. If the anchor is a feature

Use this when you already know:

- a page feature
- a button action
- a business action
- a user flow

Recommended command:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets
to build a full-chain analysis around feature <feature name>.
Requirements:
1. start from the feature entry page, button, app/H5 call site, or first interface
2. output frontend, gateway, backend, external service, MQ, and Kafka chains
3. output parameters, addresses, field flow, context propagation, failure paths, and verification assets
4. if topics exist, output topic-level producer, consumer, and handling services
5. stay strictly grounded in code facts
```

## 5. Typical outputs for this kind of request

Recommended outputs:

- interface or feature overview page
- main route page
- parameter table
- field flow page
- context propagation page
- external dependency dossier
- async contract page
- error semantics page
- verification assets page
- unresolved list

Recommended directories:

```text
mydocs/routermap/
mydocs/extensions/
mydocs/validation/
```

## 6. How to improve accuracy

It helps a lot if the user provides one of these anchors explicitly:

- interface path
- method name
- page path
- feature name
- topic name
- controller name

The more explicit the anchor is, the easier it is to improve:

- caller accuracy
- handler accuracy
- parameter completeness
- topic linkage reliability
- external dependency recognition

## 7. Kafka / MQ / topic guidance

If the target explicitly involves Kafka, MQ, or topics, the command should also ask for:

- topic name
- producer service
- consumer service
- publish location
- consume location
- payload/schema clues
- retry / DLQ / compensation clues

Useful addition:

```text
If Kafka or MQ exists, output topics, producers, consumers, publish locations, consume locations, payload clues, and retry / DLQ / compensation information.
```

## 8. What “complete” should mean here

In this context, “full chain” should mean:

- all relevant capabilities are applied around the chosen interface or feature
- the chain is closed where possible
- the reasons are made explicit where closure is not possible

It should not automatically mean:

- every system is guaranteed to be 100% closed
- every external dependency can be confirmed on both sides
- every topic can be mapped to final business meaning without limits

So this kind of request should still always include:

- `strictly grounded in code facts`
- `mark closed / partially closed / clue-level / unresolved`

## 9. Read together with

- [Team Standard Workflow](./team-standard-workflow.md)
- [Full Analysis Mode](./full-analysis-mode.md)
- [Scenario Command Recipes](./scenario-command-recipes.md)
- [Detailed Extension Usage Guide](../cross-tech-stack-spec-skill/references/extension-usage-guide.md)
