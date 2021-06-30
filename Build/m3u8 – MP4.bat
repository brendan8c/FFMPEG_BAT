@echo off
color a
echo.
echo  Please enter your link on m3u8
echo.
set /P t0=Enter path ^>
echo.
set b="Result\file.mp4"
set c=ffmpeg
set f=-bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50
%c% -y -i %t0% %f% %b%
exit
