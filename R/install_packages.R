packages <- c(
  "admiral",
  "pharmaversesdtm",
  "pharmaverseadam",
  "metacore",
  "cards",
  "cardx",
  "gtsummary",
  "yaml"
)

missing <- packages[
  !vapply(packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing) > 0L) {
  install.packages(missing, repos = "https://cloud.r-project.org")
}

message("Package installation step complete.")
