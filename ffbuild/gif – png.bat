@REM Apply this filter to reduce image size
@REM Чтобы уменьшить размер изображения примените этот фильтр
@REM set f=-s 320x180 -pix_fmt yuvj420p

color a
@echo off
set a="Your_files\*gif"
set b="Result\file-%%03d.png"
set c=ffmpeg
set f=-pix_fmt yuvj420p
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)