
@REM mp4 – mp3 
@echo off
setlocal EnableDelayedExpansion
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.mp3"
set c=ffmpeg
@REM set f=-map 0:a -ar 44100 -ac 2 -c:a mp3 -b:a 192K -map_metadata 0
set f=-map 0:a -ar 44100 -c:a libmp3lame -qscale:a 1 -map_metadata 0
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)

@REM mp3 + png = Video
set a=Your_files\*.png
set x=Result\*.mp3
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest
for %%s in (%a%) do !set a="%%s"!
for %%a in (%x%) do (%c% -y -loop 1 -i %a% -i "%%a" %f% %b%)
cd /d Result
del /f /q *.mp3
exit