#!/usr/bin/env bash
set -euo pipefail
launchctl bootout "gui/$(id -u)/com.alexh.proxyinspector.scanner" 2>/dev/null || true
rm -f "$HOME/Library/LaunchAgents/com.alexh.proxyinspector.scanner.plist"
echo "Uninstalled."
