@REM Link URL info —> https://trac.ffmpeg.org/wiki/Encode/AAC

@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-vcodec libx264 -crf 23 -x264-params ref=4 -c:a aac -b:a 192k -movflags +faststart
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit
