#!/bin/bash

# Check if sufficient arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_dir> <build_dir> <executable_name>"
    exit 1
fi

# Base directory for the source files
SOURCE_DIR="$1"

# Program output directory
OUTPUT_DIR="$2"

# Program executable name
EXECUTABLE_NAME="$3"

# Full path to the executable
OUTPUT="$OUTPUT_DIR/$EXECUTABLE_NAME"

# Find vcpkg installation path
VCPKG_PATH=$(which vcpkg)

# Check if vcpkg path is valid
if [ -z "$VCPKG_PATH" ] || [ ! -d "${VCPKG_PATH%/*}/installed/x64-linux/include" ]; then
    echo "Error: vcpkg not found or vcpkg installed directory is invalid."
    exit 1
fi

# Use the found vcpkg include path
INCLUDE_PATH="${VCPKG_PATH%/*}/installed/x64-linux/include"

# Function to compile and run the program with different sanitizers
run_sanitizer() {
    SANITIZER=$1
    echo "Running $SANITIZER..."
    # Compile only the main.c file or specify other files if needed
    clang -fsanitize=$SANITIZER -g -I$INCLUDE_PATH $SOURCE_DIR/main.c -o "$OUTPUT"
    "$OUTPUT"
    echo "$SANITIZER complete."
}

# Compile with AddressSanitizer
run_sanitizer address

# Compile with UndefinedBehaviorSanitizer
run_sanitizer undefined

# Compile with ThreadSanitizer
run_sanitizer thread

# Optional: Compile with MemorySanitizer
# Note: Requires all code including libraries to be instrumented
# run_sanitizer memory

echo "Sanitization complete."
