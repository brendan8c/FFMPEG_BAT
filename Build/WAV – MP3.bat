@echo off
color a
set a="Your_files\*.wav"
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-acodec libmp3lame
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit