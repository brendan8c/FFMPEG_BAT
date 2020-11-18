@echo off
color a
echo.
echo.
set /p a="[Enter video URL] "
set b=-o "Result/%%(title)s.%%(ext)s"
set c=youtube-dl
set f=-i --extract-audio --audio-format mp3
exit