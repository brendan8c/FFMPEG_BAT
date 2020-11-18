@REM If you remove the -loop 0 parameter, the animation will run 1 time
@REM Если удалить параметр -loop 0 анимация отработает 1 раз

@echo off
color a
set a="Your_files\*.gif"
set b="Result\%%~na.webp"
set c=ffmpeg
set f=-loop 0
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit