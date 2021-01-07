@REM -rtbufsize 100M - buffer for video. Screen recording should be fast and smooth so that there are no drops (gaps) of frames. Therefore, it is better to first write the video to memory (this is faster than to disk), and then ffmpeg will transfer it from memory to disk itself.
@REM -f gdigrab - this option is required if you are recording a screen in Windows;
@REM -framerate 30 - frame rate of the resulting video;
@REM -probesize 10M - the number of frames required by ffmpeg to identify the stream. It seems that with a value of 10M it works fine;
@REM -draw_mouse 1 - draw the mouse;
@REM -i desktop - tell ffmpeg to record the entire screen;
@REM -c: v libx264 - we will compress to MP4 format using the x264 codec;
@REM -r 30 - the codec will record video at 30 frames per second;
@REM -preset ultrafast - we tell the codec not to hesitate for a long time and encode the video stream as quickly as possible (this is relevant when recording a screen);
@REM -tune zerolatency - x264 codec option to speed up encoding;
@REM -crf 25 - quality of the recorded video (higher value means worse video, lower value means better);
@REM -pix_fmt yuv420p - color format of the resulting video.
@REM ----------------------------------------------------------------------------------------------------------------*
@REM -rtbufsize 100M — буфер под видео. Запись с экрана должна идти бысто и гладко, чтобы не было дропов (пропусков) кадров. Поэтому лучше сначала записывать видео в память (так  быстрее чем на диск), а затем ffmpeg сам перенесет из памяти на диск.
@REM -f gdigrab — опция необходима если вы пишите экран в Windows;
@REM -framerate 30 — частота кадров результирующего видео;
@REM -probesize 10M — количество кадров необходимое ffmpeg для идентификации потока. Вроде со значением 10M работает нормально;
@REM -draw_mouse 1 — рисовать мышку;
@REM -i desktop — говорим ffmpeg записывать весь экран;
@REM -c:v libx264 — сжимать будем в формат MP4 кодеком x264;
@REM -r 30 — кодек запишет видео с частотой 30 кадров в секунду;
@REM -preset ultrafast — говорим кодеку, чтобы долго не раздумывал и кодировал видеопоток, как можно быстрее (при записи экрана это актуально);
@REM -tune zerolatency — опция кодека x264 для ускорения кодирования;
@REM -crf 25 — качество записываемого видео (большее значение — хуже видео, меньшее — лучше);
@REM -pix_fmt yuv420p — цветорвой формат результирующего видео.

@REM –––> You can stop recording by pressing Ctrl + C or just close the executable file.
@REM –––> Остановить запись можно нажав Ctrl+C или просто закрыть исполняемый файл.

@echo off
color a
echo.
echo Please select an option
echo.
echo !! Stop recording Ctrl+C or just close the executable file.
echo.
echo 1) mp3.
echo 2) mp4.
echo 3) mp3 + mp4.
echo 4) Get audio channel name. (Settings)

echo.
choice /c 1234
echo.

if errorlevel 4 goto audChannelName
if errorlevel 3 goto audvid
if errorlevel 2 goto video
if errorlevel 1 goto audio

@REM MP3 
@REM ----------------------------------------------------------------------------------------------------------------*
:audio
set m="Microphone sony (VIA HD Audio)"
@REM set m="Stereo mixer (VIA HD Audio)"
set a=-f dshow -i audio=%m% -acodec libmp3lame
set b="Result\audio.mp3"
set c=ffmpeg
%c% -y %a% %b%
exit

@REM MP4 
@REM ----------------------------------------------------------------------------------------------------------------*
:video
@REM set a=-rtbufsize 100M -f gdigrab -framerate 30 -probesize 10M -draw_mouse 1 -i desktop -c:v libx264 -r 30 -preset ultrafast -tune zerolatency -crf 25 -pix_fmt yuv420p

set a=-rtbufsize 100M -f gdigrab -framerate 30 -offset_x 10 -offset_y 20 -video_size 1900x1054 -show_region 0 -probesize 10M -draw_mouse 1 -i desktop -c:v libx264 -r 30 -preset ultrafast -tune zerolatency -crf 25 -pix_fmt yuv420p

set b="Result\video.mp4"
set c=ffmpeg
%c% -y %a% %b%
exit

@REM MP3 + MP4 
@REM ----------------------------------------------------------------------------------------------------------------*
:audvid
set m="Microphone sony (VIA HD Audio)"
@REM set m="Stereo mixer (VIA HD Audio)"

set a=-rtbufsize 100M -f gdigrab -framerate 30 -probesize 10M -draw_mouse 1 -i desktop -f dshow -i audio=%m% -c:v libx264 -r 30 -preset ultrafast -tune zerolatency -crf 25 -pix_fmt yuv420p

@REM If you want to constrain the area and show the capture area
@REM Adjust the viewport and switch to 0 this parameter -show_region 1
@REM When enabled, it freezes!
@REM ---------------------------------------------------------------------*
@REM Если вы хотите ограничить область и показать область захвата
@REM Настройте область просмотра и переключите на 0 этот параметр -show_region 1
@REM При включенном параметре он зависает! 
@REM set a=-rtbufsize 100M -f gdigrab -framerate 30 -offset_x 10 -offset_y 20 -video_size 1900x1054 -show_region 0 -probesize 10M -draw_mouse 1 -i desktop -f dshow -i audio=%m% -c:v libx264 -r 30 -preset ultrafast -tune zerolatency -crf 25 -pix_fmt yuv420p

set b="Result\video.mp4"
set c=ffmpeg
%c% -y %a% %b%
exit

@REM Получить имя аудио канала
@REM Get audio channel name (Settings)
@REM ----------------------------------------------------------------------------------------------------------------*
:audChannelName
@REM Один аудиоканал записывает звук с микрофона, другой с экрана.
@REM Одновременно можно записывать только один аудио канал!!
@REM Вам нужно будет скопировать имя вашего аудио канала.
@REM Имя будет в текстовом блокноте в папке Result.
@REM И вставить в этот bat файл.
@REM Заменив эту строку "Microphone sony (VIA HD Audio)" на свою..
echo -------------------------------------------------------------------------
echo.
echo  One audio channel records sound from the microphone, the other from the screen.
echo  Only one audio channel can be recorded at a time!!
echo  You will need to copy the name of your audio channel.
echo  The name will be in a text notepad in the Result folder.
echo  And insert a file into this bat.
echo  Replacing this line "Microphone sony (VIA HD Audio)" with your..
echo.
echo 1) Okey
echo.
choice /c 1
if errorlevel 1 goto start

:start
set a=-list_devices true -f dshow -i dummy
set b="Result\audio channels.txt"
set c=ffmpeg
%c% %a% 2> %b% & type %b%
start "" "Result"
exit