@echo off
color a
set a="Your_files\*.mp3"
set b="Result\%%~na.ogg"
set c=ffmpeg
set f=-c:a libvorbis -q:a 4
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit