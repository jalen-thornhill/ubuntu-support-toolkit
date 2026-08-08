#!/usr/bin/env bash

set -u
set -o pipefail

project_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
command_path="${project_root}/bin/payroll-report"

# shellcheck source-path=SCRIPTDIR
# shellcheck source=../lib/common.sh
source "${project_root}/lib/common.sh"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

bash -n "${project_root}/lib/common.sh" "$command_path" ||
  fail "invalid Bash syntax"

help_output=$("$command_path" --help 2>&1)
help_status=$?

[[ $help_status -eq 0 ]] ||
  fail "--help should return 0"

[[ $help_output == "Usage: payroll-report --input FILE" ]] ||
  fail "--help displayed unexpected text"

missing_output=$("$command_path" 2>&1)
missing_status=$?

[[ $missing_status -eq 2 ]] ||
  fail "missing argument should return 2"

[[ $missing_output == *"error: an option is required"* ]] ||
  fail "missing-argument error was not displayed"

unknown_output=$("$command_path" --unknown 2>&1)
unknown_status=$?

[[ $unknown_status -eq 2 ]] ||
  fail "unknown option should return 2"

[[ $unknown_output == *"error: unknown option: --unknown"* ]] ||
  fail "unknown-option error was not displayed"

create_temp_dir ||
  fail "temporary directory could not be created"

created_temp_dir=$TOOLKIT_TEMP_DIR

[[ -d $created_temp_dir ]] ||
  fail "temporary directory was not created"

cleanup_temp_dir

[[ ! -e $created_temp_dir ]] ||
  fail "temporary directory was not removed"

printf 'PASS: all smoke tests passed\n'
