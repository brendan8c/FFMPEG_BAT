@REM fps=10 frames per second
@REM fps=10 количество кадров в секунду

@echo off
color a
set a="Your_files\*.mp4"
set b="Result\file-%%03d.png"
set c=ffmpeg
set f=-vf fps=30
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
set a="Result\*.png"
set b="Result\%%~na.jpg"
set c=ffmpeg
for %%a in (%a%) do (%c% -y -i "%%a" %b%)
cd /d Result
del /f /q *.png 
exit