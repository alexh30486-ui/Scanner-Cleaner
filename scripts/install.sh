#!/usr/bin/env bash
set -euo pipefail

PLIST_NAME="com.alexh.proxyinspector.scanner.plist"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$HOME/Library/LaunchAgents/$PLIST_NAME"

mkdir -p "/Users/alexhernandezm/Downloads/proxy-inspector/logs"
cp "$SRC_DIR/$PLIST_NAME" "$DEST"

launchctl bootout "gui/$(id -u)/com.alexh.proxyinspector.scanner" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$DEST"
launchctl enable "gui/$(id -u)/com.alexh.proxyinspector.scanner"

echo "Installed. Check status:  launchctl list | grep proxyinspector"
echo "Logs: ~/Downloads/proxy-inspector/logs/scanner.out.log"
