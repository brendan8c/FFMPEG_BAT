@echo off
color a
set a="Your_files\*.mp3"
set b="Result\%%~na.wav"
set c=ffmpeg
set f=-acodec pcm_s16le -ac 1 -ar 16000
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit