@REM Чтобы уменьшить размер файла используйте этот фильтр.
@REM Use this filter to reduce file size.
@REM f=-lossless 0 -qscale 10

@REM -lossless Enables/Disables use of lossless mode. Default is 0.
@REM -qscale For lossy encoding, this controls image quality, 0 to 100. The default value is 75.
@REM -lossless Включает / отключает использование режима без потерь. По умолчанию 0.
@REM -qscale Для кодирования с потерями это контролирует качество изображения от 0 до 100. Значение по умолчанию - 75.

@echo off
color a
set a="Your_files\*.jpg"
set b="Result\%%~na.webp"
set c=ffmpeg.exe
set f=
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit