@REM This filter will resize the output image to 320 pixels wide and automatically detect the height while maintaining the aspect ratio.
@REM Этот фильтр изменит размер выходного изображения до 320 пикселей в ширину и автоматически определит высоту, сохранив соотношение сторон.
@REM set f=-filter_complex "fps=10,scale=320:-1:flags=lanczos,split[o1][o2];[o1]palettegen[p];[o2]fifo[o3];[o3][p]paletteuse"

@REM http://ffmpeg.org/ffmpeg-filters.html#palettegen

@REM In the ffmpeg source code (libavcodec/gif.c) there are some command line flags - these are "-gifflags -offsetting", "-gifflags -transdiff" and "-gifimage". 
@REM -gifflags   set GIF flags (default 3)
@REM -offsetting enable picture offsetting
@REM -transdiff  enable transparency detection between frames
@REM https://trac.ffmpeg.org/ticket/8584 
@REM If disabled, the file size will grow!! -gifflags 0
@REM В исходном коде ffmpeg (libavcodec/gif.c) есть несколько флагов командной строки - это «-gifflags -offsetting», «-gifflags -transdiff» и «-gifimage».
@REM -gifflags   устанавливает флаги GIF (по умолчанию 3)
@REM -offsetting включить смещение изображения
@REM -transdiff  включить определение прозрачности между кадрами
@REM https://trac.ffmpeg.org/ticket/8584 
@REM Если отключить, размер файла вырастет!! -gifflags 0

@REM If it crashes, remove these lines: -gifflags -offsetting
@REM Если вылетает с ошибкой, удалите эти строки: -gifflags -offsetting

@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.gif"
set c=ffmpeg
set f=-filter_complex "[0:v] fps=30,scale=-1:-1:flags=full_chroma_int,split [a][b];[a] palettegen=max_colors=255:reserve_transparent=1:stats_mode=diff [p];[b][p] paletteuse=dither=none:bayer_scale=5:diff_mode=rectangle:new=1:alpha_threshold=128" -gifflags -offsetting
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit
