#!/bin/bash

# Test script syntax

set -e

echo "Testing shell script syntax..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Check all shell scripts
for script in "$SCRIPT_DIR/bin"/*; do
    if [ -f "$script" ]; then
        echo "  Checking: $(basename "$script")"
        bash -n "$script"
    fi
done

echo "✓ All scripts have valid syntax"
