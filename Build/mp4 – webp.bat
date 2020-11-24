@REM If you have any problems, try this filter.
@REM Если у вас имеются какие-то проблемы, попробуйте этот фильтр.
@REM set f=-vcodec libwebp -preset default -loop 0 -an -vsync 0
@REM *----------------------------------------------------------------------------*
@REM To get a preview of a video in low resolution use this filter.
@REM Получить превью ролика низкого разрешения используйте этот фильтр.
@REM set f=-lossless 0 -qscale 60 -loop 0 -ss 00:00:00 -t 00:00:03 -s 320x180
@REM *----------------------------------------------------------------------------*
@REM -lossless <— Enables/Disables use of lossless mode. Default is 0.
@REM -qscale <— For lossy encoding, this controls image quality, 0 to 100. The default value is 75.
@REM -loop 0 <— The video will repeat endlessly. -loop 2 is repeated 2 times.
@REM             —> Assign start and end times <—
@REM Timestamps must be in HH:MM:SS.xxx format. .xxx you can omit this (msec).
@REM -ss looks for the beginning and -to looks for the end, the exit point.
@REM *----------------------------------------------------------------------------*
@REM -lossless <— Включает / отключает использование режима без потерь. По умолчанию 0.
@REM -qscale <— Для кодирования с потерями это контролирует качество изображения от 0 до 100. Значение по умолчанию - 75.
@REM -loop 0 <— Видео будет повторяться бесконечно. -loop 2 повторяется 2 раза.

@REM            —> Назначить время начала и конца <—
@REM Метки времени должны быть в HH:MM:SS.xxx формате. .xxx можно опустить это (msec).
@REM -ss ищет начало, а -to ищет конец, точку выхода.
@REM *----------------------------------------------------------------------------*
@REM color a
@REM @echo off
@REM set a="Your_files\*.mp4"
@REM set b="Result\%%~na.webp"
@REM set c=ffmpeg
@REM set f=-vcodec libwebp -lossless 1 -q: 60 -preset default -loop 0 -an -vsync 0
@REM set ts=-ss 00:00:02
@REM set te=-to 00:00:05
@REM for %%a in (%a%) do (%c% -y %ts% -i "%%a" %te% %f% %b%)


@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.webp"
set c=ffmpeg
set f=-vcodec libwebp -lossless 1 -q: 60 -preset default -loop 0 -an -vsync 0
@REM set f=-c:v libwebp -lossless 0 -filter_complex "[0:v] fps=8,scale=-2:200"
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit