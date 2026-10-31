# Credit: Demonstration template follows posit-dev/skills authoring conventions (MIT).

skill_dir <- file.path("outputs", "lab3-example-skill")
dir.create(file.path(skill_dir, "benchmarks", "expected"), recursive = TRUE, showWarnings = FALSE)
dir.create(file.path(skill_dir, "references"), recursive = TRUE, showWarnings = FALSE)

writeLines(c(
  "---",
  "name: check-output-trace",
  "description: Check that a generated workshop table is traceable to its declared SAP and shell IDs.",
  "---",
  "",
  "# Check output trace",
  "",
  "Read the spine entry and output metadata. Confirm exact sap_id, shell_id, and output_id values.",
  "Ask the user when any identifier is missing or inconsistent; never infer a replacement.",
  "",
  "## Credits",
  "",
  "Original workshop example; author and license details must be reviewed before publication."
), file.path(skill_dir, "SKILL.md"))

writeLines(c(
  "# Check output trace",
  "",
  "## Credits",
  "",
  "Original workshop example using the open Agent Skills specification."
), file.path(skill_dir, "README.md"))
writeLines(c(
  "# Benchmark prompt",
  "",
  "Check whether outputs/T-14.1.1.csv has a trace to SAP-9.2 and T-14.1.1. Ask if metadata is absent."
), file.path(skill_dir, "benchmarks", "prompt.md"))
writeLines(c(
  "# Expected behavior",
  "",
  "Confirm exact identifiers only when they are present in the spine and shell; otherwise ask a question."
), file.path(skill_dir, "benchmarks", "expected", "README.md"))
writeLines(c(
  "# Rubric",
  "",
  "- 1 point: checks the exact SAP, shell, and output identifiers.",
  "- 1 point: asks about missing or inconsistent identifiers instead of guessing."
), file.path(skill_dir, "benchmarks", "rubric.md"))
file.copy(".agents/skills/_skill-template/LICENSE", file.path(skill_dir, "LICENSE"), overwrite = TRUE)
message("Example skill created at ", skill_dir)
