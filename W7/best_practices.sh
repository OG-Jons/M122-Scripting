#!/bin/bash
## Best Practices
## Author: Jonas Marschall
## Date: 14.07.2022
##
## This script was handed in late, because i was occupied with sickness
## It is not meant to be perfect, but to be a good example of best practices
## for bash scripting.
##

set -o errexit # Stop the script if an error occurs (i.E non-zero exit code)
set -o nounset # Stop the script if an undefined variable is used
set -o pipefail # Stop the script if a command fails in a pipe

# Set some default exit codes
FILE_NOT_FOUND=404

# Logging functions, to be used in the script and give the user feedback
# This will not work as is, because the variables are not bound
function __msg_error() {
    [[ "${ERROR}" == "1" ]] && echo -e "[ERROR]: $*"
}

function __msg_debug() {
    [[ "${DEBUG}" == "1" ]] && echo -e "[DEBUG]: $*"
}

function __msg_info() {
    [[ "${INFO}" == "1" ]] && echo -e "[INFO]: $*"
}

__msg_error "Error messages are enabled"
__msg_debug "Debugging is enabled"
__msg_info "Info messages are enabled"


function handle_exit() {
    local exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo "Script failed with exit code $exit_code"
        exit $exit_code
    fi
}

# Listen to signals and handle them with the handle_exit function and exit the script
trap handle_exit 0 SIGHUP SIGINT SIGTERM SIGQUIT SIGABRT

# Test the default exit codes set above
function read_file() {
  if "file_that_does_not_exist.txt"; then
    return "$FILE_NOT_FOUND"
  fi
}

