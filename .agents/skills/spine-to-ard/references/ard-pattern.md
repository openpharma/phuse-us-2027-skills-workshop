# Traceable ARD pattern

Use the installed `{cards}` and `{cardx}` documentation to select the appropriate constructor for the analysis. Keep the validation and trace adjacent to it:

```r
# SAP-9.1 — replace with the exact spine sap_id.
required <- c("USUBJID", "SAFFL", "AGE")
stopifnot(all(required %in% names(adsl)))
stopifnot(all(stats::na.omit(adsl$SAFFL) %in% c("Y", "N")))

analysis_data <- adsl |>
  dplyr::filter(SAFFL == "Y")
stopifnot(nrow(analysis_data) > 0L)

# REVIEW: confirm the statistic and denominator against the SAP.
# Construct the ARD with the installed cards/cardx API.
```

This is a validation/traceability pattern, not a complete analysis or a protocol-specific decision. Never fill in the placeholder SAP ID or choose statistics without SAP support.
