# Anchor Selection Guide

This page helps users choose the right anchor before requesting a full-chain analysis.

Here, an "anchor" means the starting point used to trace the chain.

The four most common anchors are:

- interface
- feature
- topic
- page entry

Choosing the right anchor usually improves:

- caller recognition accuracy
- handler landing accuracy
- parameter completeness
- external dependency recognition
- MQ / Kafka chain closure

## 1. Interface Anchor

Best when you already know:

- an interface path
- a controller method
- a frontend request URL
- an interface method name

Best for questions like:

- where this interface is called from
- which handler finally processes it
- what its parameters and response are
- whether it crosses gateway / BFF / Feign / external HTTP / MQ / Kafka

Recommended command:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier
to build a full-chain analysis around interface <path / method / controller method>, strictly grounded in code facts.
```

Recommended outputs:

- main route page
- interface parameter table
- field flow page
- topic relation page
- external dependency dossier

## 2. Feature Anchor

Best when you already know:

- a business feature
- a button action
- a user flow
- a business outcome but not yet the exact interfaces

Best for questions like:

- which pages, interfaces, and services support the feature
- what the frontend/backend collaboration chain is
- whether external services, async messages, or failure compensation are involved

Recommended command:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets
to build a full-chain analysis around feature <feature name>, strictly grounded in code facts.
```

Recommended outputs:

- feature overview page
- main route page
- failure-path page
- external dependency page
- verification assets page

## 3. Topic Anchor

Best when you already know:

- a Kafka topic
- an MQ topic or queue
- a callback event name
- one async message but not yet the producer/consumer sides

Best for questions like:

- which service produces the topic
- which services consume it
- what business chain the topic belongs to
- what the payload/schema clues are
- whether retry / DLQ / compensation exist

Recommended command:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_async_contract_map + enable_error_semantics + enable_external_dependency_dossier
to build a full-chain analysis around topic <topic name>.
Requirements:
1. output producers, consumers, publish locations, and consume locations
2. output payload/schema clues
3. output retry / DLQ / compensation clues
4. clearly mark closed / partially closed / clue-level / unresolved
```

Recommended outputs:

- async contract page
- producer / consumer mapping
- topic clue page
- failure and compensation page

## 4. Page-Entry Anchor

Best when you already know:

- an H5 page path
- an app route
- a frontend entry component
- a page behavior whose backend interface is not yet known

Best for questions like:

- where the page triggers interfaces
- which backend capabilities the page calls
- whether it crosses bridge / gateway / backend / async
- what feature chain the page belongs to

Recommended command:

```text
Use backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_context_propagation_map + enable_interface_verification_assets
to build a full-chain analysis around page entry <page path / app route / component name>, strictly grounded in code facts.
```

Recommended outputs:

- page-entry overview
- page-to-interface mapping
- main route page
- verification assets page

## 5. How To Choose

If you know most clearly:

- an interface address: use the interface anchor
- a feature name: use the feature anchor
- a topic name: use the topic anchor
- a page path or page action: use the page-entry anchor

Simple rule of thumb:

- for interface detail + parameters + handler: choose interface anchor
- for a business action end-to-end: choose feature anchor
- for producer/consumer message relations: choose topic anchor
- for frontend entry to backend landing: choose page-entry anchor

## 6. The more explicit the anchor, the more stable the result

It helps a lot if the request includes one of:

- interface path
- method name
- controller name
- feature name
- page path
- topic name

If the anchor is vague, such as:

- "look at this feature"
- "analyze this area"

the chain can still be analyzed, but:

- scope grows larger
- token cost grows higher
- the share of partially closed / clue-level results usually increases

## 7. Read together with

- [Scenario Command Recipes](./scenario-command-recipes.md)
- [How To Trace A Full Chain From An Interface Or Feature](./full-chain-by-interface-or-feature.md)
- [Full Analysis Mode](./full-analysis-mode.md)
