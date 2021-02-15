@echo off
color a
set a="Your_files\*.flac"
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-map 0:a -ar 44100 -ac 2 -c:a mp3 -b:a 192K -map_metadata 0
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit