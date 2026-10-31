---
name: sap-to-spine
description: Translate an SAP excerpt into a reviewable spine/spine.yml mapping each SAP analysis to population, ADaM datasets and variables, shell_id, and output_id. Use when mapping protocol analyses or resolving SAP-to-output traceability.
---

# SAP to analysis spine

Read the supplied SAP excerpt and corresponding mock shells. Update `spine/spine.yml` using the schema in [references/spine-schema.md](references/spine-schema.md).

## Workflow

1. Extract every stated analysis and its exact `sap_id`, population, analysis dataset, required variables, and shell/output identifiers.
2. Link a shell only when the SAP or shell explicitly supports the mapping. Do not invent IDs, dataset names, variable names, flags, or analysis rules.
3. If any mapping is ambiguous, list the unanswered question and ask the user before writing a completed entry. Leave unresolved values as `null`; do not guess.
4. Preserve explicit population flag names such as `SAFFL` or `ITTFL`. Distinguish the population from the dataset used to derive it.
5. Add a short `rationale` with the SAP section that supports the mapping and identify any human review needed.
6. Validate YAML structure and confirm that every shell and output ID is unique and that every analysis has an SAP ID.

## Review

Use `# REVIEW:` in associated R code at protocol-specific choices. The spine is an auditable map, not authority to change the SAP. Escalate contradictions between the SAP and shell instead of silently resolving them.

## Credits

Uses the open Agent Skills specification and `posit-dev/skills` authoring conventions (MIT); the training excerpt is synthetic and modeled on the public CDISC Pilot 01 study design. See the repository README and NOTICE for upstream details.
