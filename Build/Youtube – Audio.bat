@echo off
color a
echo.
echo.
set /p a="[Enter video URL] "
set b=-o "Result/%%(title)s.%%(ext)s"
set c=youtube-dl
set f=-c -i --extract-audio --audio-format mp3 --yes-playlist
for %%a in (%a%) do (%c% %f% "%%a" %b%)
exit