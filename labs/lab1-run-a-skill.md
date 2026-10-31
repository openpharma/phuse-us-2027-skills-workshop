# Lab 1 — Run a skill, then compare without it (15 minutes)

**Credit:** Uses the vendored `admiral-adsl` skill from [RConsortium/pharma-skills](https://github.com/RConsortium/pharma-skills) (Pilot 7, MIT); the exercise's study inputs are synthetic.

## Goal

See how a skill guides an `admiral` ADSL derivation, then check whether the same explicit instructions improve a second attempt.

## Steps

1. If not already synced, run `Rscript tools/sync_upstream.R` from the repository root. Read `.agents/skills/admiral-adsl/SKILL.md` and the synthetic SAP population definitions.
2. Ask Posit Assistant to derive ADSL from the supplied synthetic DM and exposure inputs. Require `ITTFL` and `SAFFL`, trace decisions, and mark protocol-specific choices with `# REVIEW:`.
3. Check that the assistant uses the skill's guidance and only supplied variables. Review the output against the SAP; do not treat it as validated.
4. Disable or temporarily move the skill from the assistant's active skills location. Repeat the same task in a fresh conversation with the same inputs.
5. Compare completeness, unsupported assumptions, checks, and traceability. Record differences; do not select an answer based only on style.
6. Run `Rscript labs/solutions/lab1-adsl.R` for a deterministic synthetic fallback.

## Discussion

Which parts of the output were made more reliable by persistent instructions? Which protocol-specific decisions still needed a human answer?
