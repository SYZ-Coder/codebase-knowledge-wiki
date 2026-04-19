# Interface Verification Assets Template

This template is used only when `enable_interface_verification_assets` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to connect interface knowledge with verification assets such as swagger, openapi, postman collections, apifox projects, mock data, contract tests, integration tests, and sample requests.

Typical goals:

- clarify which verification assets are visible for an interface or flow
- show where validation artifacts live in code or docs
- identify missing or one-sided verification coverage
- reduce onboarding and joint-debugging cost

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_interface_verification_assets`
- the team needs verification references for onboarding or integration
- the repository contains visible test, mock, or API documentation assets that matter to the current flow

## 3. Preferred Output Structure

Recommended sections:

1. verification scope
2. verification asset inventory
3. coverage and gap notes
4. sample request or mock clues
5. unresolved verification gaps

## 4. Verification Asset Inventory

Recommended table:

```md
| interface/flow | asset type | visible asset/location | scope note | consumer/provider side | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- |
```

Possible `asset type` values:

- swagger/openapi
- postman/apifox
- mock data
- contract test
- integration test
- e2e test
- sample request
- README/doc snippet

## 5. Coverage And Gap Notes

Useful items to record:

- whether only provider-side docs are visible
- whether only consumer-side test assets are visible
- whether mocks exist without real contract tests
- whether examples are stale or partial
- whether no verification assets are visible in current scope

## 6. Sample Request Or Mock Clues

Useful items to record:

- curl or request samples
- mock payload samples
- fixture or testdata locations
- environment or collection names
- example response snippets if code-visible

## 7. Trustworthiness Rule

Do not claim an interface is well verified unless the verification asset is actually visible.

If only a doc reference or file name is visible but not the asset content:

- record it as visible by name only
- mark detailed coverage as unresolved
- keep the evidence level aligned with the visible repository evidence

## 8. Recommended Phrases

Use phrases like:

- `Swagger entry visible`
- `Contract test location visible`
- `Mock payload sample visible`
- `Coverage partially visible`
- `Verification asset unresolved in current scope`
