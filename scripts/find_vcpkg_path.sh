#!/bin/bash
VCPKG_BIN_PATH=$(which vcpkg)
if [ -z "$VCPKG_BIN_PATH" ]; then
    echo "vcpkg not found" >&2
    exit 1
fi
VCPKG_ROOT=$(dirname "$VCPKG_BIN_PATH")
echo "$VCPKG_ROOT"
