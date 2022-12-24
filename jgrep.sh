#!/bin/bash

VERSION="1.0.0"

_help () {
    echo ""
    echo "Joplin CLI Grep"
    echo ""
    echo "  Grep for all those pesky joplin files"
    echo ""
    echo "  Usage: jgrep COMMAND GREP_STRING" 
    echo ""
    echo "COMMAND"
    echo "  help    : Display this help menu"
    echo "  ls      : list the note/todo matching the grep string"
    echo "  edit    : Edit the note/todo matching the grep string"
    echo "  done    : Mark a todo done matching the grep string"
    echo "  undone  : Mark a todo undon matching the grep string"
    echo "  rmnote  : TODO "
    echo "  use     : TODO "
    echo "  version : Display the current version"
}

_version () {
    echo "jgrep: $VERSION"
    echo "joplin:"
    echo "$(joplin version)"
}

_ls () {
    joplin ls -l | grep "$1"
}

_edit () {
    # TODO : add "select from" menu of multiple match, or fail if none match
    joplin edit "$(joplin ls -l | grep "$1" | awk '{print $1}')"
}

_done () {
    # TODO : add "select from" menu of multiple match, or fail if none match
    joplin edit "$(joplin ls -l | grep "$1" | awk '{print $1}')"
}

_undone () {
    # TODO : add "select from" menu of multiple match, or fail if none match
    joplin edit "$(joplin ls -l | grep "$1" | awk '{print $1}')"
}

if [ "$#" -eq 0 ]; then
    echo "Missing argument COMMAND" >&2
    _help
    exit 1
fi

# Parse the COMMAND
case "$1" in
    ls)
        _ls "$1"
        ;;
    edit)
        _edit "$2"
        ;;
    done)
        _done "$2"
        ;;
    undone)
        _undone "$2"
        ;;
    version)
        _version
        exit 0
        ;;
    -h|--help|help)
        _help
        exit 0
        ;;
    *)
        echo "Unknown COMMAND '$1'" >&2
        _help
        exit 1
        ;;
esac
