@REM Adjust the CRF value till the quality/size tradeoff is ok. Lower values produce bigger but better files.
@REM You can also try applying these filters.
@REM Отрегулируйте значение CRF до тех пор, пока не будет приемлемым компромисс между качеством и размером.
@REM Более низкие значения создают файлы большего размера, но лучшего качества.

@REM Для корректного воспроизведения видео mp4 нужно использовать формат звука -c:a aac
@REM Если использовать -c:a libmp3lame не на всех устройствах видео будет работать!

@echo off
color a
set a="Your_files\*.mkv"
set b="Result\%%~na.mp4"
set c=ffmpeg
@REM set f=-vcodec libx264 copy -acodec aac
set f=-c:v libx264 -crf 1 -b:v 0 -c:a aac -b:a 320k -movflags +faststart
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit