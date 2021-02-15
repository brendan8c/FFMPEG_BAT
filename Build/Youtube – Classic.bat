@echo off
color a
echo.
echo.
set /P URL="[Enter video URL] "
echo.
youtube-dl -o Result/%%(title)s.%%(ext)s -i --ignore-config --hls-prefer-native %URL%
echo.
start "" "Result"
exit
