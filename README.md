# Coding Task Audits

Audits of a few small coding tasks from public AI benchmarks (SWE-bench Verified, Terminal-Bench, and similar). Each task is checked for defects in its instructions, tests, reference solution, and environment, or confirmed as valid.

The audits use a coding agent (Claude Code). Every finding is checked and reproduced by hand in a clean container before it is reported.

> **Status:** work in progress. See [SUMMARY.md](SUMMARY.md) for the current results.

## What each audit contains

Each report in [`reports/`](reports/) follows [the template](reports/TEMPLATE.md):

- **Verdict:** Valid, Defective, or Uncertain
- **Defect type:** one of six fixed categories (see [METHOD.md](METHOD.md#defect-taxonomy))
- **Evidence:** quotes from the problem statement, tests, or agent logs
- **Reproduction:** a `repro.sh` script or commands that show the issue in a clean container
- **Impact** and **suggested fix**
- **Agent vs. me:** what the agent did, what I verified myself, and where the agent was wrong

## Repository layout

```
coding-task-audits/
├── README.md
├── METHOD.md       # workflow, evidence rules, defect taxonomy
├── SUMMARY.md      # one table covering all tasks
├── reports/
│   ├── TEMPLATE.md
│   └── task-XX.md
└── tasks/
    └── task-XX-<name>/
        ├── PROBLEM.md   # problem statement and source
        ├── Dockerfile
        ├── notes.md     # working notes
        ├── repro.sh     # reproduces the finding
        └── logs/        # agent logs and trajectory excerpts
```

`tasks/_template/` holds empty versions of these files to copy for a new task.

## Reproducing a finding

Requires Docker and Bash.

```bash
cd tasks/task-XX-<name>
bash repro.sh
```

## Sources and licenses

Every task comes from a public source. The source and license are listed at the top of its report.
