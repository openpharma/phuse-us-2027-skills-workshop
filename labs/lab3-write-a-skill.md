# Lab 3 — Write and benchmark a skill (20 minutes)

**Credit:** Uses Posit Assistant's built-in `create-skill` capability and conventions from [posit-dev/skills](https://github.com/posit-dev/skills) (MIT); benchmark examples are original workshop content.

## Goal

Create a small portable skill, measure its behavior with a benchmark, and make its provenance clear.

## Steps

1. Ask Posit Assistant to use its built-in `create-skill` capability. Base the skill on `.agents/skills/_skill-template/`; do not ask it to copy upstream text.
2. Suggested ideas: validate spine YAML against its schema; check an R script for missing `# REVIEW:` markers; verify an output folder is named by spine `output_id`.
3. Keep the skill's `SKILL.md` below 500 lines. Move details into `references/` and keep the description specific about when the skill should activate.
4. Add a benchmark prompt, an expected outcome, and a rubric with observable criteria. Run the same prompt with the skill enabled and disabled.
5. Add a README `Credits` section identifying authors, sources, licenses, and changes. Preserve any upstream license unchanged and use `UPSTREAM.md` plus `NOTICE.md` for vendored files.
6. Run `Rscript labs/solutions/lab3-skill.R` to generate a deterministic example structure if needed.

## Discussion

What would be required before publishing this skill? Which content belongs upstream at [RConsortium/pharma-skills](https://github.com/RConsortium/pharma-skills) rather than in this workshop?
