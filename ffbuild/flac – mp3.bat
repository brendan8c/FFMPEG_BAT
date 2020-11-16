color a
@echo off
set a="Your_files\*.flac"
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-b:a 320k -map_metadata 0 -id3v2_version 3
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)