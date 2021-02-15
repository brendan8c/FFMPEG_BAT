@echo off
color a
set a="Your_files\*.png"
set b="Result\%%~na.webp"
set c=ffmpeg.exe
for %%a in (%a%) do (%c% -y -i "%%a" %b%)
exit