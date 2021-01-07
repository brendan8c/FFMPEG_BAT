@echo off
color a
set a="Your_files\*.*"
set b="Result\%%~na.txt"
set c=ffmpeg
for %%a in (%a%) do (%c% -y -i "%%a" 2> %b% & type %b%)
pause
exit