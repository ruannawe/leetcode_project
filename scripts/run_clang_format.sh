#!/bin/bash

SOURCE_DIR=$1
echo "find "$SOURCE_DIR" -name '*.c' -exec clang-format -i '{}' \;"
find "$SOURCE_DIR" -name '*.c' -exec clang-format -i '{}' \;
