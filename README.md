# Ubuntu Support Toolkit

## Project's TL;DR

This repository contains six Bash shell scripts that perform basic user and file management tasks, as well as some common system administration operations.

## Intended users

The scripts should be of interest to junior Linux support technicians as they develop their systems management skills. They should also help employers evaluate the Linux skills required of entry-level employees.

## Toolkit commands

* The payroll-report command computes the wages, overtime, and bonuses that each employee is owed based upon the data in an input payroll record file, as well as a summary of wage totals.

 (e.g. tests/fixtures/sbproj.rec)
* The text-transform command carries out a limited set of sed operations on an input text file, and prints the results to standard output.

(e.g. tests/fixtures/nistan)
* The process-watch command repeatedly (for two minutes at a time) reports on process CPU and memory usage by user, emphasizing the process consuming the most memory (at the time). The program runs until stopped (with Ctrl+C).
* The user-audit command checks a user name, then reports on the user’s home directory, including disk usage, recent local activity, login information, and the 5-minute system load average.
* The safe-merge command prompts the user for the names of two files. After making backups (into an archive file .bkup/Merfilestar.Z), the lines occurring in odd-numbered positions in one file (the smaller one) are appended to the other. The smaller file is removed, as indicated on the standard output.
* The file-ip-audit command checks that a set of files listed in an input file all exist, have appropriate permissions, and are at least a certain number of days old. It determines the line number in the most recent file containing an Internet Protocol address. Then it makes the symbolic link ln2IPAd.

## Note
Each shell script has been implemented using Bash, AWK, and sed. They use:

- input data validation;
- file operations to defend against loss of critical data;
- common system administration and diagnostic operations;
- exit codes to indicate success/failure conditions; and
- readable program output.

 ## Testing
 Testing included Bash syntax checking with bash -n, as well as manual testing under normal and exceptional use cases: file permissions and age; process reporting; data recovery from backups; merging files; identifying IP addresses; and creating symbolic links.

Sample data are provided in tests/fixtures, and temporary output files from testing are ignore
