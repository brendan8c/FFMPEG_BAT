@REM Adjust the CRF value till the quality/size tradeoff is ok. Lower values produce bigger but better files.
@REM You can also try applying these filters.
@REM Отрегулируйте значение CRF до тех пор, пока не будет приемлемым компромисс между качеством и размером.
@REM Более низкие значения создают файлы большего размера, но лучшего качества.
@REM Так-же вы можете попробовать применить эти фильтры.
@REM set f=-c:v libvpx -crf 10 -b:v 1M -c:a libvorbis
@REM set f=-c:v libvpx-vp9 -b:a 128k -b:v 1M -c:a libopus

@REM codec 
@REM https://trac.ffmpeg.org/wiki/Encode/VP9

@REM Assign start and end times
@REM Timestamps must be in HH:MM:SS.xxx format. .xxx you can omit this (msec).
@REM -ss looks for the beginning and -to looks for the end, the exit point.
@REM Назначить время начала и конца
@REM Метки времени должны быть в HH:MM:SS.xxx формате. .xxx можно опустить это (msec).
@REM -ss ищет начало, а -to ищет конец, точку выхода.

@REM color a
@REM @echo off
@REM set a="Your_files\*.mp4"
@REM set b="Result\%%~na.webm"
@REM set c=ffmpeg
@REM set f=-c:v libvpx-vp9 -crf 10 -b:v 0 -b:a 128k -c:a libopus
@REM set ts=-ss 00:00:02
@REM set te=-to 00:00:05
@REM for %%a in (%a%) do (%c% -y %ts% -i "%%a" %te% %f% %b%)

@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.webm"
set c=ffmpeg
set f=-c:v libvpx-vp9 -crf 10 -b:v 0 -b:a 128k -c:a libopus
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit