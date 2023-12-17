#!/bin/bash

SOURCE_DIR=$1
BUILD_DIR=$2

echo "find "$SOURCE_DIR" -name '*.c' -exec clang-tidy -p "$BUILD_DIR" --fix '{}' \;"
find "$SOURCE_DIR" -name '*.c' -exec clang-tidy -p "$BUILD_DIR" --fix '{}' \;
