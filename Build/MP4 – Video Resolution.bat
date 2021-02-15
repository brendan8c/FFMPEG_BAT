@REM Link URL info —> https://trac.ffmpeg.org/wiki/Scaling

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
echo Choose which resolution to convert the video.
echo.
echo 1) 240p: 426 x 240
echo 2) 360p: 640 x 360
echo 3) 480p: 854 x 480
echo 4) 600p: 600 x 600
echo 5) 720p: 1280 x 720
echo 6) 1080p: 1920 x 1080
echo 7) 1440p: 2560 x 1440
echo 8) 2160p: 3840 x 2160
echo.
choice /c 12345678
echo.
if errorlevel 8 goto 2160p
if errorlevel 7 goto 1440p
if errorlevel 6 goto 1080p
if errorlevel 5 goto 720p
if errorlevel 4 goto 600p
if errorlevel 3 goto 480p
if errorlevel 2 goto 360p
if errorlevel 1 goto 240p

echo No idea how you even got here
pause
goto start

:240p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-s 426x240 -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:360p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-s 640x360 -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:480p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-s 854x480 -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:600p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-vf scale=600:600,setsar=1:1 -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:720p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-s 1280x720 -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:1080p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-s 1920x1080 -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:1440p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-s 2560x1440  -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit
:2160p
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-s 3840x2160  -c:v libx264 -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit