# Ubuntu Support Toolkit

A Bash-based Linux support toolkit demonstrating practical automation, diagnostics, validation, and safe file handling on Ubuntu.

## Project purpose

This project provides six small command-line tools that apply UNIX problem-solving skills to payroll reporting, text transformation, process monitoring, user auditing, safe file merging, and file-security checks.

## Intended users

The toolkit is designed for junior Linux support technicians, students developing UNIX skills, and employers reviewing entry-level systems-support work.

## Toolkit commands

### `payroll-report`

Calculates employee pay, overtime, bonuses, and payroll summaries from a records file.

```bash
bin/payroll-report tests/fixtures/sbproj.rec
```

### `text-transform`

Performs controlled text transformations using `sed` and writes the result to standard output.

```bash
bin/text-transform tests/fixtures/nistan
```

### `process-watch`

Reports CPU and memory statistics for the current user's processes and identifies the process using the most memory. It runs continuously in approximately two-minute monitoring cycles; press `Ctrl+C` to stop it.

```bash
bin/process-watch
```

### `user-audit`

Validates a local username and reports home-directory usage, local-user activity, login information, and the system's five-minute load average.

```bash
bin/user-audit "$USER"
```

### `safe-merge`

Validates and backs up two files, appends the odd-numbered lines of the smaller file to the larger file, and removes the smaller file. Run it from the directory containing the files to merge.

```bash
cd /path/to/files
/path/to/ubuntu-support-toolkit/bin/safe-merge
```

The command interactively requests both filenames. Before modifying either file, it stores both originals in `.bkup/Merfilestar.Z`.

### `file-ip-audit`

Checks files named in a list for existence, permissions, and age. It also extracts an IP address and line number from a recent file and creates the `ln2IPAd` symbolic link.

Run it from the directory containing the listed files:

```bash
cd /path/to/files
/path/to/ubuntu-support-toolkit/bin/file-ip-audit files.txt
```

## Scope

This portfolio implementation uses Bash, with AWK and `sed` where appropriate. It focuses on input validation, meaningful exit statuses, safe file handling, system diagnostics, and clear command-line output for an Ubuntu environment.

## Testing and verification

Each command was checked with `bash -n` where applicable and manually tested on Ubuntu using representative success and failure cases. Verification included exit-status checks, valid and invalid inputs, file-permission and age scenarios, process and user reporting, backup recovery, file merging, IP extraction, and symbolic-link creation.

Reusable sample inputs are stored under `tests/fixtures`, while temporary test data and generated files remain outside version control.

## Exclusions

This repository is not the original COMP1215 coursework submission. It does not reproduce the assessed C shell solution or claim that the Bash implementation satisfies the original submission format.

## Assignment attribution

The project is inspired by six problems from a COMP1215 UNIX assignment. The original coursework requires C shell syntax; this separate portfolio project applies the same underlying business rules using Bash, AWK, and `sed`.

## License

This project is available under the terms in [LICENSE](LICENSE).
