@REM -filter_complex "[1:v]chromakey=0x<color>:<similarity>:<blend>[ckout];[0:v][ckout]overlay[out]"
@REM <color> is the rgb color to match in hex (ex: 0x000000 for black). (chromakey=0x00D700) is the color of your chromakey.
@REM 00ff00 <— is green , ff0000 <— is red.
@REM blend=0.06 <— Opaque, blend=0.07 <— Transparent. Blend percentage for the differential pixels. Range: 1.0 - 0.0. Default: 1.0.
@REM Higher values result in semi-transparent pixels, with a higher transparency the more similar the pixels color is to the original color.
@REM similarity=0.350 <— The similarity of this color. Finds any color similar to the degree. Range: 1.0 - 0.01. Default: 0.01.
@REM Defines the threshold to identify image differences. 0.01 matches slight differences, while 1.0 only matches stark contrast.
@REM *------------------------------------------------------------------------------------------------------------------*
@REM -filter_complex "[1:v]chromakey=0x<color>:<similarity>:<blend>[ckout];[0:v][ckout]overlay[out]"
@REM <color> это цвет rgb для соответствия в шестнадцатеричном формате (например: 0x000000 для черного). (chromakey=0x00D700) это цвет вашего хромакея.
@REM 00ff00 <— зеленый, ff0000 <— красный.
@REM blend=0.06 <— Непрозрачный, blend=0.07 <— Прозрачный. Процент смешивания для разностных пикселей. Диапазон: 1,0 - 0,0. По умолчанию: 1.0.
@REM Более высокие значения приводят к полупрозрачным пикселям, чем выше прозрачность, тем больше цвет пикселей похож на исходный цвет.
@REM similarity=0.350 <— Сходство данного цвета. Найдёт любой цвет похожий на степень. Диапазон: 1,0 - 0,01. По умолчанию: 0,01.
@REM Определяет порог для определения различий изображений. 0,01 соответствует небольшим различиям, а 1,0 соответствует только резкому контрасту. 

@REM Link URL info —> https://ffmpeg.org/ffmpeg-filters.html#chromakey

@echo off
setlocal EnableDelayedExpansion
color a
echo --------------------------------------------------------*
echo.
echo Rename your chromakey video to 0.mp4
echo Rename your other video to 1.mp4
echo.
echo 1) Press 1 if renamed.

echo.
choice /c 1
echo.
if errorlevel 1 goto Ok

:Ok
if not exist "Your_files\0.mp4" goto nothere
if not exist "Your_files\1.mp4" goto nothere
goto start
:nothere
echo You have not renamed your videos in the Your_files folder.. Or they are not there..
pause
exit
:start

echo --------------------------------------------------------*
echo.
echo Specify transparency. Range: 1.0 - 0.0
echo.
echo Opaque - 0.0, 0.01, 0.02, 0.03, 0.04,.. 0.09, 1.0 - Transparent.
echo.
set /p t="Transparency. eg: 0.05: "


@REM We glue the video mp4 and the audio file mp3. The audio track is replaced with a new one.
@REM Склеиваем видео mp4 и аудио файл mp3. Аудио дорожка заменяется на новую.
@REM @echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\0.mp4
set aa=Your_files\*.mp3
set b="Result\temp0.mp4"
set c=ffmpeg
set f=-filter_complex "[1:0] apad" -shortest
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)

@REM Fitting the video to the image size
@REM Подгоняем видео под размер видео №1
setlocal EnableDelayedExpansion
set a=Result\temp0.mp4
set aa=Your_files\1.mp4
set b="Result\temp1.mp4"
set c=ffmpeg
set f=-filter_complex "scale2ref[2nd][ref];[ref][2nd]overlay" -preset ultrafast -codec:a copy
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)

@REM Removed the chromokey and overlay the background image
@REM Удаляем хромакей и накладываем фоновое изображение
set a=Your_files\1.mp4
set aa=Result\temp1.mp4
set b="Result\Video.mp4"
set c=ffmpeg
set f=-filter_complex "[1:v]chromakey=0x00FF00:similarity=0.350:blend=%t%[ckout];[0:v][ckout]overlay=(W-w)/1:(H-h)/1[out]" -map [out] -map 1:a -c:a copy
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
cd /d Result
del /f /q temp0.mp4
del /f /q temp1.mp4
pause
exit