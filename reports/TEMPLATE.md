# Task XX: <name>

- **Source:** <benchmark / repo, task ID, link>
- **Version:** <commit or dataset version>
- **License:** <license>
- **Audited:** <YYYY-MM-DD>

## Verdict

Valid / Defective / Uncertain

## Defect type

<One of: instruction underspecified, test overspecified, test underspecified, oracle bug, information leakage, environment issue. "None" if Valid.>

## Summary

<Two or three sentences: what is wrong, or why the task is valid.>

## Evidence

<Each claim followed by its evidence: a quote from the problem statement, a test assertion, or a log line, with file and line.>

## Reproduction

```bash
cd tasks/task-XX-<name>
bash repro.sh
```

**Expected:** <what a correct task would do>
**Actual:** <what happens>

## Impact

<Which solutions are wrongly rejected or wrongly accepted, and what that means for training or benchmark scores.>

## Suggested fix

<Concrete change to the statement, tests, solution, or environment.>

## Agent vs. me

- **Agent:** <what the agent did and concluded>
- **Me:** <what I checked and reproduced myself>
- **Where the agent was wrong:** <wrong diagnosis or shortcut, or "nothing found">
