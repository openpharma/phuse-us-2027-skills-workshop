skill_files <- list.files(
  ".agents/skills",
  pattern = "^SKILL\\.md$",
  recursive = TRUE,
  full.names = TRUE
)
if (length(skill_files) == 0L) {
  stop("No SKILL.md files were found.")
}

for (skill_file in skill_files) {
  lines <- readLines(skill_file, warn = FALSE)
  if (length(lines) >= 500L) {
    stop(skill_file, " must be under 500 lines.")
  }
  if (!length(lines) || lines[[1L]] != "---") {
    stop(skill_file, " must start with YAML frontmatter.")
  }
  closing <- which(lines[-1L] == "---")
  if (!length(closing)) {
    stop(skill_file, " has no closing frontmatter delimiter.")
  }
  frontmatter_lines <- lines[seq.int(2L, closing[[1L]])]
  frontmatter <- yaml::yaml.load(paste(frontmatter_lines, collapse = "\n"))
  if (
    !is.list(frontmatter) ||
      !is.character(frontmatter$name) ||
      length(frontmatter$name) != 1L ||
      !nzchar(frontmatter$name) ||
      !is.character(frontmatter$description) ||
      length(frontmatter$description) != 1L ||
      !nzchar(frontmatter$description)
  ) {
    stop(skill_file, " must have non-empty name and description fields.")
  }
  license_file <- file.path(dirname(skill_file), "LICENSE")
  if (!file.exists(license_file)) {
    stop(skill_file, " has no adjacent LICENSE.")
  }
}

vendored_dirs <- file.path(".agents", "skills", "admiral-adsl")
for (vendored_dir in vendored_dirs) {
  if (!file.exists(file.path(vendored_dir, "UPSTREAM.md"))) {
    stop(vendored_dir, " has no UPSTREAM.md.")
  }
}

if (!file.exists("NOTICE.md")) {
  stop("NOTICE.md is required.")
}
message("Skill metadata and attribution checks passed.")
