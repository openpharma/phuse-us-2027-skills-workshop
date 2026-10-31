# Lab 2 — Follow the spine from SAP to TFL (25 minutes)

**Credit:** Uses the workshop's `sap-to-spine`, `spine-to-ard`, and `ard-to-tfl` skills; `{cards}`, `{cardx}`, `{gtsummary}`, and the synthetic SAP modeled on CDISC Pilot 01.

## Goal

Create a traceable path from one SAP analysis to ADaM inputs, an ARD, and a mock table.

## Steps

1. Read `study/sap/sap_excerpt.md` and both shells in `study/shells/`. Note each exact SAP, shell, population, dataset, and variable name.
2. Use `.agents/skills/sap-to-spine/SKILL.md` to copy supported mappings into `spine/spine.yml`. Ask about any ambiguity; compare with `spine/spine_solution.yml` only after your first attempt.
3. Use `.agents/skills/spine-to-ard/SKILL.md` to build checked, population-filtered ARDs. Include a `stopifnot()` for each required input and a comment with the exact `sap_id`.
4. Use `.agents/skills/ard-to-tfl/SKILL.md` to render the ARDs to the mock shells. Save outputs under `outputs/` using each exact `output_id`.
5. Trace each cell back through the ARD and ADaM variables to its spine entry and SAP section. Flag unsupported decisions with `# REVIEW:`.
6. Run `Rscript labs/solutions/lab2-spine.R` for a reproducible synthetic walkthrough if the model stalls.

## Discussion

Where does the chain need explicit review? What would you QC differently before any GxP use?
