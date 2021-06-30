@REM (https://ffmpeg.org/ffmpeg-formats.html#toc-Options-8)
@REM (https://www.ffmpeg.org/ffmpeg-all.html#toc-Options-25)

@REM -c:v h264 - We will encode in the MP4 format with the h264 codec. H264 codec, can display both QuickTime and Media Player.
@REM -hls_list_size size – Set the maximum number of playlist entries. If set to 0 the list file will contain all the segments. Default value is 5.
@REM -hls_time – Set the target segment length. Default value is 2.
@REM -start_number – Set the index of the file matched by the image file pattern to start to read from. Default value is 0.
@REM -g – Set key frame placement. The GOP size sets the maximum distance between key frames; if zero the output stream will be intra-only. 
@REM The minimum distance is ignored unless it is the same as the GOP size, in which case key frames will always appear at a fixed interval. 
@REM Not set by default, so without this option the library has completely free choice about where to place key frames.
@REM crf – Set the quality/size tradeoff for constant-quality (no bitrate target) and constrained-quality (with maximum bitrate target) modes. 
@REM Valid range is 0 to 63, higher numbers indicating lower quality and smaller output size. Only used if set; by default only the bitrate target is used.
@REM -flags +cgop – Enable closed GOP.
@REM -flags -cgop – Enable open GOP.
@REM -f hls – The filter creates hls files.
@REM -hls_flags single_file – If this flag is set, the muxer will store all segments in a single MPEG-TS file, and will use byte ranges in the playlist. 
@REM HLS playlists generated with this way will have the version number 4.
@REM *--------------------------*
@REM -c:v h264 – Кодировать будем в формат MP4 кодеком h264. Кодек h264, может отображать как QuickTime, так и Media Player.
@REM -hls_list_size – Установите максимальное количество записей в плейлисте. Если установлено значение 0, файл списка будет содержать все сегменты. Значение по умолчанию - 5.
@REM -hls_time – Задайте длину целевого сегмента. Значение по умолчанию 2.
@REM -start_number – Установите индекс файла, совпадающий с шаблоном файла изображения, с которого начинается чтение. Значение по умолчанию - 0.
@REM -g – Установите размещение ключевого кадра. Размер GOP устанавливает максимальное расстояние между ключевыми кадрами; если 0, выходной поток будет только внутренним. 
@REM Минимальное расстояние игнорируется, если оно не совпадает с размером GOP, и в этом случае ключевые кадры всегда будут появляться с фиксированным интервалом. 
@REM По умолчанию не установлен параметр, поэтому без этой опции библиотека может свободно выбирать, где разместить ключевые кадры.
@REM -crf – Установите компромисс: качество / размер, для режимов постоянного качества (без целевого битрейта) и ограниченного качества (с максимальным целевым битрейтом). 
@REM Допустимый диапазон: от 0 до 63, более высокие числа указывают на более низкое качество и меньший размер вывода. 
@REM Используется только если установлено; по умолчанию используется только целевой битрейт.
@REM -flags +cgop – Включить закрытый GOP.
@REM -flags -cgop – Включить открытый GOP.
@REM -f hls – Фильтр создаёт файлы hls.
@REM -hls_flags single_file – Если этот флаг установлен, мультиплексор сохранит все сегменты в одном файле MPEG-TS и будет использовать байтовые диапазоны в списке воспроизведения. 
@REM Плейлисты HLS, созданные таким образом, будут иметь номер версии 4.


@REM -map 0 selects all streams.
@REM -map 0:v video streams only.
@REM -map 0:a audio streams only.
@REM *--------------------------*
@REM -map 0 выбирает все потоки. 
@REM -map 0:v только видеопотоки. 
@REM -map 0:a только аудиопотоки.

@echo off
color a
set a="Your_files\*.mov"
set b="Result\%%~na.m3u8"
set c=ffmpeg.exe
set f=-c:v h264 -flags +cgop -g 30 -map 0 -crf 23 -start_number 0 -hls_time 1 -hls_list_size 500000 -f hls
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit