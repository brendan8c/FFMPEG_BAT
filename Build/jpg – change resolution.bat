@echo off
setlocal EnableDelayedExpansion
color a
if not exist youtube-dl.exe goto nothere
if not exist ffmpeg.exe goto nothere
goto start
:nothere
echo You either dont have, renamed, or moved the youtube-dl, ffmpeg executable. Please leave it in the same folder as this batch file!
pause
exit
:start
cls
echo.
echo Choose which resolution to convert.
echo.
echo 1) 240p: 426 x 240
echo 2) 360p: 640 x 360
echo 3) 480p: 854 x 480
echo 4) 600p: 600 x 600
echo 5) 720p: 1280 x 720
echo 6) 960p: 1280 x 960
echo 7) 1080p: 1920 x 1080
echo.
choice /c 1234567
echo.
if errorlevel 7 goto 1080p
if errorlevel 6 goto 960p
if errorlevel 5 goto 720p
if errorlevel 4 goto 600p
if errorlevel 3 goto 480p
if errorlevel 2 goto 360p
if errorlevel 1 goto 240p

echo No idea how you even got here
pause
goto start

:240p
set a="Your_files\*.jpg"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=-s 426x240
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:360p
set a="Your_files\*.jpg"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=-s 640x360
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:480p
set a="Your_files\*.jpg"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=-s 854x480
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:600p
set a="Your_files\*.jpg"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=-s 600x600
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:720p
set a="Your_files\*.jpg"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=-s 1280x720
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:960p
set a="Your_files\*.jpg"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=-s 1280x960
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:1080p
set a="Your_files\*.jpg"
set b="Result\%%~na.jpg"
set c=ffmpeg
set f=-s 1920x1080
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit