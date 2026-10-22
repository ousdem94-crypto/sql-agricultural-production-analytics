# Agricultural Production Analytics with SQL

## Project status

**In progress — Phase 1: Audit & Diagnostic**

This project uses FAOSTAT crop and livestock production data, with an initial analytical focus on Mali. The work is being developed incrementally: each audit step is documented and validated before moving to the next phase.

## Business objective

Understand the structure, coverage, and reliability of the FAOSTAT agricultural and livestock dataset before conducting country-focused analysis for Mali.

## Data source and structure

- Source file: `Production_Crops_Livestock_E_All_Data_NOFLAG.csv`
- Database/table currently used in DBeaver/MySQL: `production_crops_livestock_e_all_data_noflag`
- Descriptive dimensions include `Area`, `Item`, `Element`, and `Unit`, with annual columns from `Y1961` to `Y2023`.

The source CSV is not included in this repository at this stage.

## Work completed so far

Initial checks performed in DBeaver:

| Control | Result |
|---|---:|
| Total rows in the table | 75,000 |
| Rows for Mali | 317 |
| Distinct items across the complete table | 302 |
| Distinct items represented for Mali | 132 |

A first visual inspection identified `Area harvested`, `Yield`, `Production`, and `Stocks` among the `Element` categories, with different units. Some annual fields contain `NULL` values. These observations will be investigated during the audit; they are not yet classified as errors.

## Methodology

1. Audit and diagnose the raw data.
2. Review data quality, coverage, missing values, and logical duplicates.
3. Check the plausibility of indicator values against the actual `Element` and `Unit` categories present.
4. After the audit is complete, define and perform business-focused analyses for Mali.
5. Document validated queries, findings, and limitations as the project progresses.

## Repository structure

```text
sql-agricultural-production-analytics/
├── README.md
└── sql/
    └── 01_audit_diagnostic.sql
```

The SQL script will be expanded incrementally as audit sections are completed and reviewed.

## Current audit plan

1. Table identification and structure
2. Row counts, including Mali
3. Inspection of initial observations
4. Distinct items
5. Distinct areas
6. Distinct area codes
7. Distinct M49 area codes
8. Distinct item codes
9. Distinct CPC item codes
10. Distinct element codes
11. Distinct elements
12. Distinct units
13. Time-period coverage
14. Number of distinct years
15. Logical duplicate checks
16. NULL-value checks
17. Empty-value checks
18. Minimum and maximum harvested-area values
19. Minimum and maximum yield values
20. Minimum and maximum production values
21. Minimum and maximum stock values

Some checks may be refined after confirming the exact indicator categories and units in the imported table. The project remains in the audit phase; exploratory data analysis has not started.

## Tools

- MySQL
- DBeaver
- GitHub

## Notes

Results recorded here reflect the current local database and the checks performed so far. They will be updated if later validation changes the interpretation or figures.
