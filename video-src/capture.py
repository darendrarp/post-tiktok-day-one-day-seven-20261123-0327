#!/usr/bin/env python3
"""Capture STARFALL gameplay footage for the Day one, day seven TikTok video.

Records the same deterministic game twice — the bare day-1 build and the
enriched day-7 build — with Playwright's video recording in headless
Chromium. Same seed, same start: second N of one clip is the same game
moment as second N of the other.

Run from the repo root with the task venv:
  ~/workspace/makefun/tt-day1-venv/bin/python video-src/capture.py
Output: video-src/day1.webm (14 s), video-src/day7.webm (16 s), both
1080x1920; plus one still frame per version for a visual check.
"""
import pathlib
import shutil

from playwright.sync_api import sync_playwright

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "video-src"


def record(version, seconds, out_name):
    url = f"file://{OUT / 'game.html'}?v={version}"
    with sync_playwright() as p:
        browser = p.chromium.launch(args=["--force-device-scale-factor=1"])
        ctx = browser.new_context(
            viewport={"width": 1080, "height": 1920},
            device_scale_factor=1,
            record_video_dir=str(OUT),
            record_video_size={"width": 1080, "height": 1920},
        )
        page = ctx.new_page()
        page.goto(url)
        page.wait_for_function("window.__ready === true")
        page.wait_for_timeout(2000)
        sim = page.evaluate("({t: window.__sim.t, score: window.__sim.score})")
        print(version, "sim after 2s:", sim)
        assert sim["t"] > 1.0, "sim is not advancing"
        page.screenshot(path=str(OUT / f"frame-{version}.png"))
        page.wait_for_timeout((seconds - 2) * 1000)
        sim = page.evaluate("({t: window.__sim.t, score: window.__sim.score, combo: window.__sim.combo})")
        print(version, "sim at end:", sim)
        video = page.video
        ctx.close()
        browser.close()
        src = pathlib.Path(video.path())
        dst = OUT / out_name
        if dst.exists():
            dst.unlink()
        shutil.move(str(src), str(dst))
        print("wrote", dst, dst.stat().st_size, "bytes")


if __name__ == "__main__":
    record("day1", 14, "day1.webm")
    record("day7", 16, "day7.webm")
