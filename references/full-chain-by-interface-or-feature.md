# How To Trace A Full Chain From An Interface Or Feature

This page explains how to use the skill library when a user wants one complete chain around:

- a specific interface
- a specific feature
- its parameters and addresses
- frontend/backend feature flow
- gateway/BFF/backend handling
- external service integrations
- MQ / Kafka / callback / topic-based producer-consumer relations
- failure paths and verification assets

## 1. What this scenario really is

This is not just "look at one interface definition".

It is:

- using one interface or feature as the anchor
- tracing the full cross-layer chain
- supplementing contracts, field flow, context, async edges, and external dependencies

The most reliable way is therefore:

- use the backend-service analysis workflow as the base flow
- enable cross-tech-stack analysis
- turn on selected optional switches

For tool-specific usage:

- in `Codex`, `$backend-service-spec-skill` / `$cross-tech-stack-spec-skill` wording is appropriate
- in `Claude Code`, project-local skills / commands or natural-language workflow prompts are usually safer
- in `Cursor`, prefer rule-driven natural-language workflow prompts instead of `$backend-service-spec-skill` skill-registry wording
- neither Cursor nor ordinary Claude Code prompts should be described as equivalent to Codex native skill-registry execution

## 2. Recommended capability sets

### Minimal usable set

Good for getting the main route first:

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

Recommended prompts:

### Codex

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
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

### Claude Code

```text
Please use the backend-service analysis workflow as the base flow and enable cross-tech-stack analysis,
turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier,
and build a full-chain analysis around interface <path / method / controller method>.
Requirements:
1. start from the caller entry
2. output request address, parameters, and response fields
3. output gateway / BFF / controller / service / feign / http / mq / kafka / callback chains
4. if Kafka or MQ exists, output topics, producers, consumers, and payload clues
5. if external-team services exist, output an external dependency dossier
6. clearly mark closed / partially closed / clue-level / unresolved
```

### Cursor

```text
Please build a full-chain analysis around interface <path / method / controller method> using the backend-service analysis workflow as the base flow and cross-tech-stack analysis.
Turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier.
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

### 4.1 If there is only a feature point and no clear interface/page anchor

When the user only provides a feature point such as "create virtual role", "generate script", or "publish content", but does not provide an interface path, controller method, page path, button name, or topic name, do not jump directly into a backend interface and treat it as the anchor.

In this case, enable the no-anchor feature tracing extension in cross-tech-stack analysis: discover entry candidates first, document the App/H5-side state machine and interaction logic, and only then infer the first backend interface and continue the backend chain.

Recommended execution order:

1. Search App/H5/frontend entry surfaces by feature keywords, page names, route constants, button text, tracking names, ViewModel methods, and service API wrappers.
2. If the user provides a module clue, such as a mobile module, H5 directory, or page component, search that scope first; only expand to the whole App/H5 repository if nothing is found.
3. After finding candidate entries, output an entry-candidate table first. Do not immediately turn one interface into a fact anchor.
4. For the matched page or component, add an "App/H5-side feature state machine and interaction logic" section covering page params, entry branches, button state, form fields, prerequisite APIs, async polling, upload/selection, navigation return, and failure feedback.
5. Then infer the first backend interface from the App/H5 API wrapper, ViewModel, request client, or bridge handler.
6. After the first interface is closed, continue with controller / service / feign / http / mq / kafka / callback tracing.
7. If the App/H5 side exposes a page but no interface call can be closed, mark it as `partially closed` or `clue-level`; do not invent an interface.

Required App/H5-side outputs:

- Feature entry candidate table: page, route, button, component, call site, evidence location, closure state.
- Page parameter table: route params, intent extras, query params, props, store/context fields.
- Interaction state machine: create/edit/copy/template/external-entry branches.
- Prerequisite API list: initialization query, AI completion, image generation, upload, polling, selection, validation.
- Final submit interface inference: button click -> ViewModel/API wrapper/request client chain.
- Field-write table: how user input, AI backfill, and upload/selection results write into request beans or form state.
- Submit-button enablement rules: required fields, loading state, AI generation, image generation, permission dialogs.
- Success behavior: setResult, route jump, page close, H5 navigation, callback, event bus.
- Failure paths: toast, dialog, API failure callback, local validation failure, polling failure.

Recommended output section name:

```text
App/H5-side feature state machine and interaction logic
```

For mobile or H5 mixed projects, also add a Mermaid state-machine diagram:

```text
entry page -> param parsing -> initialization branch -> user edit/generate/upload/select -> button validation -> submit interface -> success navigation/return
```

### 4.2 Risk controls for no-anchor feature tracing

This extension must remain a controlled opt-in path. It does not replace existing interface anchors, method anchors, page anchors, or topic anchors.

Activation conditions:

- Enable it only when the user has a feature point but no clear interface path, controller method, page path, button name, or topic name.
- If the user already provides a clear interface or method, prefer the interface-anchor flow and do not enable no-anchor tracing.
- If the user provides a module clue, search within that module first instead of scanning the whole repository immediately.

Risk-control execution rules:

1. Limit the search scope first. Priority: user-provided module > App/H5 page module > frontend API wrapper > backend controller > whole-repository search.
2. The first phase may only output an entry-candidate table. Do not immediately turn one interface into a fact anchor.
3. Only `closed` or `partially closed` candidates may continue into deep tracing.
4. `clue-level` entries are clues only and must not be written as fact conclusions.
5. If there are more than 5 entry candidates, stop deep tracing and ask for a narrower module name, page name, button name, interface name, or keyword.
6. If the App/H5 side has no visible call site, do not construct a backend interface chain.
7. If a topic only appears in configs or constants but has no producer / consumer code evidence, do not write it as a complete MQ/Kafka route.
8. Read only the code needed by the current phase to avoid loading App/H5, backend, MQ, gateway, and external dependency contexts all at once.

Recommended phase boundaries:

1. Phase 1: entry candidate discovery.
2. Phase 2: App/H5 state machine and interaction logic.
3. Phase 3: first interface inference.
4. Phase 4: backend synchronous chain.
5. Phase 5: MQ/Kafka/asynchronous chain.
6. Phase 6: external dependencies and verification assets.

Stop conditions:

- More than 5 candidates exist and cannot be ranked reliably.
- The feature keyword is too generic and matches many unrelated pages or methods.
- An entry page exists, but the submit interface cannot be closed from code.
- The backend interface cannot be closed to a controller / handler.
- An async topic lacks either producer-side or consumer-side evidence.

No-anchor recommended prompts:

### Codex

```text
Use $backend-service-spec-skill as the base workflow and enable $cross-tech-stack-spec-skill,
turning on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets,
to build a full-chain analysis around feature <feature name>.

There is only a feature point and no clear interface anchor. Please first apply the no-anchor feature tracing extension:
1. Start from App/H5/frontend entry candidates, including pages, routes, buttons, components, ViewModels, API wrappers, and tracking names.
2. If a module clue is provided, search that module first; expand only if no entry is found.
3. Output an entry-candidate table first and label closed / partially closed / clue-level / unresolved.
4. Must add an App/H5-side feature state machine and interaction logic section, covering page params, entry branches, button states, form fields, prerequisite APIs, image/upload/polling, AI/async generation, navigation return, and failure feedback.
5. Then infer the first backend interface from the App/H5 call site and continue tracing gateway / BFF / controller / service / feign / http / mq / kafka / callback.
6. Output interface parameters, addresses, field lineage, context propagation, failure paths, and verification assets.
7. If topics exist, output producers, consumers, processing services, and payload clues by topic.
8. Strictly ground every claim in code facts; do not write guesses as facts.
9. Do not perform whole-repository deep tracing by default; expand the scope only when no entry is found in the current bounded scope.
10. If there are more than 5 entry candidates, stop and output the candidate table first instead of generating a full chain.
11. Only closed / partially closed candidates may continue into deep tracing; clue-level entries are clues only.
12. If a chain segment cannot be closed, mark it as unresolved instead of filling the gap with inferred links.
```

### Claude Code

```text
Please use the backend-service analysis workflow as the base flow and enable cross-tech-stack analysis,
turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets,
and build a full-chain analysis around feature <feature name>.

There is only a feature point and no clear interface anchor. Please first apply the no-anchor feature tracing extension:
1. Start from App/H5/frontend entry candidates, including pages, routes, buttons, components, ViewModels, API wrappers, and tracking names.
2. If a module clue is provided, search that module first; expand only if no entry is found.
3. Output an entry-candidate table first and label closed / partially closed / clue-level / unresolved.
4. Must add an App/H5-side feature state machine and interaction logic section, covering page params, entry branches, button states, form fields, prerequisite APIs, image/upload/polling, AI/async generation, navigation return, and failure feedback.
5. Then infer the first backend interface from the App/H5 call site and continue tracing gateway / BFF / controller / service / feign / http / mq / kafka / callback.
6. Output interface parameters, addresses, field lineage, context propagation, failure paths, and verification assets.
7. If topics exist, output producers, consumers, processing services, and payload clues by topic.
8. Strictly ground every claim in code facts; do not write guesses as facts.
9. Do not perform whole-repository deep tracing by default; expand the scope only when no entry is found in the current bounded scope.
10. If there are more than 5 entry candidates, stop and output the candidate table first instead of generating a full chain.
11. Only closed / partially closed candidates may continue into deep tracing; clue-level entries are clues only.
12. If a chain segment cannot be closed, mark it as unresolved instead of filling the gap with inferred links.
```

### Cursor

```text
Please build a full-chain analysis around feature <feature name> using the backend-service analysis workflow as the base flow and cross-tech-stack analysis.
Turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets.

There is only a feature point and no clear interface anchor. Please first apply the no-anchor feature tracing extension:
1. Start from App/H5/frontend entry candidates, including pages, routes, buttons, components, ViewModels, API wrappers, and tracking names.
2. If a module clue is provided, search that module first; expand only if no entry is found.
3. Output an entry-candidate table first and label closed / partially closed / clue-level / unresolved.
4. Must add an App/H5-side feature state machine and interaction logic section, covering page params, entry branches, button states, form fields, prerequisite APIs, image/upload/polling, AI/async generation, navigation return, and failure feedback.
5. Then infer the first backend interface from the App/H5 call site and continue tracing gateway / BFF / controller / service / feign / http / mq / kafka / callback.
6. Output interface parameters, addresses, field lineage, context propagation, failure paths, and verification assets.
7. If topics exist, output producers, consumers, processing services, and payload clues by topic.
8. Strictly ground every claim in code facts; do not write guesses as facts.
9. Do not perform whole-repository deep tracing by default; expand the scope only when no entry is found in the current bounded scope.
10. If there are more than 5 entry candidates, stop and output the candidate table first instead of generating a full chain.
11. Only closed / partially closed candidates may continue into deep tracing; clue-level entries are clues only.
12. If a chain segment cannot be closed, mark it as unresolved instead of filling the gap with inferred links.
```

Recommended feature-anchor prompts:

### Codex

```text
Use $backend-service-spec-skill as the base workflow, enable $cross-tech-stack-spec-skill,
and turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets
to build a full-chain analysis around feature <feature name>.
Requirements:
1. start from the feature entry page, button, app/H5 call site, or first interface
2. output frontend, gateway, backend, external service, MQ, and Kafka chains
3. output parameters, addresses, field flow, context propagation, failure paths, and verification assets
4. if topics exist, output topic-level producer, consumer, and handling services
5. stay strictly grounded in code facts
```

### Claude Code

```text
Please use the backend-service analysis workflow as the base flow and enable cross-tech-stack analysis,
turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets,
and build a full-chain analysis around feature <feature name>.
Requirements:
1. start from the feature entry page, button, app/H5 call site, or first interface
2. output frontend, gateway, backend, external service, MQ, and Kafka chains
3. output parameters, addresses, field flow, context propagation, failure paths, and verification assets
4. if topics exist, output topic-level producer, consumer, and handling services
5. stay strictly grounded in code facts
```

### Cursor

```text
Please build a full-chain analysis around feature <feature name> using the backend-service analysis workflow as the base flow and cross-tech-stack analysis.
Turn on enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets.
Requirements:
1. start from the feature entry page, button, app/H5 call site, or first interface
2. output frontend, gateway, backend, external service, MQ, and Kafka chains
3. output parameters, addresses, field flow, context propagation, failure paths, and verification assets
4. if topics exist, output topic-level producer, consumer, and handling services
5. stay strictly grounded in code facts
```

## 5. How to use this in Claude Code

`Claude Code` does not always expose a native `$skill-name` registry the way `Codex` does.

The most reliable usage patterns are:

- if the project has `.claude/skills/`, you may use project-local skill-style prompts
- if the project has `.claude/commands/`, you may use slash-command templates
- if the project is integrated through `CLAUDE.md` or project instructions, use natural-language workflow prompts directly

If `.claude/commands/` is installed, a command-style entry may look like:

```text
/crate-router-map scope=<interface-or-feature> goal=trace the full chain around the current anchor, including gateway, service, mq, callback, failure paths, and verification assets
```

If `.claude/skills/` is installed, a project-local skill-style prompt may look like:

```text
/backend-service-spec-skill trace a full chain around interface <interface path> and enable cross-tech-stack analysis
```

If there is only a feature point and no clear interface anchor, send the full no-anchor feature tracing prompt instead of a short request such as "trace this feature".

## 6. How to use this in Cursor

`Cursor` mainly works through `.cursor/rules/*.mdc` and natural-language tasks, not through a `$backend-service-spec-skill` registry call.

So in `Cursor`:

- do not rely on `$backend-service-spec-skill` wording
- prefer phrasing like "use the backend-service analysis workflow as the base flow and enable cross-tech-stack analysis"
- keep switch names such as `enable_contract_map` exactly as written
- do not describe this as native skill execution; describe it as rule-driven workflow execution

After Cursor installation, users usually do not need to configure rules manually again, as long as these files exist in the target project:

- `.cursor/rules/backend-service-spec-skill.mdc`
- `.cursor/rules/cross-tech-stack-spec-skill.mdc`
- `skills/backend-service-spec-skill/SKILL.md`
- `skills/cross-tech-stack-spec-skill/SKILL.md`

## 7. Typical outputs for this kind of request

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

## 8. How to improve accuracy

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

## 9. Kafka / MQ / topic guidance

If the target explicitly involves Kafka, MQ, or topics, the prompt should also ask for:

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

## 10. What "complete" should mean here

In this context, "full chain" should mean:

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

## 11. Read together with

- [Team Standard Workflow](./team-standard-workflow.md)
- [Full Analysis Mode](./full-analysis-mode.md)
- [Scenario Command Recipes](./scenario-command-recipes.md)
- [Detailed Extension Usage Guide](../cross-tech-stack-spec-skill/references/extension-usage-guide.md)
