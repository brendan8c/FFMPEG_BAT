@echo off
color a
set a="Your_files\*.gif"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-b:v 0 -crf 25 -f mp4 -vcodec libx264 -pix_fmt yuv420p
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit