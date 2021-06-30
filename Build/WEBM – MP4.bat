@REM Adjust the CRF value till the quality/size tradeoff is ok. Lower values produce bigger but better files.
@REM You can also try applying these filters.
@REM Отрегулируйте значение CRF до тех пор, пока не будет приемлемым компромисс между качеством и размером.
@REM Более низкие значения создают файлы большего размера, но лучшего качества.

@echo off
color a
set a="Your_files\*.webm"
set b="Result\%%~na.mp4"
set c=ffmpeg
@REM set f=-vcodec copy -acodec aac
set f=-c:v libx264 -crf 35 -b:v 0 -c:a libmp3lame -b:a 128k
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit