@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.mkv"
set c=ffmpeg
set f=-vcodec copy -acodec aac
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit