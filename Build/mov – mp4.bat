@REM Assign start and end times
@REM Timestamps must be in HH:MM:SS.xxx format. .xxx you can omit this (msec).
@REM -ss looks for the beginning and -to looks for the end, the exit point.
@REM *--------------------------*
@REM Назначить время начала и конца
@REM Метки времени должны быть в HH:MM:SS.xxx формате. .xxx можно опустить это (msec).
@REM -ss ищет начало, а -to ищет конец, точку выхода.

@REM color a
@REM @echo off
@REM set a="Your_files\*.mov"
@REM set b="Result\%%~na.mp4"
@REM set c=ffmpeg
@REM set f=-c:v libx264 -c:a libmp3lame -b:a 384K
@REM set ts=-ss 00:00:02
@REM set te=-to 00:00:05
@REM for %%a in (%a%) do (%c% -y %ts% -i "%%a" %te% %f% %b%)


@echo off
color a
set a="Your_files\*.mov"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-c:v libx264 -c:a libmp3lame -b:a 384K
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit