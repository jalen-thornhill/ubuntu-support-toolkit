# Text transformation support case

## Scenario

A support technician needs to transform a controlled text document consistently.

## Action

Preview with:

`text-transform --input FILE`

Save with:

`text-transform --input FILE --output FILE`

## Result

The command adds a title, extracts the year, reorders lines, inserts a blank line, and replaces `modern` with `present-day`.

## Limitation

The input must contain at least four lines and a four-digit year on line 1. The word replacement is case-sensitive.

