@echo off
color a
set a="Your_files\*.png"
set b="Result\%%~na.ico"
set c=ffmpeg.exe
set f=-vf scale=128:128
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit
