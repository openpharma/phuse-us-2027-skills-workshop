# Skills, Not Prompts: Building and Open-Sourcing AI Agent Skills from SAP to TFL

A 90-minute, mostly hands-on PHUSE US workshop for statistical programmers working with SDTM, ADaM, and TFLs. Participants use a Posit-hosted Positron instance with Posit Assistant to build a traceable SAP-to-table workflow using harness-agnostic Agent Skills.

## Credits & Acknowledgements

This workshop builds on open-source work and standards; it does not present upstream skills or conventions as original work.

- **RConsortium/pharma-skills** ([repository](https://github.com/RConsortium/pharma-skills)) is the R Consortium Submissions Working Group Pilot 7, a joint effort with the BBSW AI committee, and the source of the vendored `admiral` skills. The upstream skill is MIT-licensed; see [NOTICE.md](NOTICE.md) for the pinned revision, file-level attribution, and license text.
- **Jeff Dickinson, PhD (Navitas Data Sciences), and Eric Zhang, PhD (Eikon Therapeutics)** created the R/Pharma 2026 workshop “Hands-On AI Skills for Clinical Programming & Biostatistics” (1 October 2026): [source repository](https://github.com/jeffreyad/rpharma-2026-workshop) · [slides](https://jeffreyad.github.io/rpharma-2026-workshop/). This is a link-only credit for inspiration on workshop format; no files or text from that workshop are copied here. **TODO:** Check that repository's `LICENSE` before considering any reuse.
- **Posit PBC / posit-dev/skills** ([repository](https://github.com/posit-dev/skills), MIT license) informed our skill-authoring conventions, including progressive disclosure via `references/` and keeping `SKILL.md` under 500 lines.
- **The Agent Skills open specification** ([specification](https://agentskills.io/specification.md)) defines the portable `SKILL.md` format used here; this project implements the format and does not vendor specification text.
- **pharmaverse** packages used or discussed are [{admiral}](https://github.com/pharmaverse/admiral), [{pharmaversesdtm}](https://github.com/pharmaverse/pharmaversesdtm), [{pharmaverseadam}](https://github.com/pharmaverse/pharmaverseadam), [{metacore}](https://github.com/pharmaverse/metacore), [{cards}](https://github.com/insightsengineering/cards), [{cardx}](https://github.com/insightsengineering/cardx), [{gtsummary}](https://github.com/ddsjoberg/gtsummary), and [{yaml}](https://github.com/vubiostat/r-yaml). Their package licenses apply to their respective software; no package source code is vendored here.
- **CDISC** ([Pilot 01 study design](https://www.cdisc.org/), xanomeline versus placebo) is the model for the clearly synthetic training SAP. No participant-level CDISC data are included.

This workshop extends ADaM derivation into an SAP-to-TFL spine and adds a skill-authoring lab and an open-licensing discussion.

## Learning objectives

By the end of the session, participants can:

1. Use a portable Agent Skill to guide an `admiral` derivation and compare assisted and unassisted work.
2. Translate an SAP excerpt into an explicit, reviewable analysis spine.
3. Trace an output table through its ARD and ADaM inputs back to its SAP analysis ID.
4. Draft and benchmark a small skill, and identify what must be licensed and attributed before sharing it.

## Agenda (90 minutes)

| Minutes | Activity |
| ---: | --- |
| 5 | Welcome, goals, and responsible use |
| 10 | Agent Skills and the Positron environment |
| 15 | Lab 1: run an `admiral-adsl` skill, then repeat with the skill disabled |
| 25 | Lab 2: SAP → spine → ADaM → ARD → TFL |
| 20 | Lab 3: author and benchmark a skill |
| 10 | Open licensing, attribution, and discussion |
| 5 | Wrap-up and next steps |

## Quick start: Posit-hosted Positron

1. Open the workshop project in the Posit-hosted Positron instance and confirm that Posit Assistant is available.
2. Open `R/install_packages.R` and run it once if the listed packages are missing; then run `R/check_setup.R`.
3. Open `labs/lab1-run-a-skill.md` and follow the lab. Skills live in `.agents/skills/`, the harness-agnostic Agent Skills location.
4. If the `admiral-adsl` skill has not yet been populated, follow the placeholder README in that directory and run `Rscript tools/sync_upstream.R` from the repository root.

For offline fallback, use the synthetic SAP at `study/sap/sap_excerpt.md`, the spine template at `spine/spine.yml`, and the worked examples in `labs/solutions/`.

## Repository map

- `.agents/skills/` — workshop skills, reusable template, and synced upstream `admiral` skill.
- `study/`, `spine/` — synthetic protocol excerpt, mock shells, and SAP-to-analysis mapping.
- `labs/` — facilitator-ready activities and runnable fallback scripts.
- `slides/index.qmd` — concise Quarto RevealJS deck skeleton.
- `tools/sync_upstream.R` — pinned, reproducible import of upstream skill material and attribution notices.

## Safety and scope

All examples are synthetic and for training only. AI-generated code, derivations, and tables must be independently reviewed, validated, and QC'd by qualified personnel before any GxP use. Nothing in this workshop is validated for production or regulatory submission.

## License

The MIT license in [LICENSE](LICENSE) covers only original workshop content. Third-party material retains its own terms; see [NOTICE.md](NOTICE.md) and the license files in the relevant skill directories.

## TODOs before delivery

- Replace `[Your name]` in `LICENSE` with the workshop copyright holder.
- Set the delivery date and add final facilitator/speaker details.
- Review and confirm the pinned `pharma-skills` commit in `tools/sync_upstream.R` and rerun the sync if it changes.
- Check the R/Pharma 2026 repository's `LICENSE`; do not reuse its files or text without permission.
- Add final slide, Posit instance, and workshop registration links where marked in the materials.
