<!-- :
@REM Assign start and end times
@REM Timestamps must be in HH:MM:SS.xxx format. .xxx you can omit this (msec).
@REM -ss looks for the start, and -t the length of the movie after the start. After the 5th sec, there will be 3 sec of tenderloin.
@REM (Not more accurate as I noticed.)
@REM *--------------------------*
@REM Назначить время начала и конца
@REM Метки времени должны быть в HH:MM:SS.xxx формате. .xxx можно опустить это (msec).
@REM -ss ищет начало, а -t длительность ролика после начала. После 5ой сек пройдёт 3 сек вырезки.
@REM (Не является более точным как я заметил.)
@REM *--------------------------*
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -y -i "%%a" -ss 00:00:00 -t 00:00:08 -c copy "Result\%%~na.mp4"

@REM Документация   Documentation
@REM https://trac.ffmpeg.org/wiki/Seeking#Cuttingsmallsections
@REM ======================================================================================================================================


@REM Trim the video from the beginning to the 8th second.
@REM -map 0 selects all streams.
@REM -map 0:v video streams only.
@REM -map 0:a audio streams only.
@REM *--------------------------*
@REM Обрежет видео с начала до 8ой секунды. 
@REM -map 0 выбирает все потоки. 
@REM -map 0:v только видеопотоки. 
@REM -map 0:a только аудиопотоки. 
@REM https://trac.ffmpeg.org/wiki/Map
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -y -to 00:00:08 -i "%%a" -map 0 -c copy "Result\%%~na.mp4"


@REM -ss looks for the beginning and -to looks for the end, the exit point.
@REM Faster search. (Works well! Looks for exactly.)
@REM -ss ищет начало, а -to ищет конец, точку выхода.
@REM Более быстрый поиск. (Хорошо работает! Ищет точно.)
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -y -ss 00:00:00 -i "%%a" -to 00:00:08 -c copy -copyts "Result\%%~na.mp4"
@REM *--------------------------------------------------------------------------------------------------------*
@REM Slower search. (Not more accurate as I noticed.)
@REM Более медленный поиск. (Не является более точным как я заметил.)
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -y -i "%%a" -ss 00:00:01 -to 00:00:08 -c copy "Result\%%~na.mp4"
@REM *--------------------------------------------------------------------------------------------------------*
@REM For short videos this will be helpful. -ss Indicates the start. -frames:v 100 is the duration of the video stream.
@REM -frames: v 100 is about 3 seconds.
@REM Для коротких видео это будет полезно. -ss Указывает на начло. -frames:v 100 это продолжительность видеопотока.
@REM -frames:v 100 это около 3 секунд.
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -y -ss 00:00:00 -i "%%a" -frames:v 250 -c copy "Result\%%~na.mp4"


@REM Trim the video from the beginning to the 8th second.
@REM Обрежет видео с начала до 8ой секунды.
@REM color a
@REM @echo off
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -y -to 00:00:08 -i "%%a" -c copy "Result\%%~na.mp4"




@REM -f gdigrab – Video Filters
@REM -rtbufsize 100M — Buffer for video. Screen recording should be fast and smooth to avoid dropping frames. Therefore, it is better to first write the video to memory (this is faster than to disk), and then ffmpeg will transfer it from memory to disk itself.
@REM -thread_queue_size – Set the maximum number of queued packets from the demuxer.
@REM indexmem – Max memory used for timestamp index (per stream).
@REM draw_mouse – Draw mouse cursor.
@REM -i desktop - Tell ffmpeg to record the entire screen.
@REM -f dshow – Audio filters.
@REM -c:v libx264 - We will compress to MP4 format using the x264 codec.
@REM -preset ultrafast - We tell the codec not to hesitate for a long time and encode the video stream as quickly as possible (this is relevant when recording a screen). A slower preset will provide better compression (compression is quality per filesize).
@REM preset – configuration preset.
@REM framerate – Set the frame rate for the video stream. It defaults to 25.
@REM -itsoffset 0.3 – Set the input time offset.
@REM -audio_buffer_size – Set audio device buffer size in milliseconds (which can directly impact latency, depending on the device). Default 500ms
@REM -copyts – Do not process input timestamps, but keep their values without trying to sanitize them. In particular, do not remove the initial start time offset value.
@REM libx264 -qp 23 – The amount of compression for each macroblock in the frame. Larger values mean higher quantization, higher compression, and lower quality. QP ranges from 0 to 51 in H.264
@REM -c:v libx264 -crf 23 – Constant Rate Factor (CRF) is a quality setting (and rate control). values from 0 to 51, where lower values will result in better quality at the expense of higher file sizes. Higher values mean more compression, but at some point you will notice quality degradation. The default is 23.
@REM -tune zerolatency – To change the settings depending on the specifics of your input. zerolatency - Suitable for fast encoding and low latency streaming.
@REM -r – FPS frame rate. It takes effect after all filtering, but before encoding the video stream.
@REM ----------------------------------------------------------------------------------------------------------------*
@REM -f gdigrab – Видео фильтры.
@REM -rtbufsize 100M — Буфер под видео. Запись с экрана должна идти бысто и гладко, чтобы не было пропусков кадров. Поэтому лучше сначала записывать видео в память (так  быстрее чем на диск), а затем ffmpeg сам перенесет из памяти на диск.
@REM -thread_queue_size – Установить максимальное количество пакетов в очереди из демультиплексора.
@REM indexmem – максимальная память, используемая для индекса отметки времени (на поток).
@REM draw_mouse – Нарисовать курсор мыши.
@REM -i desktop — Говорим ffmpeg записывать весь экран.
@REM -f dshow – Аудио фильтр.
@REM -c:v libx264 — Cжимать будем в формат MP4 кодеком x264.
@REM -preset ultrafast — Говорим кодеку, чтобы долго не раздумывал и кодировал видеопоток, как можно быстрее (при записи экрана это актуально). Более медленная предустановка обеспечит лучшее сжатие (сжатие - это качество на размер файла).
@REM -itsoffset 0.3 – Установите смещение времени ввода.
@REM framerate – Установите частоту кадров для видеопотока. По умолчанию 25.
@REM -audio_buffer_size – Установите размер буфера аудиоустройства в миллисекундах (что может напрямую влиять на задержку, в зависимости от устройства). По умолчанию 500ms
@REM -copyts – Не обрабатывать временные метки ввода, но сохраняйте их значения, не пытаясь очистить их. В частности, не удаляйте начальное значение смещения времени начала.
@REM -c:v libx264 -qp 23 – Количество сжатия для каждого макроблока в кадре. Большие значения означают, что будет более высокое квантование, большее сжатие и более низкое качество. QP варьируется от 0 до 51 в H.264
@REM -c:v libx264 -crf 23 – Коэффициент постоянной скорости (CRF) - это настройка качества (и управления скоростью). значения от 0 до 51, где более низкие значения приведут к лучшему качеству за счет более высоких размеров файлов. Более высокие значения означают большее сжатие, но в какой-то момент вы заметите ухудшение качества. Значение по умолчанию - 23.
@REM -tune zerolatency – для изменения настроек в зависимости от особенностей вашего ввода. zerolatency - подходит для быстрого кодирования и потоковой передачи с малой задержкой.
@REM -r – Частота кадров FPS. Вступает в силу после всей фильтрации, но до того, как будет выполнено кодирование видеопотока.


@REM https://trac.ffmpeg.org/wiki/Encode/H.264



@echo off
color a
echo.
echo  Please select speed for trimming your video.
echo.
@REM Медленнее - качество лучше и весит меньше.
@REM Быстрее - качество хуже и весит больше.
echo  Slower - better quality and less weight.
echo  Faster - the quality is worse and weighs more.
echo.
echo 1) Slow.
echo 2) Medium.
echo 3) Fast.
echo 4) Manual setting.

echo.
choice /c 1234
echo.

if errorlevel 4 goto Manualsetting
if errorlevel 3 goto fast
if errorlevel 2 goto medium
if errorlevel 1 goto slow

@REM Manualsetting 🔧
@REM ----------------------------------------------------------------------------------------------------------------*
:Manualsetting
echo --------------------------------*
echo   -= Manualsetting =-
echo.
echo  Time format: hh:mm:ss.ms
echo  Example:     00:05 or 00:05.1000
echo.
set /P t0=Enter start time ^>
echo --------------------------------*
echo  Example: 01:45 or 00:05.500
echo.
set /P t1=Enter end time ^>
echo --------------------------------*
echo.
@REM Пожалуста выберите – Коэффициент постоянной скорости (CRF) это настройка качества (и управления скоростью). 
@REM Значения от 0 до 51, где более низкие значения приведут к лучшему качеству за счет более высоких размеров файлов. 
@REM Более высокие значения означают большее сжатие, но в какой-то момент вы заметите ухудшение качества. Значение по умолчанию - 23.
echo  Please select - Constant Rate Factor (CRF) is a quality setting (and rate control). 
echo  Values from 0 to 51, where lower values will result in better quality at the expense of higher file sizes. 
echo  Higher values mean more compression, but at some point you will notice quality degradation. 
echo  The default is 23.
echo.
set /P crf=Enter value CRF ^>
echo --------------------------------*
echo.
echo  Please select - Frame rate (FPS).
echo  Example: 25 or 30
echo.
set /P fps=Enter value FPS ^>
echo --------------------------------*
echo.
echo  Show test list?
echo 1) Yes
echo 2) No

echo.
choice /c 12
echo.

if errorlevel 2 goto Nolist
if errorlevel 1 goto Yeslist
@REM -----------------------------------------------------*
@REM I have tested two parameters.
@REM By determining the duration of the video creation in seconds and the size of this video in megabytes.
@REM Я провёл тесты двух параметров.
@REM Определяя продолжительность создания видео в секундах и размер этого видео в мегабайтах.

@REM f=-ss %t0% -to %t1% -rtbufsize 999999k -indexmem 9999999 -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -r 25 -crf 25 -**** -****
@REM Original (video 87.9mb 25fps duration: 1.17m) from this video I cut a piece of video.
@REM start video 00:05
@REM end video   00:30

@REM Yeslist
@REM -----------------------------------------------------*
:Yeslist
echo.
echo  _____________________________________________
echo {                                             }
echo {  ultrafast + film ======== 6 Sec. 17.1 Mb   }
echo {  ultrafast + animation === 6 Sec. 13.9 Mb   }
echo {  ultrafast + grain ======= 6 Sec. 23.7 Mb   }
echo {  ultrafast + stillimage == 6 Sec. 17.1 Mb   }
echo {  ultrafast + fastdecode == 6 Sec. 17.1 Mb   }
echo {  ultrafast + zerolatency = 7 Sec. 17.1 Mb   }
echo {                                             }
echo {  superfast + film ======== 10 Sec. 13.1 Mb  }
echo {  superfast + animation === 10 Sec. 11.9 Mb  }
echo {  superfast + grain ======= 10 Sec. 16.6 Mb  }
echo {  superfast + stillimage == 10 Sec. 13.7 Mb  }
echo {  superfast + fastdecode == 10 Sec. 16.1 Mb  }
echo {  superfast + zerolatency = 10 Sec. 13.5 Mb  }
echo {                                             }
echo {  veryfast + film ========= 13 Sec. 8.98 Mb  }
echo {  veryfast + animation ==== 13 Sec. 8.16 Mb  }
echo {  veryfast + grain ======== 13 Sec. 12.7 Mb  }
echo {  veryfast + stillimage === 13 Sec. 9.66 Mb  }
echo {  veryfast + fastdecode === 12 Sec. 11.3 Mb  }
echo {  veryfast + zerolatency == 15 Sec. 12.8 Mb  }
echo {                                             }
echo {  faster + film =========== 18 Sec. 10.0 Mb  }
echo {  faster + animation ====== 20 Sec. 8.96 Mb  }
echo {  faster + grain ========== 19 Sec. 11.8 Mb  }
echo {  faster + stillimage ===== 19 Sec. 11.3 Mb  }
echo {  faster + fastdecode ===== 19 Sec. 12.4 Mb  }
echo {  faster + zerolatency ==== 21 Sec. 13.2 Mb  }
echo {                                             }
echo {  medium + film =========== 32 Sec. 10.1 Mb  }
echo {  medium + animation ====== 39 Sec. 8.71 Mb  }
echo {  medium + grain ========== 33 Sec. 11.6 Mb  }
echo {  medium + stillimage ===== 33 Sec. 11.9 Mb  }
echo {  medium + fastdecode ===== 28 Sec. 12.2 Mb  }
echo {  medium + zerolatency ==== 41 Sec. 13.1 Mb  }
echo {_____________________________________________}
echo.
echo 1) Okay

echo.
choice /c 1
echo.

if errorlevel 1 goto Nolist

@REM Nolist
@REM -----------------------------------------------------*
:Nolist
echo.
echo  Please select an option
echo.
echo  A (-preset) is a collection of options that will provide a certain encoding speed to compression ratio.
echo  A slower preset will provide better compression (compression is quality per filesize).
echo.
@REM echo  You can optionally use (-tune) to change settings based upon the specifics of your input. Current tunings include:
@REM echo.
@REM echo  film – use for high quality movie content; lowers deblocking
@REM echo  animation – good for cartoons; uses higher deblocking and more reference frames
@REM echo  grain – preserves the grain structure in old, grainy film material
@REM echo  stillimage – good for slideshow-like content
@REM echo  fastdecode – allows faster decoding by disabling certain filters
@REM echo  zerolatency – good for fast encoding and low-latency streaming
@REM echo  psnr – ignore this as it is only used for codec development
@REM echo  ssim – ignore this as it is only used for codec development
@REM echo.
echo 1) -preset ultrafast
echo 2) -preset superfast
echo 3) -preset veryfast
echo 4) -preset faster
echo 5) -preset medium

