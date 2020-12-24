@REM Link ———> https://www.bogotobogo.com/FFMpeg/ffmpeg_image_scaling_jpeg.php
@REM Link ———> https://video.stackexchange.com/questions/4563/how-can-i-crop-a-video-with-ffmpeg

@echo off
setlocal EnableDelayedExpansion
color a

@REM Fitting any image to a height of 600 pixels
@REM Подгоняем любое изображение под высоту 600 пикселей
set a="Your_files\*.jpg"
set b="Result\temp-1.jpg"
set c=ffmpeg
set f=-vf scale=-1:1600
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)

@REM Cut out the desired piece from the image
@REM Вырезаем нужный кусок из изображения
set a="Result\temp-1.jpg"
set b="Result\temp-2.jpg"
set c=ffmpeg
set f=-filter:v "crop=1600/1:1600/1"
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)

@REM Add our image to the mp3 file
@REM Добавляем к mp3 файлу наше изображение
set a=Your_files\*.mp3
set aa=Result\temp-2.jpg
set b="Result\%%~na.mp3"
set c=ffmpeg
@REM set f=-c:a copy -c:v copy -map 0:0 -map 1:0 -codec copy -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)"
set f=-map 0:0 -map 1:0 -codec copy -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)"
for %%s in (%aa%) do !set png="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %png% %f% %b%)
cd /d Result
del /f /q *.jpg
exit