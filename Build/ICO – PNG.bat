@REM -vf chromakey=white – This replaces white with transparency when converting to png
@REM -vf chromakey=white – Это заменяет белый цвет прозрачным при преобразовании в png

@echo off
color a
set a="Your_files\*.ico"
set b="Result\%%~na.png"
set c=ffmpeg.exe
set f=-vf "scale=128:128,chromakey=white:similarity=0.01:blend=0.0"
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit
