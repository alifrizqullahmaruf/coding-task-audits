# Method

## Workflow per task

1. **Read without the agent.** Read the problem statement and the tests myself, and write down any mismatches I notice in `notes.md`.
2. **Build the environment.** Build the Docker image and run the tests against the reference solution. They must pass. If they do not, that is already a finding.
3. **Run the agent.** Run the coding agent on the task. Save its log and code changes in `logs/`.
4. **Analyse the result.** Did it fail because of the agent or because of the task? If it passed, did it pass legitimately or through a shortcut (reading tests, editing tests, hard-coding outputs)?
5. **Map assertions to the spec.** Ask the agent to match each test assertion to a sentence in the problem statement, then check that mapping myself.
6. **Reproduce in a clean container.** Confirm each finding from scratch with `repro.sh`.
7. **Write the report** using [reports/TEMPLATE.md](reports/TEMPLATE.md).

## Evidence rules

1. **One claim, one piece of evidence.** Every claim cites the problem statement, a test, or a log line.
2. **Reproduce before reporting.** A task is not called defective until I have reproduced the issue myself in a clean container.
3. **Fixed taxonomy.** Defects are classified with the categories below, nothing else.
4. **Real defects vs. minor complaints.** If a problem is debatable or would not change which solutions pass, the verdict is Uncertain with an explanation, not Defective.
5. **Honest process.** Mistakes in judgement, mine or the agent's, stay in the report.
6. **Sources and licenses** are recorded for every task.

## Verdicts

| Verdict | Meaning |
|---|---|
| Valid | Instructions, tests, reference solution, and environment are consistent. A correct solution passes and an incorrect one fails. |
| Defective | At least one defect from the taxonomy, reproduced in a clean container. |
| Uncertain | A possible issue that is not clearly a defect. The report explains why. |

## Defect taxonomy

| Type | Description |
|---|---|
| Instruction underspecified | The problem statement does not contain enough information to infer the behaviour the tests check. A reasonable solution that follows the statement can fail. |
| Test overspecified | Tests require details the statement does not ask for (an exact message, a specific function name, one particular implementation), so valid solutions are rejected. |
| Test underspecified | Tests are too weak: an incorrect or incomplete solution still passes. |
| Oracle bug | The reference solution or the expected values in the tests are wrong. |
| Information leakage | The answer is reachable from inside the task: visible tests or solution, git history containing the fix, hints in the environment. |
| Environment issue | The build or runtime fails regardless of the solution: missing or unpinned dependencies, network access, version conflicts, flaky tests. |

## Roles: agent vs. me

| Step | Agent | Me |
|---|---|---|
| First reading | Not used | Read statement and tests, note mismatches |
| Solving the task | Attempts the task, produces a log | Reviews the log for shortcuts |
| Assertion-to-spec mapping | Proposes the mapping | Checks each line of it |
| Reproduction | May draft `repro.sh` | Runs it in a clean container and confirms the result |
| Verdict and report | May draft text | Decides the verdict, writes the final claims |
