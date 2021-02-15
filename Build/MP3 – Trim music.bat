@REM -f dshow – Audio filters.
@REM -map 0:a audio streams only.
@REM -audio_buffer_size – Set audio device buffer size in milliseconds (which can directly impact latency, depending on the device). Default 500ms 
@REM ----------------------------------------------------------------------------------------------------------------*
@REM -f dshow – Аудио фильтр.
@REM -map 0:a только аудиопотоки. 
@REM -audio_buffer_size – Установите размер буфера аудиоустройства в миллисекундах (что может напрямую влиять на задержку, в зависимости от устройства). По умолчанию 500ms

@echo off
color a
echo.
echo  Time format: hh:mm:ss.ms
echo  Example:     00:05 or 00:05.1000
echo.
set /P t0=Enter start time ^>
echo --------------------------------*
echo  Example: 01:45 or 00:05.500
echo.
set /P t1=Enter end time ^>
echo --------------------------------*
echo.
set a="Your_files\*.mp3"
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-ss %t0% -to %t1% -map 0:a -audio_buffer_size 1000 -acodec libmp3lame -b:a 192k
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit