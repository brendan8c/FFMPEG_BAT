@REM Filter adds video fade at the very beginning for 3 seconds.
@REM set f=-vf "fade=t=in:st=0:d=3" -c:a copy
@REM Filter adds video fade at the very end. The video will start fading to black within 5 seconds at the 6 second mark.
@REM set f=-vf "fade=t=out:st=6:d=3" -c:a copy
@REM Filter adds audio fade at the very beginning for 5 seconds.
@REM set f=-af "afade=t=in:st=0:d=5"
@REM Filter adds audio fade at the very end. The sound will begin to disappear within 5 seconds at the 5 second mark.
@REM set f=-af "afade=t=out:st=5:d=5"
@REM This filter makes the sound decay at the end for 8 milliseconds.
@REM set f=-filter_complex "aevalsrc=0:d=0.8 [a_silence]; [0:a:0] [a_silence] acrossfade=d=0.8"
@REM *--------------------------------------------------------------------------------------------------------*
@REM Фильтр добавляет затухание видео в самом начале в течении 3 секунд.
@REM set f=-vf "fade=t=in:st=0:d=3" -c:a copy
@REM Фильтр добавляет затухание видео в самом конце. Видео начнет исчезать до черного в течение 5 секунд на отметке 6 секунд.
@REM set f=-vf "fade=t=out:st=6:d=3" -c:a copy
@REM Фильтр добавляет затухание аудио в самом начале в течении 5 секунд.
@REM set f=-af "afade=t=in:st=0:d=5"
@REM Фильтр добавляет затухание звука в самом конце. Звук начнет исчезать в течение 5 секунд на отметке 5 секунд.
@REM set f=-af "afade=t=out:st=5:d=5"
@REM Этот фильтр делает затухание звука в конце в течении 8 милисекунд.
@REM set f=-filter_complex "aevalsrc=0:d=0.8 [a_silence]; [0:a:0] [a_silence] acrossfade=d=0.8"


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
@REM Добавить плавный переход?
echo  Add a smooth fade?
echo.
@REM Да - Внимание: долгая обработка.
@REM Нет - Предупреждение: короткая обработка.
echo 1) Yes - Warning: long processing.
echo 2) No - Warning: short processing.

echo.
choice /c 12
echo.

if errorlevel 2 goto No
if errorlevel 1 goto Yes

echo No idea how you even got here
pause
goto start

:Yes
@REM We glue the video mp4 and the audio file mp3. The audio track is replaced with a new one.
@REM Склеиваем видео mp4 и аудио файл mp3. Аудио дорожка заменяется на новую.
@REM @echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.mp4
set aa=Your_files\*.mp3
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-filter_complex "[1:0] apad" -shortest
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)

@REM Filter adds audio fade at the very beginning for 1.5 seconds.
@REM Фильтр добавляет затухание звука в самом начале в течении 1.5 секунд.
md %temp%\ffmpeg
set a="Result\*.mp4"
set b="%temp%\ffmpeg\%%~na.mp4"
set f=-af "afade=t=in:st=0:d=1.5"
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
cd /d Result
del /f /q *.mp4
move /y "%temp%\ffmpeg\*.mp4" "%~dp0Result"
cd ..

@REM This filter makes the sound decay at the end for 1.5 milliseconds.
@REM Этот фильтр делает затухание звука в конце в течении 1.5 милисекунд.
set a="Result\*.mp4"
set b="%temp%\ffmpeg\%%~na.mp4"
set f=-filter_complex "aevalsrc=0:d=1.5 [a_silence]; [0:a:0] [a_silence] acrossfade=d=1.5"
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
cd /d Result
del /f /q *.mp4
move /y "%temp%\ffmpeg\*.mp4" "%~dp0Result"
cd ..

@REM Filter adds video fade at the very beginning for 1.5 seconds.
@REM Фильтр добавляет затухание видео в самом начале в течении 1.5 секунд.
set a="Result\*.mp4"
set b="%temp%\ffmpeg\%%~na.mp4"
set f=-vf "fade=t=in:st=0:d=1.5" -c:a copy
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
cd /d Result
del /f /q *.mp4
move /y "%temp%\ffmpeg\*.mp4" "%~dp0Result"
cd ..

cd /d %temp%
rd /s /q ffmpeg
cd /d %~dp0
exit
@REM ---------------------------------------------------------------------------------------------*
:No
@REM We glue the video mp4 and the audio file mp3. The audio track is replaced with a new one.
@REM Склеиваем видео mp4 и аудио файл mp3. Аудио дорожка заменяется на новую.
@REM @echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.mp4
set aa=Your_files\*.mp3
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-filter_complex "[1:0] apad" -shortest
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
exit