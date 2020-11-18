@echo off
color a
set a="Your_files\*.jpg"
set b="Result\%%~na.png"
set c=ffmpeg
set f=
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit