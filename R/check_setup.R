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

failed <- character()
for (package in packages) {
  available <- requireNamespace(package, quietly = TRUE)
  if (available) {
    version <- as.character(utils::packageVersion(package))
    cat("[ OK ] ", package, " ", version, "\n", sep = "")
  } else {
    cat("[FAIL] ", package, "\n", sep = "")
    failed <- c(failed, package)
  }
}

if (length(failed) > 0L) {
  quit(status = 1L)
}
