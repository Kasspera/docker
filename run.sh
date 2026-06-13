#!/bin/bash

COMMAND=$1
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

show_help() {
    echo "commands:"
    echo "  build_generator"
    echo "  run_generator"
    echo "  create_local_data"
    echo "  build_reporter"
    echo "  run_reporter"
    echo "  structure"
    echo "  clear_data"
    echo "  inside_generator"
    echo "  inside_reporter"
}

case $COMMAND in
    help|"")
        show_help
        ;;
    build_generator)
        docker build -t tp-generator "$ROOT_DIR/generator"
        ;;
    run_generator)
        mkdir -p "$ROOT_DIR/data"
        docker run --rm -v "$ROOT_DIR/data:/data" tp-generator
        ;;
    create_local_data)
        mkdir -p "$ROOT_DIR/local_data"
        python3 "$ROOT_DIR/generator/generate.py" "$ROOT_DIR/local_data"
        ;;
    build_reporter)
        docker build -t tp-reporter "$ROOT_DIR/reporter"
        ;;
    run_reporter)
        mkdir -p "$ROOT_DIR/data"
        docker run --rm -v "$ROOT_DIR/data:/data" tp-reporter
        ;;
    structure)
        find "$ROOT_DIR" \
            -path "$ROOT_DIR/.git" -prune -o \
            -path "$ROOT_DIR/references" -prune -o \
            -print | sort
        ;;
    clear_data)
        mkdir -p "$ROOT_DIR/data"
        rm -f "$ROOT_DIR"/data/*.csv "$ROOT_DIR"/data/*.html
        ;;
    inside_generator)
        mkdir -p "$ROOT_DIR/data"
        docker run --rm -v "$ROOT_DIR/data:/data" --entrypoint sh tp-generator -c "ls -la /data"
        ;;
    inside_reporter)
        mkdir -p "$ROOT_DIR/data"
        docker run --rm -v "$ROOT_DIR/data:/data" --entrypoint sh tp-reporter -c "ls -la /data"
        ;;
    *)
        echo "unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac
