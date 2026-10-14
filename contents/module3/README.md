# Module 3: grep and basic regular expressions

| Path | Purpose |
|---|---|
| `data/`, `logs/`, `examples/`, `reports/`, `labs.csv` | Chapter files, committed so that they exist in Binder (Book Chapter 3). Lab Activity 3, Activities 1 to 3, also use `data/`. |
| `scripts/setup_module3_lab_activity.sh` | Builds `lab_activity3/` (500 results, 240 visits, 300 vitals, a 70-line ID list, sequences, a log) for Lab Activity 3 |
| `scripts/setup_module3_practice_assignment.sh` | Builds `practice_assignment3/` (480 results and 12 sequences) for Practice Assignment 3 |
| `scripts/setup_module3_lab_assignment.sh` | Builds `lab_assignment3/` (360 results and 12 sequences, a different data set) for the graded Lab Assignment 3 |
| `lab_activity3/`, `practice_assignment3/`, `lab_assignment3/` | Empty until the scripts are run in Cloud Shell |

Run every script from the repository root with `bash`, for example:

    bash contents/module3/scripts/setup_module3_lab_activity.sh

Each script embeds its data, prints a line-count spot check, is safe to run again, and never touches `outputs/`.
All data are synthetic.
