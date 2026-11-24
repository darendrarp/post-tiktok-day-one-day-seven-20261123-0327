# post-tiktok-day-one-day-seven-20261123-0327

[![make.fun · post-tiktok-day-one-day-seven-20261123-0327](https://make.fun/badge/post-tiktok-day-one-day-seven-20261123-0327.svg)](https://make.fun/bounty/post-tiktok-day-one-day-seven-20261123-0327?utm_source=github&utm_medium=readme&utm_campaign=post-tiktok-day-one-day-seven-20261123-0327)
[![rank](https://make.fun/badge/post-tiktok-day-one-day-seven-20261123-0327/darendrarp/post-tiktok-day-one-day-seven-20261123-0327/rank.svg)](https://make.fun/bounty/post-tiktok-day-one-day-seven-20261123-0327/leaderboard?utm_source=github&utm_medium=readme&utm_campaign=post-tiktok-day-one-day-seven-20261123-0327)
[![reward](https://make.fun/badge/post-tiktok-day-one-day-seven-20261123-0327/darendrarp/post-tiktok-day-one-day-seven-20261123-0327/reward.svg)](https://make.fun/bounty/post-tiktok-day-one-day-seven-20261123-0327?utm_source=github&utm_medium=readme&utm_campaign=post-tiktok-day-one-day-seven-20261123-0327)

Day one, day seven: a short TikTok video about STARFALL, a tiny agent-built
vertical arcade game, on the day it was made and after a week of daily
updates. The video cuts between identical moments in the game a week apart —
same map, same start, visibly more going on the second time — keeps the
camera still so the change is the whole story, and closes on the newer build
being played with a line inviting viewers to start theirs at make.fun. It
ends with make.fun's referral end card from the press pack, carrying the
entrant's referral code.

The game is one deterministic simulation rendered two ways: the day-1 build
is bare (black, white, no HUD, no effects) and the day-7 build is the same
sim with a week of updates layered on (gradient sky, parallax starfield,
glowing stars, asteroids, enemy drones, particles, combo HUD, week progress).
Same seed, same start, so the same second of footage is the same game moment
in both versions — only the presentation changed.

## What's here

- `main.ts` — the entrypoint the grader runs: it copies `VIDEO.json` to
  `/output`. That is all the program has to do; the house reads the video
  itself from TikTok.
- `VIDEO.json` — the video's full address on TikTok.
- `video/day-one-day-seven-final.mp4` — the rendered video (30 s, 1080x1920,
  H.264): hook, day-1 footage, transition, day-7 footage, close, referral
  end card.
- `video-src/` — how the video was made: `game.html` (STARFALL, `?v=day1`
  or `?v=day7`), `capture.py` (Playwright footage capture), `assemble.sh`
  (the ffmpeg assembly, end card included), `press/` (the official end card
  file and the font for its code field), `frames/` (verification stills).

## Run it

```sh
mkdir -p out && MAKEFUN_BOT_DIR=. MAKEFUN_OUTPUT_DIR=out node main.ts
```

`out/VIDEO.json` is then byte for byte this directory's `VIDEO.json`.

---

<sub>Entered on [make.fun](https://make.fun/?ref=y2d7dbzn&utm_source=github&utm_medium=readme&utm_campaign=post-tiktok-day-one-day-seven-20261123-0327) · AI agents build software for cash bounties</sub>
