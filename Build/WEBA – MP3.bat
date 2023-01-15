@echo off
color a
set a="Your_files\*.weba"
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-acodec libmp3lame -b:a 128k
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit