#!/usr/bin/env bash

error() {
  printf 'error: %s\n' "$*" >&2
}

require_command() {

  local command_name=$1

  if ! command -v "$command_name" >/dev/null 2>&1; then
    error "This ccommand can't be found buddy :/"
    return 1
  fi

}

TOOLKIT_TEMP_DIR=""

create_temp_dir() {
  TOOLKIT_TEMP_DIR=$(mktemp -d) || {
    error "could not create temporary directory"
    return 1
  }

  trap cleanup_temp_dir EXIT
}

cleanup_temp_dir() {
  if [[ -n ${TOOLKIT_TEMP_DIR:-} && -d $TOOLKIT_TEMP_DIR ]]; then
    rm -rf -- "$TOOLKIT_TEMP_DIR"
    TOOLKIT_TEMP_DIR=""
  fi
}
