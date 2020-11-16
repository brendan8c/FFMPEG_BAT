color a
@echo off
set a="Your_files\*.mp4"
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-b:a 192K -vn
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)