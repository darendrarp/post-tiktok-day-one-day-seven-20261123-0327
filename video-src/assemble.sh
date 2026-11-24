#!/bin/bash
# Rakit video final "Day one, day seven" (TikTok 9:16) dari footage STARFALL.
#
# Timeline final (30.0 dtk, 1080x1920, 25 fps, tanpa audio):
#   A  0.0- 3.0  hook di atas footage day-1  (src day1 2.0-5.0)
#   B  3.0-12.0  DAY 1, first build         (src day1 5.0-14.0)
#   C 12.0-13.5  kartu transisi hitam       ("7 days of daily updates later...")
#   D 13.5-24.0  DAY 7, same game/moments   (src day7 5.0-15.5; 9 dtk pertamanya
#                = jendela sim yang SAMA dengan B: momen identik, lebih ramai)
#   E 24.0-27.5  close di atas footage day-7 (src day7 2.0-5.5)
#   F 27.5-30.0  end card referral make.fun di atas footage day-7 yang di-blur
#                + desaturasi (src day7 11.5-14.0), code y2d7dbzn diketik di field
#                mulai t=28.567 (card t=1.067, field rest; rest_s 1.433).
#
# End card: press pack resmi make.fun, referral-card/9x16, sha256 terverifikasi
#   286b76c671fa3bf3b1580a7c71675d7b7e502f4fb374b56d30f1104044808cd1 (768.936 byte).
#   Dipakai APA ADANYA sebagai overlay transparan, sesuai panduan manifest.
#   Code box 9:16: x=210 y=1232, JetBrains Mono Bold 62px, tinta #191419;
#   kursor ditutup kotak putih x=208 y=1230 w=9 h=82 selama code tampil.
# Referral code akun darendra (GET /api/agents/me -> referrals.code): y2d7dbzn
# Play code (untuk CAPTION TikTok, bukan video): makefun-wolf-firework-sandbar
set -euo pipefail
REPO=~/workspace/makefun/post-tiktok-day-one-day-seven-20261123-0327
SRC=$REPO/video-src
PRESS=$SRC/press
FONT=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf
MONO=$PRESS/JetBrainsMono-Bold.ttf

ffmpeg -v error -y \
  -i "$SRC/day1.webm" \
  -i "$SRC/day7.webm" \
  -i "$PRESS/makefun-card-9x16-transparent.webm" \
  -f lavfi -i "color=c=black:s=1080x1920:r=25:d=1.5" \
  -filter_complex "\
[0:v]trim=start=2.0:end=5.0,setpts=PTS-STARTPTS,fps=25[a]; \
[0:v]trim=start=5.0:end=14.0,setpts=PTS-STARTPTS,fps=25[b]; \
[3:v]setpts=PTS-STARTPTS,fade=t=in:st=0:d=0.3,fade=t=out:st=1.2:d=0.3[c]; \
[1:v]trim=start=5.0:end=15.5,setpts=PTS-STARTPTS,fps=25[d]; \
[1:v]trim=start=2.0:end=5.5,setpts=PTS-STARTPTS,fps=25[e]; \
[1:v]trim=start=11.5:end=14.0,setpts=PTS-STARTPTS,fps=25,gblur=sigma=28,eq=saturation=0[f]; \
[a][b][c][d][e][f]concat=n=6:v=1:a=0[base]; \
[2:v]setpts=PTS+27.5/TB[card]; \
[base][card]overlay=0:0:eof_action=pass[ov]; \
[ov]drawtext=fontfile=$FONT:text='My AI agent built a game.':fontsize=58:fontcolor=white:borderw=2:bordercolor=black@0.8:x=(w-text_w)/2:y=700:enable='between(t,0.3,1.6)'[t1]; \
[t1]drawtext=fontfile=$FONT:text='Then it updated it':fontsize=58:fontcolor=white:borderw=2:bordercolor=black@0.8:x=(w-text_w)/2:y=680:enable='between(t,1.7,3.0)'[t2]; \
[t2]drawtext=fontfile=$FONT:text='every day for a week.':fontsize=58:fontcolor=white:borderw=2:bordercolor=black@0.8:x=(w-text_w)/2:y=760:enable='between(t,1.7,3.0)'[t3]; \
[t3]drawtext=fontfile=$FONT:text='DAY 1':fontsize=76:fontcolor=0xffd640:borderw=2:bordercolor=black@0.8:x=48:y=60:enable='between(t,3.0,12.0)'[t4]; \
[t4]drawtext=fontfile=$FONT:text='first build':fontsize=48:fontcolor=white:borderw=2:bordercolor=black@0.8:x=52:y=150:enable='between(t,3.0,12.0)'[t5]; \
[t5]drawtext=fontfile=$FONT:text='same map - same start':fontsize=40:fontcolor=0xdddddd:borderw=2:bordercolor=black@0.8:x=(w-text_w)/2:y=1800:enable='between(t,3.0,12.0)'[t6]; \
[t6]drawtext=fontfile=$FONT:text='7 days of daily':fontsize=60:fontcolor=white:x=(w-text_w)/2:y=900:enable='between(t,12.15,13.35)'[t7]; \
[t7]drawtext=fontfile=$FONT:text='updates later...':fontsize=60:fontcolor=white:x=(w-text_w)/2:y=980:enable='between(t,12.15,13.35)'[t8]; \
[t8]drawtext=fontfile=$FONT:text='DAY 7':fontsize=76:fontcolor=0x00e5ff:borderw=2:bordercolor=black@0.8:x=(w-text_w)/2:y=48:enable='between(t,13.5,24.0)'[t9]; \
[t9]drawtext=fontfile=$FONT:text='same game, same map':fontsize=40:fontcolor=white:borderw=2:bordercolor=black@0.8:x=(w-text_w)/2:y=180:enable='between(t,13.5,24.0)'[t10]; \
[t10]drawtext=fontfile=$FONT:text='enemies - combos - particles - HUD':fontsize=38:fontcolor=0xdddddd:borderw=2:bordercolor=black@0.8:x=(w-text_w)/2:y=1800:enable='between(t,13.5,24.0)'[t11]; \
[t11]drawtext=fontfile=$FONT:text='Your agent could build this too.':fontsize=56:fontcolor=white:borderw=2:bordercolor=black@0.8:box=1:boxcolor=black@0.45:boxborderw=24:x=(w-text_w)/2:y=780:enable='between(t,24.0,27.5)'[t12]; \
[t12]drawtext=fontfile=$FONT:text='Start yours at make.fun':fontsize=56:fontcolor=0xffd640:borderw=2:bordercolor=black@0.8:box=1:boxcolor=black@0.45:boxborderw=24:x=(w-text_w)/2:y=860:enable='between(t,24.0,27.5)'[t13]; \
[t13]drawbox=x=208:y=1230:w=9:h=82:color=white:t=fill:enable='gte(t,28.567)'[cov]; \
[cov]drawtext=fontfile=$MONO:text='y2d7dbzn':fontsize=62:fontcolor=0x191419:x=210:y=1232:enable='gte(t,28.567)'[out]" \
  -map "[out]" -c:v libx264 -pix_fmt yuv420p -r 25 -crf 18 -preset medium \
  -movflags +faststart \
  "$REPO/video/day-one-day-seven-final.mp4"
echo DONE
ffprobe -v error -show_entries format=duration,size -show_entries stream=codec_name,width,height,r_frame_rate -of default=noprint_wrappers=1 "$REPO/video/day-one-day-seven-final.mp4"
sha256sum "$REPO/video/day-one-day-seven-final.mp4"
