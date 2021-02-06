@REM -map 0:a <— To exclude video/subtitles and only grab audio.
@REM -ac 2 <— Set the number of audio channels. For output streams it is set by default to the number of input audio channels. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options. So used here to make sure it is stereo (2 channels).
@REM -b:a 192k <— Gives us 192kbps Constant Bitrate (CBR) audio.
@REM -c:a mp3 <— Recode to mp3 format.
@REM -ar 44100 <— Set the audio sampling frequency. For output streams it is set by default to the frequency of the corresponding input stream. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options.
@REM -map_metadata 0 <— This option overrides metadata set.
@REM *----------------------------------------------------------------------------------------------------------------------------------*
@REM -map 0:a <— Исключение видео субтитров и захват только аудио.
@REM -ac 2 <— Установите количество аудиоканалов. Для выходных потоков по умолчанию установлено количество входных аудиоканалов. Для входных потоков этот параметр имеет смысл только для устройств захвата звука и необработанных демультиплексоров и отображается на соответствующие параметры демультиплексора. Используется здесь, чтобы убедиться, что это стерео (2 канала).
@REM -b:a 192k <— Дает нам звук с постоянным битрейтом (CBR) 192 кбит/с.
@REM -c:a mp3 <— Перекодировать в формат mp3.
@REM -ar 44100 <— Установите частоту дискретизации звука. Для выходных потоков по умолчанию устанавливается частота соответствующего входного потока. Для входных потоков этот параметр имеет смысл только для устройств захвата звука и необработанных демультиплексоров и отображается на соответствующие параметры демультиплексора.
@REM -map_metadata 0 <— Этот параметр отменяет набор метаданных.
@REM *----------------------------------------------------------------------------------------------------------------------------------*
@REM Audio coding formats support.
@REM Поддержка форматов кодирования аудио.
@REM Link URL info —> https://en.wikipedia.org/wiki/Comparison_of_video_container_formats#Audio_coding_formats_support

@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.mp3"
set c=ffmpeg
@REM set f=-map 0:a -ar 44100 -ac 2 -c:a mp3 -b:a 192K -map_metadata 0
set f=-map 0:a -ar 44100 -c:a libmp3lame -qscale:a 1 -map_metadata 0
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit
