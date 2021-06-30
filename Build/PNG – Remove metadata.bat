@echo off
color a
set a="Your_files\*.png"
set b="Result\%%~na.png"
set c=ffmpeg
set f=-map_metadata -1
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit