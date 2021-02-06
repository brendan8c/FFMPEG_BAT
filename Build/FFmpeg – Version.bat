@REM @echo off
@REM color a
@REM @REM ffmpeg -h
@REM ffmpeg -i
@REM @REM ffmpeg -version
@REM echo.
@REM pause
@REM exit

@echo off
color a
set b="Result\%%~na-information.txt"
set c=ffmpeg
set f=-i
for %%a in (%c%) do ("%%a" %f% 2> %b% & type %b%)
pause
exit