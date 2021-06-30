@REM Apply this filter to position the watermark
@REM Примените этот фильтр, чтобы расположить водяной знак

@REM Center: overlay=(main_w-w)/2:(main_h-h)/2
@REM Center: overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2
@REM Top left corner: overlay=1:1
@REM Top right corner: overlay=W-w-1:1
@REM lower right corner: overlay=W-w-1:H-h-1
@REM Bottom left corner: overlay=1:H-h-1
@REM Bottom right corner. Padding 10px to the right and -10px to the bottom: overlay=main_w-w/1:main_h-h/2
@REM Bottom right corner. Padding -10px to the right and -10px to the bottom: overlay=main_w-w/1:main_h-h/2
@REM *--------------------------*
@REM По центру: overlay=(main_w-w)/2:(main_h-h)/2
@REM По центру: overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2
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

@REM -map 0 selects all streams.
@REM -map 0:v video streams only.
@REM -map 0:a audio streams only.
@REM *--------------------------*
@REM -map 0 выбирает все потоки. 
@REM -map 0:v только видеопотоки. 
@REM -map 0:a только аудиопотоки.

@REM : – Colons are used to separate values.
@REM ; - A filtergraph consists of a sequence of filterchains. A sequence of filterchains is represented by a list of ";"-separated filterchain descriptions.
@REM , - A filterchain consists of a sequence of connected filters, each one connected to the previous one in the sequence. 
@REM A filterchain is represented by a list of ","-separated filter descriptions.
@REM scale2ref – Scale (resize) the input video, based on a reference video. (https://ffmpeg.org/ffmpeg-filters.html#scale2ref)
@REM -filter_complex – Combines filters into one.
@REM overlay – Overlay one video on top of another video or image.
@REM It takes two inputs and has one output. The first input is the "main" video on which the second input is overlaid.
@REM *--------------------------*
@REM : - Двоеточие используется для разделения значений.
@REM ; - График фильтров состоит из последовательности цепочек фильтров. Последовательность цепочек фильтров представлена ​​списком описаний цепочек фильтров, разделенных «;».
@REM , - Цепочка фильтров состоит из последовательности связанных фильтров, каждый из которых связан с предыдущим в последовательности. 
@REM Цепочка фильтров представлена ​​списком описаний фильтров, разделенных символами ",".
@REM scale2ref – Масштабируйте (изменяйте размер) входного видео на основе эталонного видео. (https://ffmpeg.org/ffmpeg-filters.html#scale2ref)
@REM -filter_complex – Объединяет фильтры в один.
@REM overlay – Наложить одно видео поверх другого видео или изображения.
@REM У него два входа и один выход. Первый вход - это «основное» видео, на которое накладывается второй вход.


@REM Например, чтобы наложить изображение на видео.
@REM Здесь [0:v] относится к первому видеопотоку в первом входном файле, который связан с первым (основным) входом оверлейного фильтра. 
@REM Точно так же первый видеопоток на втором входе связан со вторым (оверлейным) входом оверлея.
@REM ffmpeg -i video.mkv -i image.png -filter_complex '[0:v][1:v]overlay[out]' -map '[out]' out.mkv
@REM Предполагая, что в каждом входном файле есть только один видеопоток, мы можем опустить метки ввода, поэтому приведенное выше эквивалентно.
@REM ffmpeg -i video.mkv -i image.png -filter_complex 'overlay[out]' -map '[out]' out.mkv
@REM Кроме того, мы можем опустить метку вывода, и единственный вывод из графа фильтра будет автоматически добавлен в выходной файл, поэтому мы можем просто написать.
@REM ffmpeg -i video.mkv -i image.png -filter_complex 'overlay' out.mkv


@REM [0] - video. [1] - image. scale2ref - scaling the image in relation to the video. overlay - Overlay one video on top of another in the center.
@REM [0][0] Scales a video in relation to another video.
@REM [1][0] Scales the image in relation to the video.
@REM [foto][video];[video][foto] – The image will be above the video.
@REM [video][foto];[foto][video] – The image will be above the video.
@REM [video][foto];[video][foto] – The image will be below the video.
@REM [foto][video];[foto][video] – The image will be below the video.
@REM 1.1 - Image scaling value. A value of 1 will scale the image 1 to 1 with video. A value of 2 will cause the image to be scaled 2 times.
@REM *--------------------------*
@REM [0] – видео. [1] – изображение. scale2ref – масштабирование изображения по отношению к видео. overlay – Наложить одно видео поверх другого по центру.
@REM [0][0] Масштабирует видео по отношению к другому видео.
@REM [1][0] Масштабирует изображение по отношению к видео.
@REM [foto][video];[video][foto] – Изображение будет над видео.
@REM [video][foto];[foto][video] – Изображение будет над видео.
@REM [video][foto];[video][foto] – Изображение будет под видео.
@REM [foto][video];[foto][video] – Изображение будет под видео.
@REM 1.1 – Значение масштабирования изображения. Значение 1 приведёт к масштабированию изображения 1 к 1 с видео. Значение 2 приведёт к масштабированию изображения в 2 раза.

@echo off
setlocal EnableDelayedExpansion
color a
set a=Your_files\*.mp4
set aa=Your_files\*.jpg
set b="Result\temp1.mp4"
set c=ffmpeg
set f=-filter_complex "[1][0] scale2ref=w=oh*mdar:h=ih*1.1 [foto][video];[foto][video] overlay=(main_w-w)/2:(main_h-h)/2 " -preset ultrafast
for %%s in (%aa%) do !set aud="%%s"!
for %%a in (%a%) do (%c% -y -i "%%a" -i %aud% %f% %b%)
exit