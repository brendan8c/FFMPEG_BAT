@REM Assign start and end times
@REM Timestamps must be in HH:MM:SS.xxx format. .xxx you can omit this (msec).
@REM -ss looks for the beginning and -to looks for the end, the exit point.
@REM *--------------------------*
@REM Назначить время начала и конца
@REM Метки времени должны быть в HH:MM:SS.xxx формате. .xxx можно опустить это (msec).
@REM -ss ищет начало, а -to ищет конец, точку выхода.

@REM color a
@REM @echo off
@REM set a="Your_files\*.avi"
@REM set b="Result\%%~na.mov"
@REM set c=ffmpeg
@REM set f=-c:v libx264 -c:a libmp3lame -b:a 384K
@REM set ts=-ss 00:00:02
@REM set te=-to 00:00:05
@REM for %%a in (%a%) do (%c% -y %ts% -i "%%a" %te% %f% %b%)

@REM An AVI file is just a container and can contain any codec, so if you want to encode to QuickTime and Media player, you need to:
@REM Use the h264 Codec which both QT and WPlayer can display nowadays
@REM use 384 Kbps MP3 encoding for audio
@REM *--------------------------*
@REM Файл AVI - это просто контейнер и может содержать любой кодек, поэтому, если вы хотите кодировать в QuickTime и Media Player, вам необходимо:
@REM Кодек h264, который может отображать как QT, так и WPlayer
@REM Использовать кодировку MP3 со скоростью 384 Кбит/с для аудио

@echo off
color a
set a="Your_files\*.avi"
set b="Result\%%~na.mov"
set c=ffmpeg
set f=-c:v libx264 -c:a libmp3lame -b:a 384K
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit