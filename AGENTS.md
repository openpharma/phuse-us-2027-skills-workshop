# Project instructions for AI agents

- Read the relevant `SKILL.md`, SAP analysis ID, shell, and `spine/spine.yml` before editing a lab or solution.
- Skills belong in `.agents/skills/<skill-name>/SKILL.md` and follow the open Agent Skills specification: YAML frontmatter with `name` and `description`.
- Keep each `SKILL.md` under 500 lines. Put detailed material in `references/` and link to it from the skill.
- Use R's native pipe (`|>`) and established `admiral` derivation idioms in R examples.
- Add `# REVIEW:` at protocol-specific decisions, and ask when the SAP is ambiguous rather than guessing.
- Do not invent variables outside the declared analysis spine. Keep all data synthetic or public and attributed.
- Preserve upstream files and licenses unchanged. Record source, pinned commit, and any non-derivation changes in `UPSTREAM.md` and `NOTICE.md`.
- Independently QC all AI-generated code and outputs before any GxP use.
