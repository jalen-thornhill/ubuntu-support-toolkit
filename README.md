# Ubuntu Support Toolkit

## Project purpose

This repository contains six Bash shell scripts that perform basic user and file management tasks, as well as some common system administration operations.

## Intended users

The scripts should be of interest to junior Linux support technicians as they develop their systems management skills. They should also help employers evaluate the Linux skills required of entry-level employees.

## Toolkit commands

* The payroll-report command computes the wages, overtime, and bonuses that each employee is owed based upon the data in an input payroll record file (e.g. tests/fixtures/sbproj.rec), as well as a summary of wage totals.
* The text-transform command carries out a limited set of sed operations on an input text file (e.g. tests/fixtures/nistan), and prints the results to standard output.
* The process-watch command repeatedly (for two minutes at a time) reports on process CPU and memory usage by user, emphasizing the process consuming the most memory (at the time). The program runs until stopped (with Ctrl+C).
* The user-audit command checks a user name, then reports on the user’s home directory, including disk usage, recent local activity, login information, and the 5-minute system load average.
* The safe-merge command prompts the user for the names of two files. After making backups (into an archive file .bkup/Merfilestar.Z), the lines occurring in odd-numbered positions in one file (the smaller one) are appended to the other. The smaller file is removed, as indicated on the standard output.
* The file-ip-audit command checks that a set of files listed in an input file all exist, have appropriate permissions, and are at least a certain number of days old. It determines the line number in the most recent file containing an Internet Protocol address. Then it makes the symbolic link ln2IPAd.

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

