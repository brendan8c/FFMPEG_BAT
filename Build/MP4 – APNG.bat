@REM To adjust the frames per second use fps=n where -n is the number of frames per second. Filter example:
@REM Чтобы настроить частоту кадров в секунду используйте fps=n где -n колличество кадров в секунду. Пример фильтра:
@REM set f=-vf fps=1

@REM To Speed up animation 2x use this filter
@REM Чтобы Ускорить анимацию в 2 раза используйте этот фильтр
@REM set f=-filter:v "setpts=0.5*PTS"

@REM To Slow down animation by 2x use this filter
@REM Чтобы Замедлить анимацию в 2 раза используйте этот фильтр
@REM set f=-filter:v "setpts=2.0*PTS"

@REM To speed up animation by 2x. With a specific frame rate -r 16 use this filter
@REM Чтобы ускорить анимацию в 2 раза. С определённой частотой кадров в секунду -r 16 используйте этот фильтр
@REM set f=-r 16 -filter:v "setpts=0.25*PTS"

@REM To smooth out slow / fast video use this filter
@REM Чтобы сгладить медленное / быстрое видео используйте этот фильтр
@REM set f=-r 10 -filter "minterpolate='mi_mode=mci:mc_mode=aobmc:vsbmc=1:fps=120'"

@REM Assign start and end times
@REM Timestamps must be in HH:MM:SS.xxx format. .xxx you can omit this (msec).
@REM -ss looks for the start, and -t the length of the movie after the start. After the 5th sec, there will be 3 sec of tenderloin.
@REM Назначить время начала и конца
@REM Метки времени должны быть в HH:MM:SS.xxx формате. .xxx можно опустить это (msec).
@REM -ss ищет начало, а -t длительность ролика после начала. После 5ой сек пройдёт 3 сек вырезки.
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -i "%%a" -ss 00:00:05 -t 00:00:03 -c copy "Result\%%~na.apng"

@REM -ss looks for the beginning and -to looks for the end, the exit point.
@REM -ss ищет начало, а -to ищет конец, точку выхода.
@REM Faster search
@REM Более быстрый поиск
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -ss 00:00:02 -i "%%a" -to 00:00:05 -c copy -copyts "Result\%%~na.apng"
@REM Slower search
@REM Более медленный поиск
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -i "%%a" -ss 00:00:02 -to 00:00:05 -c copy "Result\%%~na.apng"
@REM For short videos this will be helpful. -ss Indicates the start. -frames:v 100 is the duration of the video stream.
@REM Для коротких видео это будет полезно. -ss Указывает на начло. -frames:v 100 это продолжительность видеопотока.
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -ss 00:00:02 -i "%%a" -frames:v 100 -c copy "Result\%%~na.apng"

@REM Trim the video from the beginning to the 8th second.
@REM Обрежет видео с начала до 8ой секунды.
@REM for %%a in ("Your_files\*.mp4") do ffmpeg -to 00:00:08 -i "%%a" -c copy "Result\%%~na.apng"

@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.apng"
set c=ffmpeg
set f=
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit