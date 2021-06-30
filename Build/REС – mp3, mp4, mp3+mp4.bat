@REM -f gdigrab ? Video Filters
@REM -rtbufsize 2G - Buffer size 2 gigabytes. You can also specify 2000M megabytes or 2000000K kilobytes.
@REM By default FFmpeg captures frames from the input, and then does whatever you told it to do, for instance, re-encoding them and saving them to an output file. 
@REM By default if it receives a video frame "too early" (while the previous frame isn't finished yet), it will discard that frame, so that it can keep up the the real time input. You can adjust this by setting the rtbufsize parameter, though note that if your encoding process can't keep up, eventually you'll still start losing frames just the same (and using it at all can introduce a bit of latency). It may be helpful to still specify some size of buffer, however, otherwise frames may be needlessly dropped possibly.
@REM -thread_queue_size ? This option sets the maximum number of queued packets when reading from the file or device. Setting this value can force ffmpeg to use a separate input thread and read packets as soon as they arrive. Can be applied to each input specified after it.
@REM -indexmem ? Max memory used for timestamp index (per stream).
@REM draw_mouse ? Draw mouse cursor.
@REM -i desktop - Tell ffmpeg to record the entire screen.
@REM -f dshow ? Audio filters.
@REM -c:v libx264 - We will compress to MP4 format using the x264 codec.
@REM -preset ultrafast - We tell the codec not to hesitate for a long time and encode the video stream as quickly as possible (this is relevant when recording a screen). A slower preset will provide better compression (compression is quality per filesize).
@REM preset ? configuration preset.
@REM framerate ? Set the frame rate for the video stream. It defaults to 25.
@REM -itsoffset 0.3 ? Set the input time offset.
@REM -audio_buffer_size ? Set audio device buffer size in milliseconds (which can directly impact latency, depending on the device). Default 500ms
@REM -copyts ? Do not process input timestamps, but keep their values without trying to sanitize them. In particular, do not remove the initial start time offset value.
@REM libx264 -qp 23 ? The amount of compression for each macroblock in the frame. Larger values mean higher quantization, higher compression, and lower quality. QP ranges from 0 to 51 in H.264
@REM -c:v libx264 -crf 23 ? Constant Rate Factor (CRF) is a quality setting (and rate control). values from 0 to 51, where lower values will result in better quality at the expense of higher file sizes. Higher values mean more compression, but at some point you will notice quality degradation. The default is 23.
@REM -tune zerolatency ? To change the settings depending on the specifics of your input. zerolatency - Suitable for fast encoding and low latency streaming.
@REM -r ? FPS frame rate. It takes effect after all filtering, but before encoding the video stream.
@REM ----------------------------------------------------------------------------------------------------------------*
@REM -f gdigrab ? Видео фильтры.
@REM -rtbufsize 2G ? Размер буфера 2 гигабайта. Можно указать также в мегабайтах 2000M или килобайтак 2000000K.
@REM По умолчанию FFmpeg захватывает кадры из ввода, а затем выполняет все, что вы ему сказали. Например перекодирует их и сохраняет в выходной файл.
@REM По умолчанию, если он получает видеокадр "слишком рано" (в то время как предыдущий кадр еще не закончен), он отбрасывает этот кадр, чтобы он мог поддерживать ввод в реальном времени. Вы можете отрегулировать это, установив параметр rtbufsize, хотя обратите внимание, что если ваш процесс кодирования не успевает, в конечном итоге вы все равно начнете терять кадры (и его использование вообще может вызвать небольшую задержку). Однако может быть полезно указать некоторый размер буфера, в противном случае кадры могут быть потеряны без необходимости.
@REM -thread_queue_size ? Устанавливает максимальное количество пакетов в очереди при чтении из файла или устройства. Установка этого значения может заставить ffmpeg использовать отдельный входной поток и читать пакеты, как только они приходят. Может применяется для каждого входа, указанного после него.
@REM -indexmem ? максимальная память, используемая для индекса отметки времени (на поток).
@REM draw_mouse ? Нарисовать курсор мыши.
@REM -i desktop ? Говорим ffmpeg записывать весь экран.
@REM -f dshow ? Аудио фильтр.
@REM -c:v libx264 ? Cжимать будем в формат MP4 кодеком x264.
@REM -preset ultrafast ? Говорим кодеку, чтобы долго не раздумывал и кодировал видеопоток, как можно быстрее (при записи экрана это актуально). Более медленная предустановка обеспечит лучшее сжатие (сжатие - это качество на размер файла).
@REM -itsoffset 0.3 ? Установите смещение времени ввода.
@REM framerate ? Установите частоту кадров для видеопотока. По умолчанию 25.
@REM -audio_buffer_size ? Установите размер буфера аудиоустройства в миллисекундах (что может напрямую влиять на задержку, в зависимости от устройства). По умолчанию 500ms
@REM -copyts ? Не обрабатывать временные метки ввода, но сохраняйте их значения, не пытаясь очистить их. В частности, не удаляйте начальное значение смещения времени начала.
@REM -c:v libx264 -qp 23 ? Количество сжатия для каждого макроблока в кадре. Большие значения означают, что будет более высокое квантование, большее сжатие и более низкое качество. QP варьируется от 0 до 51 в H.264
@REM -c:v libx264 -crf 23 ? Коэффициент постоянной скорости (CRF) - это настройка качества (и управления скоростью). значения от 0 до 51, где более низкие значения приведут к лучшему качеству за счет более высоких размеров файлов. Более высокие значения означают большее сжатие, но в какой-то момент вы заметите ухудшение качества. Значение по умолчанию - 23.
@REM -tune zerolatency ? для изменения настроек в зависимости от особенностей вашего ввода. zerolatency - подходит для быстрого кодирования и потоковой передачи с малой задержкой.
@REM -r ? Частота кадров FPS. Вступает в силу после всей фильтрации, но до того, как будет выполнено кодирование видеопотока.


@REM https://ffmpeg.org/ffmpeg-devices.html#toc-gdigrab
@REM https://ffmpeg.org/ffmpeg-devices.html#toc-Examples-2
@REM http://ffmpeg.org/ffmpeg-filters.html#fps
@REM https://trac.ffmpeg.org/wiki/Encode/H.264
@REM https://trac.ffmpeg.org/wiki/Capture/Desktop
@REM https://trac.ffmpeg.org/wiki/ChangingFrameRate
@REM https://slhck.info/video/2017/03/01/rate-control.html
@REM https://slhck.info/video/2017/02/24/crf-guide.html

@REM For codec
@REM https://trac.ffmpeg.org/wiki/Encode/MPEG-4

@REM For streaming
@REM https://sonnati.wordpress.com/2011/08/30/ffmpeg-%E2%80%93-the-swiss-army-knife-of-internet-streaming-%E2%80%93-part-iv
@REM https://trac.ffmpeg.org/wiki/StreamingGuide
@REM https://trac.ffmpeg.org/wiki/DirectShow
@REM https://question-it.com/questions/371917/kak-umenshit-ispolzovanie-protsessora-ffmpeg
@REM https://www.linux.org.ru/forum/general/12576191

@REM Video files store the differences of frames from each other; if the picture is static and the differences between frames are minimal, then there is nowhere to take a large size either.
@REM Record, for example, some dynamic game - and you will have a high bitrate.
@REM  Видеофайлы хранят в себе отличия кадров друг от друга; если картинка статичная и отличия между кадры минимальны, то и большому размеру взяться тоже неоткуда. 
@REM  Запишите например какую-нибудь динамичную игру ? и будет вам высокий битрейт.


@REM ???> You can stop recording by pressing Q or Ctrl + C or just close the executable file.
@REM ???> Остановить запись можно нажав Q или Ctrl+C или просто закрыть исполняемый файл.

@echo off
color a
echo.
echo Please select an option
echo.
echo !! Stop recording Q or Ctrl+C or just close the executable file.
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
echo.
echo !! Select: Screen sound or Microphone.
echo.
echo 1) Screen sound.
echo 2) Microphone.

echo.
choice /c 12
echo.

if errorlevel 2 goto amicrophone
if errorlevel 1 goto ascreensound

@REM Microphone
@REM ----------------------------------------------------------------------------------------------------------------*
:amicrophone
set m="Микрофон (High Definition Audio Device)"
set a=-f dshow -i audio=%m% -acodec libmp3lame
set b="Result\audio.mp3"
set c=ffmpeg
%c% -y %a% %b%
exit

@REM Screen sound
@REM ----------------------------------------------------------------------------------------------------------------*
:ascreensound
set m="Микрофон (High Definition Audio Device)"
set a=-f dshow -i audio=%m% -acodec libmp3lame
set b="Result\audio.mp3"
set c=ffmpeg
%c% -y %a% %b%
exit

@REM MP4 
@REM ----------------------------------------------------------------------------------------------------------------*
:video
@REM This video recording codec is a bit heavier. 
@REM Этот кодек для записи видео немного тяжелее.
@REM set a=-f gdigrab -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -c:v libx264 -pix_fmt yuv420p -b:v 50000K -r 25 -crf 23 -preset ultrafast -tune zerolatency

@REM Faster codec for video recording. 
@REM Более быстрый кодек, для записи видео.
set a=-f gdigrab -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -c:v mpeg4 -qscale:v 3 -preset ultrafast -tune zerolatency

@REM set a=-f gdigrab -offset_x 10 -offset_y 20 -video_size 1900x1054 -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -c:v libx264 -b:v 50000K -pix_fmt yuv420p -r 25 -crf 23 -preset ultrafast -tune zerolatency

set b="Result\video.mp4"
set c=ffmpeg
%c% -y %a% %b%
pause
exit

@REM MP3 + MP4 
@REM ----------------------------------------------------------------------------------------------------------------*
:audvid

echo.
echo !! Select: Screen sound or Microphone.
echo.
echo 1) Screen sound.
echo 2) Microphone.

echo.
choice /c 12
echo.

if errorlevel 2 goto microphone
if errorlevel 1 goto screensound

@REM Microphone                            
@REM ----------------------------------------------------------------------------------------------------------------*
:microphone
set m="Микрофон (High Definition Audio Device)"

@REM This video recording codec is a bit heavier. 
@REM Этот кодек для записи видео немного тяжелее.
@REM set a=-f gdigrab -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -f dshow -i audio=%m% -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -pix_fmt yuv420p -r 25 -crf 20 -preset ultrafast -tune zerolatency

@REM Faster codec for video recording. 
@REM Более быстрый кодек, для записи видео.
set a=-f gdigrab -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -f dshow -i audio=%m% -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -qscale:a 4 -c:v mpeg4 -qscale:v 3 -preset ultrafast -tune zerolatency

@REM If you want to constrain the area and show the capture area
@REM Adjust the viewport and switch to 0 this parameter -show_region 1
@REM When enabled, it freezes!
@REM ---------------------------------------------------------------------*
@REM Если вы хотите ограничить область и показать область захвата
@REM Настройте область просмотра и переключите на 0 этот параметр -show_region 1
@REM При включенном параметре он зависает! 

@REM set a=-f gdigrab -offset_x 10 -offset_y 20 -video_size 1900x1054 -show_region 1 -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -f dshow -i audio=%m% -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -pix_fmt yuv420p -r 25 -crf 20 -preset ultrafast -tune zerolatency

set b="Result\video.mp4"
set c=ffmpeg
%c% -y %a% %b%
pause
exit

@REM Screen sound
@REM ----------------------------------------------------------------------------------------------------------------*
:screensound
set m="Микрофон (High Definition Audio Device)"

@REM This video recording codec is a bit heavier. 
@REM Этот кодек для записи видео немного тяжелее.
@REM set a=-f gdigrab -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -f dshow -i audio=%m% -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -pix_fmt yuv420p -r 25 -crf 20 -preset ultrafast -tune zerolatency

@REM Faster codec for video recording. 
@REM Более быстрый кодек, для записи видео.
set a=-f gdigrab -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -f dshow -i audio=%m% -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -qscale:a 4 -c:v mpeg4 -qscale:v 3 -preset ultrafast -tune zerolatency


@REM If you want to constrain the area and show the capture area
@REM Adjust the viewport and switch to 0 this parameter -show_region 1
@REM When enabled, it freezes!
@REM ---------------------------------------------------------------------*
@REM Если вы хотите ограничить область и показать область захвата
@REM Настройте область просмотра и переключите на 0 этот параметр -show_region 1
@REM При включенном параметре он зависает! 

@REM set a=-f gdigrab -offset_x 10 -offset_y 20 -video_size 1900x1054 -show_region 1 -framerate 25 -rtbufsize 999999k -thread_queue_size 9999999 -indexmem 9999999 -draw_mouse 1 -i desktop -f dshow -i audio=%m% -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -pix_fmt yuv420p -r 25 -crf 20 -preset ultrafast -tune zerolatency

set b="Result\video.mp4"
set c=ffmpeg
%c% -y %a% %b%
pause
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



@REM Print the list of supported options in selected device
@REM Распечатайте список поддерживаемых опций на выбранном устройстве

@REM @echo off
@REM color a
@REM set a=-list_options true -f dshow -i
@REM set m="Microphone sony (VIA HD Audio)"
@REM set b="Result\audio channels.txt"
@REM set c=ffmpeg
@REM %c% %a% %m% 2> %b% & type %b%
@REM start "" "Result"
@REM exit