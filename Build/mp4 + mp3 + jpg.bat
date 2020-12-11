@REM Apply this filter to position the watermark
@REM Примените этот фильтр, чтобы расположить водяной знак

@REM Center: overlay=(main_w-w)/2:(main_h-h)/2
@REM Top left corner: overlay=1:1
@REM Top right corner: overlay=W-w-1:1
@REM lower right corner: overlay=W-w-1:H-h-1
@REM Bottom left corner: overlay=1:H-h-1
@REM Bottom right corner. Padding 10px to the right and -10px to the bottom: overlay=main_w-w/1:main_h-h/2
@REM Bottom right corner. Padding -10px to the right and -10px to the bottom: overlay=main_w-w/1:main_h-h/2
@REM *--------------------------*
@REM По центру: overlay=(main_w-w)/2:(main_h-h)/2
@REM Верхний левый угол: overlay=1:1
@REM Верхний правый угол: overlay=W-w-1:1
@REM Нижний правый угол: overlay=W-w-1:H-h-1
@REM Нижний левый угол: overlay=1:H-h-1
@REM Нижний правый угол.  Отступ 10px справа и -10px снизу: overlay=main_w-w/1:main_h-h/2
@REM Нижний правый угол.  Отступ -10px справа и -10px снизу: overlay=main_w-w/1:main_h-h/2


@REM A preset is a collection of options that will provide a certain encoding speed to compression ratio. 
@REM A slower preset will provide better compression (compression is quality per filesize). This means that, for example, if you target a certain file size or constant bit rate, you will achieve better quality with a slower preset. 
@REM Similarly, for constant quality encoding, you will simply save bitrate by choosing a slower preset.
@REM *--------------------------*
@REM Предварительная установка - это набор параметров, которые обеспечивают определенную скорость кодирования и степень сжатия.
@REM Более медленная предустановка обеспечит лучшее сжатие (сжатие - это качество на размер файла). Это означает, что, например, если вы нацеливаетесь на определенный размер файла или постоянную скорость передачи данных, вы добьетесь лучшего качества с более медленной предустановкой.
@REM Точно так же для кодирования с постоянным качеством вы просто сэкономите битрейт, выбрав более медленную предустановку.

@REM -preset ultrafast ультра бытрый
@REM -preset superfast супер быстрый
@REM -preset veryfast очень быстрый
@REM -preset faster быстрее
@REM -preset fast быстро
@REM -preset medium  – default preset предустановка по умолчанию
@REM -preset slow медленный
@REM -preset slower помедленнее
@REM -preset veryslow очень медленно


@REM @echo off
@REM setlocal EnableDelayedExpansion
@REM color a
@REM set a=Your_files\*.jpg
@REM set aa=Your_files\*.mp4
@REM set b="Result\%%~na.mp4"
@REM set c=ffmpeg
@REM @REM set f=-filter_complex "[1:v]chromakey=0x00D700:0.1:0.3[ckout];[0:v][ckout]overlay[o]" -map [o] -map 1:a -c:a copy
@REM set f=-filter_complex "[1:v]chromakey=0x00D700:0.1:0.3[ckout];[0:v][ckout]overlay=(W-w)/1:(H-h)/1[o]" -map [o] -map 1:a -c:a copy
@REM for %%s in (%aa%) do !set aud="%%s"!
@REM for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
@REM exit

@REM 0x3BBD1E
@REM 0x00D700

@REM ffmpeg -i <input> -vf "scale=100:-1,setdar=16/9" <output>
@REM -s 1280x720 -c:v libx264 -c:a copy

@REM ffmpeg -i img.png -i video.mp4 -filter_complex "[1]scale=iw*min(1920/iw\,1080/ih):ih*min(1920/iw\,1080/ih)[ov];[0][ov]overlay=(W-w)/2:(H-h)/2" -y -hide_banner out.mp4


