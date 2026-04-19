# Contract Map Template

This template is used only when `enable_contract_map` is explicitly enabled.

It should not be produced by default.

## 1. Purpose

Use this page to document request and response contracts in more detail than the default interface map.

Typical goals:

- clarify required vs optional fields
- clarify enum sources
- clarify unresolved fields
- reduce frontend-backend contract ambiguity

## 2. When To Use

Use this page only when one of these is true:

- the user explicitly enabled `enable_contract_map`
- the integration flow is parameter-heavy
- contract misunderstandings are a real cost in the current project

## 3. Preferred Output Structure

Recommended sections:

1. contract scope
2. request contract table
3. response contract table
4. enum and dictionary notes
5. unresolved contract items

## 4. Request Contract Table

Recommended table:

```md
| field | required | type | source | meaning | enum/source note | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- | --- |
```

Possible `source` values:

- page form
- app view model
- api wrapper
- DTO
- bridge params
- callback payload

## 5. Response Contract Table

Recommended table:

```md
| field | type | consumer side | meaning | enum/source note | evidence level | code locations |
| --- | --- | --- | --- | --- | --- | --- |
```

## 6. Enum And Dictionary Notes

If enums or dictionary values are visible, record:

- enum name
- visible values
- source file or config
- unresolved gaps

## 7. Trustworthiness Rule

Do not invent business meaning for a field if the code does not support it.

If a field name is visible but semantics are unclear:

- record the field
- mark the meaning as unresolved
- keep the evidence level aligned with what is visible

## 8. Recommended Phrases

Use phrases like:

- `Required by caller-side validation`
- `Optional in DTO`
- `Enum source visible in code`
- `Field meaning unresolved in current scope`
- `Consumer-side usage visible`
