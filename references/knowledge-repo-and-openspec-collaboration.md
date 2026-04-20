# Central Knowledge Repository And OpenSpec Collaboration

## Purpose

This page explains how a central knowledge repository should work together with `openspec/specs` and `openspec/changes`.

Use three cooperating layers:

- `project/`: context and factual knowledge
- `openspec/specs/`: current effective rules
- `openspec/changes/`: controlled future changes

## Recommended Collaboration Flow

1. keep code facts, history, and analysis outputs in `project/`
2. extract stable and executable parts into `openspec/specs/`
3. when a new change is needed, start from `openspec/changes/`
4. after implementation, update `openspec/specs/`
5. then sync the corresponding `project/` knowledge pages

## One-Sentence Rule

Let `project/` preserve context, let `openspec/specs/` define current rules, and let `openspec/changes/` control evolution.
