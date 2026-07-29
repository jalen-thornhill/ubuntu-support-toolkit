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
