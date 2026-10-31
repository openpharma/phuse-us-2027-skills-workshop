# Contributing

Contributions should support the workshop's SAP-to-TFL learning goals, remain concise, use only public or synthetic data, and preserve traceability from each result to its SAP analysis ID.

## Adding or changing skills

- Put skills under `.agents/skills/` and follow the open Agent Skills `SKILL.md` format.
- Keep `SKILL.md` below 500 lines; move longer explanations to `references/`.
- Include a benchmark prompt, expected behavior, rubric, README `Credits` section, and the appropriate `LICENSE`.
- Do not copy upstream work without checking its license. Keep vendored files, their licenses, and attribution intact; update `UPSTREAM.md` and `NOTICE.md` when syncing.
- When a useful change is specific to an upstream project, propose it there first or submit it upstream to [RConsortium/pharma-skills](https://github.com/RConsortium/pharma-skills). This workshop should not become an uncredited fork of upstream skills.
- The R/Pharma 2026 workshop is linked only as format inspiration. Do not copy its files or text unless its license has been checked and permits reuse.

## R and review

Use native pipes (`|>`), established pharmaverse conventions, synthetic/public data, and `# REVIEW:` markers wherever a protocol-specific choice needs a human decision. Add or update a focused validation when behavior changes. Review all AI-generated content independently before any GxP use.

## Submitting changes

Open an issue or pull request with a short explanation, source/credit changes, and checks performed. Do not include confidential, patient-level, or otherwise non-public data.
