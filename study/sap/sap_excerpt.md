# Synthetic SAP excerpt — training only

This short, synthetic excerpt is modeled on the public CDISC Pilot 01 xanomeline-versus-placebo study design. It is not a clinical protocol and must not be used for a real study. **Credit:** CDISC Pilot 01 study design; no participant-level CDISC data are reproduced.

## SAP-9.1 — Analysis populations

The Safety Population (`SAFFL = "Y"`) includes randomized participants who received at least one dose of study treatment. The Intent-to-Treat Population (`ITTFL = "Y"`) includes all randomized participants. Use these population flags as specified for the analyses below.

## SAP-9.2 — Demographics and baseline characteristics

Summarize age, sex, and race by randomized treatment group for the Intent-to-Treat Population. Report age as mean (standard deviation); report sex and race as participant count and percentage. Use the mock shell `T-14.1.1`.

## SAP-14.3.1 — Overall adverse event summary and events by SOC/PT

For the Safety Population, summarize participants with at least one treatment-emergent adverse event (`TRTEMFL = "Y"`) by treatment group as participant count and percentage of the Safety Population. Also summarize participants by System Organ Class and Preferred Term, counting each participant once within each category. Use the mock shell `T-14.3.1`. The shell contains both the overall summary and the SOC/PT breakdown.

**Review note:** This training excerpt deliberately omits analysis conventions not needed by these mock shells. Ask the facilitator rather than inferring missing definitions or statistics.
