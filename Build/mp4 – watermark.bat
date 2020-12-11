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


@echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.mp4
set aa=Your_files\*.png
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-filter_complex "overlay=(main_w-w)/2:(main_h-h)/2" -preset ultrafast -codec:a copy
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
exit