echo.
choice /c 12345
echo.

if errorlevel 5 goto medium
if errorlevel 4 goto faster
if errorlevel 3 goto veryfast
if errorlevel 2 goto superfast
if errorlevel 1 goto ultrafast

:ultrafast
set preset=ultrafast
if ultrafast==ultrafast goto next
:superfast
set preset=superfast
if superfast==superfast goto next
:veryfast
set preset=veryfast
if veryfast==veryfast goto next
:faster
set preset=faster
if faster==faster goto next
:medium
set preset=medium
if medium==medium goto next
@REM -----------------------------------------------------*
:next
echo --------------------------------*
echo.
echo  Please select an option
echo.
echo  You can optionally use (-tune) to change settings based upon the specifics of your input.
echo  Current tunings include:
echo.
echo  film -- use for high quality movie content; lowers deblocking
echo  animation -- good for cartoons; uses higher deblocking and more reference frames
echo  grain -- preserves the grain structure in old, grainy film material
echo  stillimage -- good for slideshow-like content
echo  fastdecode -- allows faster decoding by disabling certain filters
echo  zerolatency -- good for fast encoding and low-latency streaming
echo  psnr -- ignore this as it is only used for codec development
echo  ssim -- ignore this as it is only used for codec development
echo.
echo 1) -tune film
echo 2) -tune animation
echo 3) -tune grain
echo 4) -tune stillimage
echo 5) -tune fastdecode
echo 6) -tune zerolatency

echo.
choice /c 123456
echo.

if errorlevel 6 goto zerolatency
if errorlevel 5 goto fastdecode
if errorlevel 4 goto stillimage
if errorlevel 3 goto grain
if errorlevel 2 goto animation
if errorlevel 1 goto film

:zerolatency
set tune=zerolatency
if zerolatency==zerolatency goto nextt
:fastdecode
set tune=fastdecode
if fastdecode==fastdecode goto nextt
:stillimage
set tune=stillimage
if stillimage==stillimage goto nextt
:grain
set tune=grain
if grain==grain goto nextt
:animation
set tune=animation
if animation==animation goto nextt
:film
set tune=film
if film==film goto nextt
@REM -----------------------------------------------------*
:nextt

set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-ss %t0% -to %t1% -rtbufsize 999999k -indexmem 9999999 -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -r %fps% -crf %crf% -preset %preset% -tune %tune%
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit

@REM fast
@REM ----------------------------------------------------------------------------------------------------------------*
:fast
echo --------------------------------*
echo       -= Fast =-
echo.
echo  Time format: hh:mm:ss.ms
echo  Example:     00:05 or 00:05.1000
echo.
set /P t0=Enter start time ^>
echo --------------------------------*
echo  Example: 01:45 or 00:05.500
echo.
set /P t1=Enter end time ^>
echo --------------------------------*
echo.
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-ss %t0% -to %t1% -rtbufsize 999999k -indexmem 9999999 -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -r 30 -crf 25 -preset ultrafast -tune animation
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit

@REM medium
@REM ----------------------------------------------------------------------------------------------------------------*
:medium
echo --------------------------------*
echo       -= Medium =-
echo.
echo  Time format: hh:mm:ss.ms
echo  Example:     00:05 or 00:05.1000
echo.
set /P t0=Enter start time ^>
echo --------------------------------*
echo  Example: 01:45 or 00:05.500
echo.
set /P t1=Enter end time ^>
echo --------------------------------*
echo.
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-ss %t0% -to %t1% -rtbufsize 999999k -indexmem 9999999 -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -r 30 -crf 20 -preset superfast -tune film
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit

@REM slow
@REM ----------------------------------------------------------------------------------------------------------------*
:slow
echo --------------------------------*
echo       -= Slow =-
echo.
echo  Time format: hh:mm:ss.ms
echo  Example:     00:05 or 00:05.1000
echo.
set /P t0=Enter start time ^>
echo --------------------------------*
echo  Example: 01:45 or 00:05.500
echo.
set /P t1=Enter end time ^>
echo --------------------------------*
echo.
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg
set f=-ss %t0% -to %t1% -rtbufsize 999999k -indexmem 9999999 -b:a 192k -audio_buffer_size 1000 -acodec libmp3lame -c:v libx264 -r 30 -crf 18 -preset veryfast -tune film
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit