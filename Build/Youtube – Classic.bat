@REM Download video from facebook
@REM 1) Click the following: Share > Embed > Copy Code. 
@REM When using youtube-dl try to clean up the URL you use.
@REM For example, the following URL will work. 
@REM https://www.facebook.com/video.php?v=10152588878600983

@REM Загрузить видео из facebook
@REM 1) Нажмите следующее: Поделится > Встроить > Копировать код.
@REM При использовании youtube-dl попробуйте очистить URL, который вы используете.
@REM Например, следующий URL-адрес будет работать. 
@REM https://www.facebook.com/video.php?v=10152588878600983

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
