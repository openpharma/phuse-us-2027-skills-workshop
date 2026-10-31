---
name: spine-to-ard
description: Generate R code for each analysis-spine entry to build Analysis Results Data using cards and cardx, filtered by the specified population flag, with checks and SAP traceability.
---

# Spine to ARD

For each entry in `spine/spine.yml`, generate a focused R analysis that reads only its declared ADaM datasets and variables. Follow the declared population flag and use `{cards}` / `{cardx}` to construct the Analysis Results Data (ARD).

## Requirements

- Do not create or assume variables not listed in the spine or present in the input ADaM data.
- Filter to the declared population before computing results. If the population flag or source dataset is missing, ask the user rather than choosing a default.
- Use `stopifnot()` to check required columns, population flag validity, and non-empty analysis data before summarizing.
- Include a trace comment with the exact `sap_id` beside each analysis.
- Use R's native pipe (`|>`) and state all protocol-specific decisions with `# REVIEW:`.
- Keep outputs organized by `output_id`; do not substitute a different analysis when the input is insufficient.

Consult [references/ard-pattern.md](references/ard-pattern.md) for a minimal traceable pattern. The card API can vary by package version; verify the installed package documentation instead of inventing arguments.

## Credits

Uses `{cards}` and `{cardx}` (pharmaverse ecosystem) and `posit-dev/skills` progressive-disclosure conventions (MIT). Original workshop instructions; see repository acknowledgements.
