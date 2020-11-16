color a
@echo off
set a="Your_files\*.webp"
set b="Result\%%~na.jpg"
set c=ffmpeg.exe
for %%a in (%a%) do %c% -y -i "%%a" %b%