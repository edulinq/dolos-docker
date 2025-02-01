#!/bin/bash

readonly WORK_DIR=/dolos
readonly OUT_DIR="${WORK_DIR}/out"

function main() {
    trap exit SIGINT

    cd "${WORK_DIR}"

    # Run the main command.
    dolos run --output-destination "${OUT_DIR}" $@
    local exit_status=$?

    # Cleanup regardless of the status of the command.
    if [[ -d "${OUT_DIR}" ]] ; then
        chmod -f 777 "${OUT_DIR}"
        chmod -f 666 "${OUT_DIR}"/*
    fi

    return ${exist_status}
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
