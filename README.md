# Scanner-Cleaner

macOS launchd automation for the **proxy-inspector** network scanner.

This package turns the one-off `scanner.py --scan` command into a background job that runs every 5 minutes, completely independent of the FastAPI server. Results are written to the same Postgres database the rest of the project uses.

---

## What this does

| Feature | Details |
|---------|---------|
| Background scanning | Runs `scanner.py --scan --quiet` on a schedule |
| Independent of API | Continues running even if the FastAPI backend is stopped |
| Survives reboots | Uses macOS launchd (user-level LaunchAgent) |
| Logging | stdout → `logs/scanner.out.log`<br>stderr → `logs/scanner.err.log` |
| Database | Writes directly to the same Postgres tables used by manual scans |

---

## Requirements

- macOS
- Python 3 with the same environment/dependencies that `scanner.py` already uses
- proxy-inspector project located at `~/Downloads/proxy-inspector`  
  (or update the path inside the `.plist`)
- Postgres running and reachable (same DB the scanner already uses)

---

## Install

```bash
chmod +x scripts/install.sh scripts/uninstall.sh
./scripts/install.sh
