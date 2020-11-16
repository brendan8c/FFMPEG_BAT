color a
@echo off
echo.
echo.
SET /P URL="[Enter video URL] "
echo.
youtube-dl -o Result/%%(title)s.%%(ext)s -i --ignore-config --hls-prefer-native %URL%
echo.
start "" "Result"
EXIT
