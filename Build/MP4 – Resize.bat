@REM Это установит коэффициент постоянной скорости, который снижает среднюю скорость передачи данных, 
@REM но сохраняет лучшее качество. Изменяйте CRF между 18 и 28 - чем ниже, тем выше битрейт.
@REM Большие значения crf приведут к большему сжатию (меньшему размеру видео).

@echo off
setlocal EnableDelayedExpansion
color a
echo --------------------------------------------------------*
echo.
echo This is setting the Constant Rate Factor, 
echo which lowers the average bit rate, but retains better quality.
echo Change CRF from 18 to 28 and more - the lower, the higher the bitrate.
echo bigger values of crf will lead to a bigger compression (smaller video size).
echo.
echo.
set /p t="E.g. 35: "
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
for %%a in (%a%) do (%c% -y -i "%%a" -vcodec libx265 -crf %t% %b%)
exit