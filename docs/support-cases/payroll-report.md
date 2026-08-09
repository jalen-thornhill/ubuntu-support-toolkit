# Payroll report support case

## Scenario

A payroll assistant needs a weekly report for LGS, ENG, and MGR employees.

## Action

Run:

`payroll-report --input FILE`

The command validates the file before calculating wages.

## Result

The report displays LGS weekly wages, overtime messages, the overtime count, ENG/MGR monthly salaries, and their average salary.

## Limitation

The engineer bonus is excluded because the input records do not contain years of service.
