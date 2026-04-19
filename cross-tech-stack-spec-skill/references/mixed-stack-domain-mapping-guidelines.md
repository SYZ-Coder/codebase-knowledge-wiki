# Mixed-Stack Domain Mapping Guidelines

This reference defines how to adapt domain pages for mixed-stack repositories.

## 1. Purpose

Use this page when a business domain spans more than backend services alone.

Typical mixed-stack domain surfaces include:

- app screens
- H5 pages
- backend APIs
- Python tasks or workers
- bridge entrypoints
- callback handlers

## 2. Why This Exists

The classic backend-oriented structure:

- domain
- service
- spec

is often too narrow for mixed-stack repositories.

In mixed-stack analysis, a reusable domain page should connect:

- business intent
- user-facing or system-facing entry surfaces
- technical systems and modules
- rules, contracts, and specs

## 3. Preferred Domain Structure

Recommended structure:

```md
# Domain Page

## 1. Domain Definition

- domain name
- current scope
- current boundary

## 2. Entry Surfaces

| surface type | name | path/module | role | evidence level | code locations |
| --- | --- | --- | --- | --- | --- |

## 3. Systems / Services / Modules

| unit | stack type | responsibility | upstream surfaces | downstream links | code locations |
| --- | --- | --- | --- | --- | --- |

## 4. Rules / Contracts / Specs

| rule or contract | applies to | status | evidence | code/doc locations |
| --- | --- | --- | --- | --- |

## 5. Current Evidence Boundary

- confirmed
- clue-level only
- unresolved
```

## 4. Entry Surface Types

Useful surface labels include:

- `app-screen`
- `h5-page`
- `backend-api`
- `python-task`
- `bridge-entry`
- `callback-handler`
- `admin-page`
- `cron-job`

Only use labels supported by visible code evidence.

## 5. Mapping Rule

A mixed-stack domain page should not repeat low-level codemap pages.

Instead, it should elevate existing evidence into a reusable context layer.

This means:

- summarize the domain-facing surfaces
- connect them to systems or modules already identified
- connect those units to rules or contracts already visible
- keep unresolved parts explicit

## 6. Trustworthiness Rule

Do not treat a domain page as a place to guess product intent.

Only write:

- what the code or repository structure directly supports
- what entry surfaces are visible
- what systems or modules are visibly linked
- what rules or specs are actually present

If domain intent is only partially visible, say so.

## 7. Recommended Sequence

For mixed-stack repositories, domain pages should usually be built after:

1. workspace layering
2. subsystem codemap pages
3. cross-layer router-map pages
4. interface-mapping pages when needed

This keeps the domain page evidence-backed.

## 8. Recommended Phrases

Use phrases like:

- `Domain context lifted from lower-level codemap evidence`
- `Entry surface confirmed in code`
- `System-module linkage visible`
- `Rule visible in code or documentation`
- `Domain intent only partially closed in current scope`
