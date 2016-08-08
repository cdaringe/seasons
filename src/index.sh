#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
export DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)"

. $DIR/app.sh
. $DIR/cli.sh
. $DIR/init-detection.sh

detect-init
