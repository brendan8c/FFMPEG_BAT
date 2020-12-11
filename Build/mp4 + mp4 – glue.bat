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
echo Your video files with sound or no sound?
echo.
echo 1) With sound
echo 2) No Sound
echo 3) One with sound, the other no sound.

echo.
choice /c 123
echo.

if errorlevel 3 goto Other
if errorlevel 2 goto NoSound
if errorlevel 1 goto WithSound

echo No idea how you even got here
pause
goto start

:WithSound
@REM Copies all video files from the Your_files folder to the Result folder and renames them.
@REM Скопирует из папки Your_files все видео файлы в папку Result и переименует их.
setlocal EnableDelayedExpansion
set a="Your_files\*.mp4"
set b="Result\*"
xcopy "%a%" "%b%" /h /k /q /r /c /y
cd /d Result
set "count=1000"
set a="*.mp4"
for /f "usebackq delims=*" %%f in (`dir /b /o:-d /tc %a%`) do (ren "%%f" vide-!count:~1!.mp4
set /a count+=1
)
cd /d %~dp0

@REM Merges two videos into one.
@REM Объединяет два видео в одно.
setlocal EnableDelayedExpansion
set a=Result\vide-000.mp4
set aa=Result\vide-001.mp4
@REM set b="Result\%%~na.mp4"
set b="Result\video.mp4"
set c=ffmpeg

@REM Both videos must have an audio track
@REM В обоих видео должна быть аудио дорожка 
set f=-filter_complex "[0:v:0] [0:a:0] [1:v:0] [1:a:0] concat=n=2:v=1:a=1 [v] [a]" -map "[v]" -map "[a]"

for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
cd /d Result
del /f /q vide-000.mp4
del /f /q vide-001.mp4
exit

:NoSound
@REM Copies all video files from the Your_files folder to the Result folder and renames them.
@REM Скопирует из папки Your_files все видео файлы в папку Result и переименует их.
setlocal EnableDelayedExpansion
set a="Your_files\*.mp4"
set b="Result\*"
xcopy "%a%" "%b%" /h /k /q /r /c /y
cd /d Result
set "count=1000"
set a="*.mp4"
for /f "usebackq delims=*" %%f in (`dir /b /o:-d /tc %a%`) do (ren "%%f" vide-!count:~1!.mp4
set /a count+=1
)
cd /d %~dp0

@REM Merges two videos into one.
@REM Объединяет два видео в одно.
setlocal EnableDelayedExpansion
set a=Result\vide-000.mp4
set aa=Result\vide-001.mp4
@REM set b="Result\%%~na.mp4"
set b="Result\video.mp4"
set c=ffmpeg

@REM Both videos must not have an audio track.
@REM Оба видео не должны иметь звуковую дорожку.
set f=-filter_complex "[0:v:0] [1:v:0] concat=n=2:v=1 [v]" -map "[v]"

for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
cd /d Result
del /f /q vide-000.mp4
del /f /q vide-001.mp4
exit

:Other
@REM Copies all video files from the Your_files folder to the Result folder and renames them.
@REM Скопирует из папки Your_files все видео файлы в папку Result и переименует их.
setlocal EnableDelayedExpansion
set a="Your_files\*.mp4"
set b="Result\*"
xcopy "%a%" "%b%" /h /k /q /r /c /y
cd /d Result
set "count=1000"
set a="*.mp4"
for /f "usebackq delims=*" %%f in (`dir /b /o:-d /tc %a%`) do (ren "%%f" vide-!count:~1!.mp4
set /a count+=1
)
cd /d %~dp0

@REM Merges two videos into one.
@REM Объединяет два видео в одно.
setlocal EnableDelayedExpansion
set a=Result\vide-000.mp4
set aa=Result\vide-001.mp4
@REM set b="Result\%%~na.mp4"
set b="Result\video.mp4"
set c=ffmpeg

@REM Both videos must not have an audio track.
@REM Оба видео не должны иметь звуковую дорожку.
set f=-filter_complex "[0:v:0] [1:v:0] concat=n=2:v=1 [v]" -map "[v]"

for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
cd /d Result
del /f /q vide-000.mp4
del /f /q vide-001.mp4
exit