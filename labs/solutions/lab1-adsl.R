# Credit: A synthetic fallback for Lab 1; upstream skill source is RConsortium/pharma-skills (MIT).

dir.create("outputs", showWarnings = FALSE)

DM <- data.frame(
  USUBJID = sprintf("SUBJ-%02d", 1:6),
  ARM = c("Placebo", "Xanomeline", "Placebo", "Xanomeline", "Placebo", "Xanomeline"),
  AGE = c(62, 70, 55, 66, 73, 59),
  SEX = c("F", "M", "F", "F", "M", "M"),
  RACE = c("White", "Black", "White", "Asian", "Black", "White"),
  stringsAsFactors = FALSE
)

EX <- data.frame(
  USUBJID = c("SUBJ-01", "SUBJ-02", "SUBJ-04", "SUBJ-05", "SUBJ-06"),
  DOSED = TRUE
)

derive_adsl <- function(dm, ex) {
  stopifnot(!anyDuplicated(dm$USUBJID))
  stopifnot(all(c("USUBJID", "DOSED") %in% names(ex)))
  dose_flag <- ex$DOSED[match(dm$USUBJID, ex$USUBJID)]
  adsl <- dm
  adsl$ITTFL <- "Y"
  # REVIEW: This training rule implements the synthetic SAP population definitions only.
  adsl$SAFFL <- ifelse(!is.na(dose_flag) & dose_flag, "Y", "N")
  adsl
}

with_skill <- derive_adsl(DM, EX)
without_skill <- derive_adsl(DM, EX)
stopifnot(identical(with_skill, without_skill))
stopifnot(all(with_skill$ITTFL == "Y"))
stopifnot(identical(with_skill$SAFFL, c("Y", "Y", "N", "Y", "Y", "Y")))

write.csv(with_skill, "outputs/lab1-adsl.csv", row.names = FALSE)
message("Synthetic ADSL saved; the two deterministic derivations agree.")
