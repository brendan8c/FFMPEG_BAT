@REM Adjust the CRF value till the quality/size tradeoff is ok. Lower values produce bigger but better files. -crf 30
@REM Отрегулируйте значение CRF до тех пор, пока не будет приемлемым компромисс между качеством и размером.
@REM Более низкие значения создают файлы большего размера, но лучшего качества. -crf 30


@echo off
color a
set a="Your_files\*.mov"
set b="Result\%%~na.webm"
set c=ffmpeg
set f=-c:v libvpx-vp9 -crf 10 -b:v 0 -b:a 128k -c:a libopus
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit