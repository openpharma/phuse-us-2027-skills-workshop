---
name: ard-to-tfl
description: Render a reviewed Analysis Results Data object to a table matching its declared shell using gtsummary, and save it under outputs/ using the spine output_id.
---

# ARD to TFL

Read the relevant spine entry and mock shell before rendering. Use `{gtsummary}` to produce a table that matches the shell's requested title, row structure, columns, and display conventions.

## Requirements

- Use only the ARD and analysis specified by the spine; do not recalculate or silently alter the analysis.
- Match the shell's layout. If a statistic, label, denominator, or layout detail is missing or contradictory, ask the user.
- Write the deliverable under `outputs/` with a filename based on the exact `output_id`.
- Record the `sap_id` and `shell_id` in a trace note or output metadata.
- Validate the result against the shell before presenting it; do not claim regulatory readiness.
- Use only package APIs supported by the installed version.

See [references/rendering.md](references/rendering.md) for a rendering checklist.

## Credits

Uses `{gtsummary}` and the workshop's synthetic SAP and mock shells. Skill organization follows `posit-dev/skills` (MIT); see repository acknowledgements.
