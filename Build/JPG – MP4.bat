@REM -c:v libx264 - We will encode in the MP4 format with the x264 codec.
@REM -loglevel 16 – Show all errors, including ones which can be recovered from.
@REM -r 30 – FPS frame rate. It takes effect after all filtering, but before encoding the video stream.
@REM -an – Disable audio recording.
@REM -crf 23 – Constant Rate Factor (CRF) is a quality setting (and rate control). values from 0 to 51, where lower values will result in better quality at the expense of higher file sizes. Higher values mean more compression, but at some point you will notice quality degradation. The default is 23.
@REM ----------------------------------------------------------------------------------------------------------------*
@REM -c:v libx264 — Кодировать будем в формат MP4 кодеком x264.
@REM -loglevel 16 – Показать все ошибки, включая те, которые можно исправить.
@REM -r 30 – Частота кадров FPS. Вступает в силу после всей фильтрации, но до того, как будет выполнено кодирование видеопотока.
@REM -an – Отключить запись звука.
@REM -crf 23 – Коэффициент постоянной скорости (CRF) - это настройка качества (и управления скоростью). значения от 0 до 51, где более низкие значения приведут к лучшему качеству за счет более высоких размеров файлов. Более высокие значения означают большее сжатие, но в какой-то момент вы заметите ухудшение качества. Значение по умолчанию - 23.

@REM https://trac.ffmpeg.org/wiki/Concatenate
@REM https://www.cyberforum.ru/cmd-bat/thread1997910.html
@REM https://superuser.com/questions/718027/ffmpeg-concat-doesnt-work-with-absolute-path
@REM https://trac.ffmpeg.org/wiki/Encode/H.264

echo off
color a
set a="Your_files\*.jpg"
set b="Result\video.mp4"
set c=ffmpeg
set f=-c:v libx264 -pix_fmt yuv420p -r 30 -crf 20
set tmp="Result\list.tmp"
for %%f in (%a%) do (@echo file 'file:%cd%\%%f' >> %tmp%)
%c% -y -f concat -safe 0 -i %tmp% %f% %b%
cd /d Result
del /f /q list.tmp
exit