# Base Skill vs Extension Skill Boundaries

This page explains how the backend-oriented base skill and the cross-tech-stack extension skill should coexist.

## 1. Purpose

Use this page to avoid two risks:

- polluting the stable backend-oriented workflow
- accidentally under-analyzing mixed-stack repositories with backend-only language

## 2. Base Skill Position

The base skill should remain the default workflow for:

- backend microservice repositories
- service landscape analysis
- domain analysis centered on backend services
- service-to-service router maps
- long-term central knowledge repositories with backend-first structure

## 3. Extension Skill Position

The cross-tech-stack extension skill should remain opt-in and should be used for:

- mobile repositories
- H5 / frontend repositories
- Python service / worker / task repositories
- mixed-stack workspaces spanning app, page, bridge, backend, callback, and task layers

## 4. What Can Safely Flow Back Into the Base Skill

These are generic discipline upgrades and can be adopted by the base skill over time:

- workspace classification as a standard first step
- evidence-level discipline
- explicit exclusion / delay recording
- incremental update discipline
- document impact recording

These strengthen analysis quality without changing the backend-first mental model.

## 5. What Should Stay in the Extension Skill

These are mixed-stack-specific and should stay in the extension layer unless the base skill is intentionally redesigned:

- app / H5 / Python / mixed-repo classification rules
- bridge-focused route analysis
- app-to-H5 and H5-to-native mapping patterns
- IM / SSE / callback / task mixed-stack communication patterns
- mixed-stack noise-exclusion rules
- interface-mapping pages across caller and handler layers
- mixed-stack domain pages using `domain -> entry surfaces -> systems/modules -> rules/specs`

## 6. Safe Cooperation Rule

The base skill remains the primary workflow.

The extension skill should:

- adapt terminology only when needed
- add mixed-stack references only when the repository shape requires it
- avoid changing the default backend-oriented flow for ordinary service repositories

## 7. Recommended Team Rule

Use this decision rule:

- if backend-service language is sufficient, use the base skill only
- if backend-service language distorts the repository shape, enable the extension skill
- if both are needed, keep the base skill as the main workflow and use the extension skill as an adaptation layer

## 8. Recommended Phrases

Use phrases like:

- `Base skill remains the default workflow`
- `Extension skill enabled for mixed-stack adaptation`
- `Generic discipline can flow back into the base skill`
- `Mixed-stack-specific rules remain opt-in`
