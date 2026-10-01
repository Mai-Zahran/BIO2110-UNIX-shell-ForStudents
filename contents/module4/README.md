# Module 4: Transforming Structured Text with sed and awk

Files for Book Chapter 4 (Binder), Lab Activity 4 and Practice Assignment 4 (Google Cloud Shell).

| Folder | What it holds |
| --- | --- |
| `data/` | The five chapter files: `patient_records.txt`, `patient_data.txt`, `gene_sequences.txt`, `hospital_logs.txt`, `multi_line_patients.txt`. Originals. Do not edit them in place. |
| `examples/` | Working copies made with `cp` before using `sed -i`. |
| `reports/` | Results saved with `>`. |
| `scripts/` | `setup_module4_lab_activity.sh` builds `lab_activity4/`. `setup_module4_assignment.sh` builds `practice/`. `setup_module4_lab_assignment.sh` builds `lab_assignment4/` for the graded assignment. |

Run a setup script from the repository root:

    git pull
    bash contents/module4/scripts/setup_module4_lab_activity.sh

Each script can be run again at any time. It rebuilds the data files and leaves `reports/` alone.
