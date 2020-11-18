@REM Assign start and end times
@REM Timestamps must be in HH:MM:SS.xxx format. .xxx you can omit this (msec).
@REM -ss looks for the beginning and -to looks for the end, the exit point.
@REM *--------------------------*
@REM Назначить время начала и конца
@REM Метки времени должны быть в HH:MM:SS.xxx формате. .xxx можно опустить это (msec).
@REM -ss ищет начало, а -to ищет конец, точку выхода.

@REM color a
@REM @echo off
@REM set a="Your_files\*.mp4"
@REM set b="Result\%%~na.mov"
@REM set c=ffmpeg
@REM set f=-c:v libx264 -c:a libmp3lame -b:a 384K
@REM set ts=-ss 00:00:02
@REM set te=-to 00:00:05
@REM for %%a in (%a%) do (%c% -y %ts% -i "%%a" %te% %f% %b%)

@REM MP4 and MOV are just containers that have an audio and a video stream inside them, these streams can be in multiple formats for example you could have an MP4 with AAC Audio and X264 video or you could have an MP4 with MP3 audio and X265 video, they are both MP4's but they are very different inside the container.
@REM To change containers without altering the streams is a relatively simple process:
@REM *--------------------------*
@REM MP4 и MOV - это просто контейнеры, в которых есть аудио и видеопоток. 
@REM Эти потоки могут быть в нескольких форматах, например, у вас может быть MP4 с аудио AAC и видео X264 или у вас может быть MP4 с аудио MP3 и видео X265, они оба MP4, но внутри контейнера они очень разные.
@REM Смена контейнеров без изменения потоков - относительно простой процесс

@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.mov"
set c=ffmpeg
set f=-c:v libx265 -c:a libmp3lame -b:a 384K
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit