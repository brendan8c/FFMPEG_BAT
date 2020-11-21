@echo off
color a
set a="Your_files\*.mkv"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-vcodec copy -acodec aac
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit