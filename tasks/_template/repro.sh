#!/usr/bin/env bash
# Reproduces the finding for task XX in a clean container.
# Usage: bash repro.sh
set -euo pipefail

cd "$(dirname "$0")"
IMAGE="mini-task-audit-task-xx"

docker build -t "$IMAGE" .
# Replace with the command that shows the defect.
docker run --rm "$IMAGE" echo "TODO: command that shows the defect"
