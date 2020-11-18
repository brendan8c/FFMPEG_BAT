@REM File size will be smaller if using AAC.
@REM Размер файла будет меньше, если использовать AAC.
@REM set f=-vcodec libx264 -acodec aac -threads 1

@echo off
color a
set a="Your_files\*.avi"
set b="Result\%%~na.mkv"
set c=ffmpeg
set f=-vcodec libx264 -acodec copy -threads 1
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit