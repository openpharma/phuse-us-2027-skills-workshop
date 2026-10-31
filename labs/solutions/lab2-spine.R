# Credit: Uses the workshop's synthetic SAP and spine; ARD/TFL APIs are from cards and gtsummary.

required_packages <- c("yaml", "cards", "gtsummary")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]
if (length(missing_packages) > 0L) {
  stop("Install required packages first: ", paste(missing_packages, collapse = ", "))
}

dir.create("outputs", showWarnings = FALSE)
spine <- yaml::read_yaml("spine/spine_solution.yml")
demog <- spine[[which(vapply(spine, `[[`, character(1), "sap_id") == "SAP-9.2")]]
ae <- spine[[which(vapply(spine, `[[`, character(1), "sap_id") == "SAP-14.3.1")]]

ADSL <- data.frame(
  USUBJID = sprintf("SUBJ-%02d", 1:8),
  ARM = c("Placebo", "Xanomeline", "Placebo", "Xanomeline",
          "Placebo", "Xanomeline", "Placebo", "Xanomeline"),
  AGE = c(62, 70, 55, 66, 73, 59, 64, 68),
  SEX = c("F", "M", "F", "F", "M", "M", "F", "M"),
  RACE = c("White", "Black", "White", "Asian", "Black", "White", "Asian", "White"),
  ITTFL = "Y",
  SAFFL = c("Y", "Y", "N", "Y", "Y", "Y", "Y", "N"),
  stringsAsFactors = FALSE
)

ADAE <- data.frame(
  USUBJID = c("SUBJ-01", "SUBJ-01", "SUBJ-02", "SUBJ-06", "SUBJ-05", "SUBJ-07"),
  ARM = c("Placebo", "Placebo", "Xanomeline", "Xanomeline", "Placebo", "Placebo"),
  SAFFL = "Y",
  TRTEMFL = "Y",
  AESOC = c("Gastrointestinal disorders", "Nervous system disorders",
            "Gastrointestinal disorders", "Nervous system disorders",
            "Skin disorders", "Gastrointestinal disorders"),
  AEDECOD = c("Nausea", "Dizziness", "Nausea", "Headache", "Rash", "Diarrhoea"),
  stringsAsFactors = FALSE
)

adsl_itt <- ADSL[ADSL[[demog$population_flag]] == "Y", , drop = FALSE]
required_demog <- sub("^ADSL\\.", "", unlist(demog$variables))
stopifnot(all(required_demog %in% names(ADSL)))
stopifnot(nrow(adsl_itt) > 0L)
stopifnot(all(c("AGE", "SEX", "RACE", "ARM") %in% names(adsl_itt)))

age_ard <- cards::ard_summary(
  data = adsl_itt,
  by = "ARM",
  variables = "AGE",
  statistic = list(AGE = list(mean = mean, sd = stats::sd))
)
sex_ard <- cards::ard_tabulate(data = adsl_itt, by = "ARM", variables = "SEX")
race_ard <- cards::ard_tabulate(data = adsl_itt, by = "ARM", variables = "RACE")
demog_ard <- cards::bind_ard(age_ard, sex_ard, race_ard)
saveRDS(demog_ard, "outputs/lab2-demographics-ard.rds")

demog_table <- gtsummary::tbl_ard_summary(
  cards = demog_ard,
  by = ARM,
  statistic = list(
    gtsummary::all_continuous() ~ "{mean} ({sd})",
    gtsummary::all_categorical() ~ "{n} ({p}%)"
  )
) |>
  gtsummary::as_tibble()
write.csv(demog_table, file.path("outputs", paste0(demog$output_id, ".csv")), row.names = FALSE)

adsl_safety <- ADSL[ADSL[[ae$population_flag]] == "Y", , drop = FALSE]
adae_safety <- ADAE[ADAE[[ae$population_flag]] == "Y" & ADAE$TRTEMFL == "Y", , drop = FALSE]
required_ae <- sub("^ADAE\\.", "", unlist(ae$variables))
stopifnot(all(required_ae %in% names(ADAE)))
stopifnot(nrow(adae_safety) > 0L)
stopifnot(all(c("USUBJID", "ARM", "AESOC", "AEDECOD") %in% names(adae_safety)))

ae_ard <- cards::ard_stack_hierarchical(
  data = adae_safety,
  variables = c("AESOC", "AEDECOD"),
  by = "ARM",
  denominator = adsl_safety,
  id = "USUBJID"
)
saveRDS(ae_ard, "outputs/lab2-ae-ard.rds")
ae_table <- gtsummary::tbl_ard_hierarchical(
  cards = ae_ard,
  variables = c("AESOC", "AEDECOD"),
  by = "ARM"
) |>
  gtsummary::as_tibble()
write.csv(ae_table, file.path("outputs", paste0(ae$output_id, "-soc-pt.csv")), row.names = FALSE)

subjects_with_ae <- unique(adae_safety[c("USUBJID", "ARM")])
ae_summary <- do.call(rbind, lapply(unique(adsl_safety$ARM), function(arm) {
  n <- sum(subjects_with_ae$ARM == arm)
  denominator <- sum(adsl_safety$ARM == arm)
  data.frame(
    ARM = arm,
    n = n,
    N = denominator,
    percent = 100 * n / denominator,
    sap_id = ae$sap_id
  )
}))
write.csv(ae_summary, file.path("outputs", paste0(ae$output_id, "-overall.csv")), row.names = FALSE)
message("Synthetic ARDs and shell-named tables saved under outputs/.")
