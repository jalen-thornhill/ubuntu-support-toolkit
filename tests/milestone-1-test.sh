#!/usr/bin/env bash

set -u
set -o pipefail

project_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

payroll="${project_root}/bin/payroll-report"
text_transform="${project_root}/bin/text-transform"

payroll_valid="${project_root}/tests/fixtures/payroll-valid.txt"
payroll_malformed="${project_root}/tests/fixtures/payroll-malformed.txt"
payroll_empty="${project_root}/tests/fixtures/payroll-empty.txt"

text_input="${project_root}/tests/fixtures/text-input.txt"
text_expected="${project_root}/tests/fixtures/text-expected.txt"

failTest() {
  echo "FAIL: $1" >&2
  exit 1
}

bash -n "$payroll" "$text_transform" ||
  failTest "invalid Bash syntax"

payroll_output=$("$payroll" --input "$payroll_valid" 2>&1)
payroll_status=$?

[[ $payroll_status -eq 0 ]] ||
  failTest "valid payroll report failed"

for expected_text in \
  "Alicia Clarke LGS 740" \
  "Marcus Green LGS 980" \
  "Thanks for the extra effort Marcus" \
  "1 LGS employees worked overtime this week" \
  "Daniel Foster ENG 7666.67" \
  "Sarah King MGR 7666.67" \
  "Average predicted salary: 7666.67"; do
  [[ $payroll_output == *"$expected_text"* ]] ||
    failTest "payroll output is missing: $expected_text"
done

"$payroll" --input "$payroll_malformed" >/dev/null 2>&1
[[ $? -eq 1 ]] ||
  failTest "malformed payroll input should return 1"

"$payroll" --input "$payroll_empty" >/dev/null 2>&1
[[ $? -eq 1 ]] ||
  failTest "empty payroll input should return 1"

actual_output=$(mktemp) ||
  failTest "could not create temporary output"

trap 'rm -f -- "$actual_output"' EXIT

"$text_transform" --input "$text_input" --output "$actual_output" ||
  failTest "text transformation failed"

diff -u "$text_expected" "$actual_output" ||
  failTest "text transformation output changed"

"$text_transform" --help >/dev/null 2>&1
[[ $? -eq 0 ]] ||
  failTest "text-transform help should return 0"

echo "PASS: all Milestone 1 tests passed"
