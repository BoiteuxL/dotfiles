#!/bin/bash
LOG_SECTION='\033[34;1m'
LOG_COMMAND='\033[33;1m'
CLEAR='\033[0m' # Reset color

function log_section() {
    echo -e "${LOG_SECTION}$1${CLEAR}"
}

function log_command() {
    echo -e "${LOG_COMMAND}$1${CLEAR}"
}

file_path="$1" # Now it's $1 because find passes it as an argument
transformed_path="${file_path#./}"
final_path="${HOME}/${transformed_path}"
echo -e "${LOG_COMMAND}Copied file:${CLEAR} ${final_path}"