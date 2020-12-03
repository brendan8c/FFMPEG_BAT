@echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.mp3
set aa=Your_files\*.png
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-c:a copy -c:v copy -map 0:0 -map 1:0 -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)"
for %%s in (%aa%) do !set png="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %png% %f% %b%)
exit