@REM Изменяет размер видео + склеивает его с фотографией. Видео тут по середине
@REM @echo off
@REM setlocal EnableDelayedExpansion
@REM color a
@REM set a=Your_files\*.jpg
@REM set aa=Your_files\*.mp4
@REM set b="Result\%%~na.mp4"
@REM set c=ffmpeg
@REM set f=-filter_complex "[1]scale=iw*min(1280/iw\,720/ih):ih*min(1280/iw\,720/ih)[ov];[0][ov]overlay=(W-w)/2:(H-h)/2" -y -hide_banner
@REM for %%s in (%aa%) do !set aud="%%s"!
@REM for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
@REM exit

@REM [logo-in][video-in]scale2ref=w=oh*mdar:h=ih/10[logo-out][video-out]
@REM exit-filter_complex "[0]scale=426:-2[vid];[1][vid]scale2ref='oh*mdar':'ih/10'[wm][vid];[vid][wm]overlay=5:5:format=rgb,format=yuv420p"
@REM ffmpeg -i input1 -i input2 -filter_complex '[1][0]scale2ref=oh*mdar:ih[2nd][ref];[ref][2nd]vstack' -map [vid] -c:v libx264 -crf 23 -preset veryfast output
@REM -filter_complex "[1][0]scale2ref[2nd][ref];[ref][2nd]vstack" -map [vid] -c:v libx264 -crf 23 -preset veryfast
@REM =================================================================================================================================================


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
echo Add a smooth fade?
echo.
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
@echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.mp4
set aa=Your_files\*.mp3
set b="Result\temp0.mp4"
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

@REM Fitting the video to the image size
@REM Подгоняем видео под размер изображения
setlocal EnableDelayedExpansion
set a=Result\*.mp4
set aa=Your_files\*.jpg
set b="Result\temp1.mp4"
set c=ffmpeg
set f=-filter_complex "scale2ref[2nd][ref];[ref][2nd]overlay" -preset ultrafast -codec:a copy
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)

@REM Removed the chromokey and overlay the background image
@REM Удаляем хромакей и накладываем фоновое изображение
set a=Your_files\*.jpg
set aa=Result\*.mp4
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-filter_complex "[1:v]chromakey=0x00FF00:similarity=0.350:blend=0.05[ckout];[0:v][ckout]overlay=(W-w)/1:(H-h)/1[out]" -map [out] -map 1:a -c:a copy
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
cd /d Result
del /f /q temp0.mp4
del /f /q temp1.mp4
exit

@REM ----------------------------------------------------------------------------------------------------------------*
:No
@REM We glue the video mp4 and the audio file mp3. The audio track is replaced with a new one.
@REM Склеиваем видео mp4 и аудио файл mp3. Аудио дорожка заменяется на новую.
@REM @echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.mp4
set aa=Your_files\*.mp3
set b="Result\temp0.mp4"
set c=ffmpeg
set f=-filter_complex "[1:0] apad" -shortest
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)

@REM Fitting the video to the image size
@REM Подгоняем видео под размер изображения
setlocal EnableDelayedExpansion
set a=Result\temp0.mp4
set aa=Your_files\*.jpg
set b="Result\temp1.mp4"
set c=ffmpeg
set f=-filter_complex "scale2ref[2nd][ref];[ref][2nd]overlay" -preset ultrafast -codec:a copy
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)

@REM Removed the chromokey and overlay the background image
@REM Удаляем хромакей и накладываем фоновое изображение
set a=Your_files\*.jpg
set aa=Result\temp1.mp4
set b="Result\Video.mp4"
set c=ffmpeg
set f=-filter_complex "[1:v]chromakey=0x00FF00:similarity=0.350:blend=0.05[ckout];[0:v][ckout]overlay=(W-w)/1:(H-h)/1[out]" -map [out] -map 1:a -c:a copy
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
cd /d Result
del /f /q temp0.mp4
del /f /q temp1.mp4
pause
exit