color a
@echo off
set a="Your_files\*.png"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)