# Analysis spine schema

`spine/spine.yml` is a YAML list of analysis entries. Each `sap_id` must match an ID in the SAP excerpt.

| Key | Meaning |
| --- | --- |
| `sap_id` | Exact SAP section identifier |
| `population` | Human-readable analysis population |
| `population_flag` | Exact ADaM population flag, or `null` if not specified |
| `datasets` | ADaM dataset names used by the analysis |
| `variables` | Variables needed for the analysis; use dataset-qualified names |
| `shell_id` | Exact shell identifier, or `null` if no shell is supplied |
| `output_id` | Stable output name derived from a stated shell/output identifier |
| `rationale` | Evidence or unresolved questions; do not infer missing protocol decisions |

Example shape only; these values are not study specifications:

```yaml
- sap_id: SAP-X.Y
  population: null
  population_flag: null
  datasets: []
  variables: []
  shell_id: null
  output_id: null
  rationale: "Unresolved: ask the user which population is intended."
```
