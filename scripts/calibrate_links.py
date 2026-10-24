#!/usr/bin/env python3
"""
52etf.net — External Agent Link Calibration Script for Hugo Repo
Reads public/index.json (compiled from content/<dir>/<slug>.md),
reports any Markdown file older than 180 days (>6 months) or with unreachable ext_url.
"""
import json
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
INDEX_JSON = BASE / "public" / "index.json"

def main():
    data = json.loads(INDEX_JSON.read_text(encoding="utf-8"))
    entries = data["entries"]
    stale = [e for e in entries if e["is_stale_6m"]]
    print(f"52etf.net Hugo Repo Scan: {len(entries)} total .md pages | {len(stale)} stale (>6M) pages")
    for e in stale:
        print(f"[STALE {e['age_days']}d] {e['repo_path']} -> {e['title']} | ext_url: {e['ext_url']}")

if __name__ == "__main__":
    main()
