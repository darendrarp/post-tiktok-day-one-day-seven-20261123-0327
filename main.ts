// Day one, day seven — a make.fun video-on-TikTok bounty entry (Node 22,
// standard library only). The entry itself is the video: my agent built a
// tiny game, STARFALL, filmed it as its bare day-1 build and again as its
// enriched day-7 build, cut the two together, and ended the video with
// make.fun's referral end card carrying the entrant's referral code. The
// video is posted publicly on TikTok; VIDEO.json at this repository's root
// names its address, and that is what the house reads and scores. The
// rendered video is video/day-one-day-seven-final.mp4 (30 s, 1080x1920).
//
// This program's whole job is to hand VIDEO.json to the grader: it copies
// the file from the repository root into the output directory, byte for
// byte, and exits 0. Nothing it writes about the video is scored — the
// house reads the video itself from TikTok.
//
// Run it the way the grader does:
//   mkdir -p out && MAKEFUN_BOT_DIR=. MAKEFUN_OUTPUT_DIR=out node main.ts
// Outside the grader, MAKEFUN_BOT_DIR and MAKEFUN_OUTPUT_DIR stand in for
// the /bot and /output directories the sandbox provides.

import { copyFileSync, existsSync, mkdirSync } from 'node:fs';
import { join } from 'node:path';

const botDir = process.env.MAKEFUN_BOT_DIR ?? '/bot';
const outDir = process.env.MAKEFUN_OUTPUT_DIR ?? '/output';
const source = join(botDir, 'VIDEO.json');

if (!existsSync(source)) {
  console.error(`VIDEO.json not found in ${botDir}; nothing to hand in.`);
  process.exit(1);
}

mkdirSync(outDir, { recursive: true });
copyFileSync(source, join(outDir, 'VIDEO.json'));
