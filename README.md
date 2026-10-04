# proxy-inspector scanner launchd automation

Runs `scanner.py --scan --quiet` every 5 minutes via macOS launchd, independent of the FastAPI server.

## Install
```bash
chmod +x scripts/install.sh scripts/uninstall.sh
./scripts/install.sh
```

## Verify
```bash
launchctl list | grep proxyinspector
tail -f ~/Downloads/proxy-inspector/logs/scanner.out.log
```

## Uninstall
```bash
./scripts/uninstall.sh
```

## Notes
- Edit `StartInterval` (seconds) in the .plist to change frequency.
- Update the hardcoded path in the .plist if proxy-inspector isn't at `~/Downloads/proxy-inspector`.
- Writes results to Postgres the same way the manual `--scan` run does — no code change to scanner.py needed.
