#!/bin/bash

# Program source file
SOURCE="main.c"
# Program output name
OUTPUT="./bin/Debug/LeetcodeApp"

# Use environment variable for vcpkg include path
INCLUDE_PATH="$VCPKG_ROOT/installed/x64-linux/include"

# Compile with AddressSanitizer
echo "Running AddressSanitizer..."
clang -fsanitize=address -g -I$INCLUDE_PATH $SOURCE -o $OUTPUT
./$OUTPUT

# Compile with UndefinedBehaviorSanitizer
echo "Running UndefinedBehaviorSanitizer..."
clang -fsanitize=undefined -g -I$INCLUDE_PATH $SOURCE -o $OUTPUT
./$OUTPUT

# Compile with ThreadSanitizer
echo "Running ThreadSanitizer..."
clang -fsanitize=thread -g -I$INCLUDE_PATH $SOURCE -o $OUTPUT
./$OUTPUT

Optional: Compile with MemorySanitizer
echo "Running MemorySanitizer..."
clang -fsanitize=memory -g -I$INCLUDE_PATH $SOURCE -o $OUTPUT
./$OUTPUT

echo "Sanitization complete."
