# Cross Tech Stack Spec Skill

An explicit extension skill for cross-tech-stack project analysis.

This skill is designed for repositories where backend-service wording is too narrow, including:

- mobile app repositories
- H5 / web frontend repositories
- Python service / worker / task repositories
- mixed-stack repositories spanning app, page, bridge, backend, callback, and task layers

## Important Note

This skill does not replace the base `backend-service-spec-skill`.
It is an opt-in extension.

For normal backend microservice analysis, keep using the base skill.
For mixed-stack or non-backend-first projects, explicitly enable `$cross-tech-stack-spec-skill`.

## How To Use

Recommended wording:

```text
Use $backend-service-spec-skill as the base workflow, and enable $cross-tech-stack-spec-skill for mixed-stack adaptation.
```

For a pure mobile / H5 / Python repo, you can also say:

```text
Use $cross-tech-stack-spec-skill to analyze this project.
```

If the user wants a one-pass run that exercises the base workflow plus all optional extensions and generates all artifact types, see:

- [Full Analysis Mode](../references/full-analysis-mode.md)
- [Command Output Map](./references/command-output-map.md)
- [Command Quick Reference](./references/command-output-scenario-quickref.md)

Note:

- full analysis mode can consume substantially more tokens
- it also increases scan time and output size for large workspaces

## Communication Credibility

For communication analysis, this skill recommends a communication matrix with count basis, evidence levels, closure state, and code locations, so conclusions are easier to verify.

## Optional Deep Extensions

If you need finer-grained interface, field, error, context propagation, or cross-team dependency analysis, use the optional switch-controlled extensions. These remain disabled by default and do not change the stable baseline workflow.

## What The Commands And Switches Usually Produce

- extension enabled without switches: workspace layering, communication evidence matrix, interface mapping, mixed-stack key route page
- `enable_contract_map`: contract detail page, request/response field tables
- `enable_gateway_map`: gateway/forwarding route page
- `enable_field_lineage`: field lineage page
- `enable_context_propagation_map`: context propagation page
- `enable_error_semantics`: error semantics page
- `enable_async_contract_map`: async contract page
- `enable_external_dependency_dossier`: external dependency dossier page
- `enable_interface_verification_assets`: verification assets page

See the full mapping here:

- [Command Output Map](./references/command-output-map.md)

## Read Next

- [Detailed Usage Guide](./references/extension-usage-guide.md)
- [Command Output Map](./references/command-output-map.md)
- [Command Quick Reference](./references/command-output-scenario-quickref.md)
- [Full Analysis Mode](../references/full-analysis-mode.md)
- [Usage And Differences](./references/usage-and-differences.md)
- [Activation And Boundaries](./references/activation-and-boundaries.md)
- [Workspace Layering Template](./references/workspace-layering-template.md)
- [Optional Switch-Controlled Extensions](./references/optional-switch-controlled-extensions.md)
- [Priority Switch Template Index](./references/priority-switch-templates.md)
- [Contract Map Template](./references/contract-map-template.md)
- [Gateway Map Template](./references/gateway-map-template.md)
- [Field Lineage Template](./references/field-lineage-template.md)
- [Context Propagation Map Template](./references/context-propagation-map-template.md)
- [Error Semantics Map Template](./references/error-semantics-map-template.md)
- [Async Contract Map Template](./references/async-contract-map-template.md)
- [External Dependency Dossier Template](./references/external-dependency-dossier-template.md)
- [Interface Verification Assets Template](./references/interface-verification-assets-template.md)
- [Mobile Project Guidelines](./references/mobile-project-guidelines.md)
- [H5 Project Guidelines](./references/h5-project-guidelines.md)
- [Python Project Guidelines](./references/python-project-guidelines.md)
- [Mixed Stack Routing Guidelines](./references/mixed-stack-routing-guidelines.md)
- [Communication Matrix Guidelines](./references/communication-matrix-guidelines.md)
- [Communication Evidence Levels](./references/communication-evidence-levels.md)
- [Upgrade Roadmap](./references/upgrade-roadmap.md)
