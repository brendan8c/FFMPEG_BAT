@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-vcodec libx264 -profile:v main -level 3.1 -preset medium -crf 23 -x264-params ref=4 -acodec copy -movflags +faststart
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
pause
exit