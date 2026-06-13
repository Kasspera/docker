#!/bin/bash

COMMAND=$1

show_help() {
    echo "commands:"
    echo "  help"
}

case $COMMAND in
    help|"")
        show_help
        ;;
    *)
        echo "unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac
