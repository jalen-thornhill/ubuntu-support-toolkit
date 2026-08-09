# Architecture

## Project structure

- `bin/` will contain the six user-facing Bash commands.
- `lib/common.sh` will contain shared CLI, dependency-checking, error-reporting, and cleanup helpers.
- `tests/fixtures/` will contain controlled test input.
- `docs/support-cases/` will contain short support scenarios and outcomes.
- `.github/workflows/` will contain automated repository checks.

## Shared CLI contract

Each command will:

- support `--help`;
- quote user-supplied arguments;
- write normal results to standard output;
- write warnings and errors to standard error;
- return a documented exit status;
- check required dependencies before starting;
- clean up temporary files on normal exit and supported signals.

## Exit-status contract

- `0`: successful execution.
- `2`: general command-line usage error.
- `3`: missing username argument for `user-audit`.
- `4`: unauthorized username for `user-audit`.
- `5`: invalid input filename for `file-audit`.

The exact assignment-derived statuses `3`, `4`, and `5` will be preserved in the matching portfolio commands.

## Open design decision

The source requirement for the backup-and-merge problem refers to both `bkup` and `bkups` and also describes the directory as hidden. The portfolio behavior must be chosen and documented before `safe-merge` is implemented.

## Milestone 1 decisions

### Payroll data contract

- Every payroll record contains exactly five whitespace-separated fields: first name, surname, job code, hourly rate, and hours worked.
- Valid job codes are `LGS`, `ENG`, and `MGR`.
- Hourly rates and hours worked must be non-negative numbers.
- The complete input file is validated before any totals are calculated or printed.
- Malformed records are reported with their source line numbers and stop report generation.
- Monetary values are displayed with exactly two decimal places.
- LGS regular wages cover up to 40 hours; additional hours are paid at 1.5 times the hourly rate.
- The engineer bonus is not applied because the supplied record format does not contain years of service. The program will not guess eligibility.

### Text transformation contract

- Source-problem line numbers refer to the original input before a title is inserted.
- The input must contain at least four lines.
- A four-digit year must be extractable from original line 1.
- Original line 3 is placed before original line 2.
- A blank line is inserted after transformed output from original line 4.
- Replacement of the standalone word `modern` with `present-day` is case-sensitive.
- Without `--output`, the transformed document is written to standard output.
- With `--output FILE`, the transformed document is written to that file and the complete preview is not duplicated on standard output.
- The same input and arguments must produce the same output on every run.
