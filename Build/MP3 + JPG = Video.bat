@REM -c:v libx264 <— use x264 to encode video.
@REM -tune stillimage <— x264 setting to optimize video for still image encoding.
@REM *--------------------------------------*
@REM -c:v libx264 <— используйте x264 для кодирования видео.
@REM -tune stillimage <— Настройка x264 для оптимизации видео для кодирования неподвижных изображений.

@echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.jpg
set x=Your_files\*.mp3
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-c:v libx264 -tune stillimage -c:a aac -b:a 192k -shortest
for %%s in (%a%) do !set a="%%s"!
for %%a in (%x%) do (%c% -y -loop 1 -i %a% -i "%%a" %f% %b%)
exit