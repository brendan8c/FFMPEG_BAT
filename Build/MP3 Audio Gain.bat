<!-- :
@REM -map 0:a To exclude video/subtitles and only grab audio.
@REM -vn <— Is an old, legacy option. It excludes video from the default stream selection behavior. So audio, subtitles, and data are still automatically selected unless told not to with -an, -sn, or -dn.
@REM -ar <— Set the audio sampling frequency. For output streams it is set by default to the frequency of the corresponding input stream. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options.
@REM -ac <— Set the number of audio channels. For output streams it is set by default to the number of input audio channels. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options. So used here to make sure it is stereo (2 channels).
@REM -b:a 192k <— Gives us 192kbps Constant Bitrate (CBR) audio.
@REM -map_metadata 0 <— This option overrides metadata set.
@REM "volume=1.5" <— Adjust the input audio volume. Output values are clipped to the maximum value.
@REM MP3 is lossy anyway, so if you really want the highest quality, use a lossless format like FLAC.
@REM There is no point in converting mp3 to FLAC! Shit at the entrance = shit at the exit..
@REM Link URL info —> https://trac.ffmpeg.org/wiki/Encode/MP3
@REM *--------------------------------------------------------------------------------------------------------*
@REM -map 0:a <— Исключение видео субтитров и захват только аудио.
@REM -vn <— Это старый, устаревший вариант. Он исключает видео из поведения выбора потока по умолчанию. Таким образом, звук, субтитры и данные по-прежнему выбираются автоматически, если не указано не использовать -an, -snили -dn.
@REM -ar <— Установите частоту дискретизации звука. Для выходных потоков по умолчанию устанавливается частота соответствующего входного потока. Для входных потоков этот параметр имеет смысл только для устройств захвата звука и необработанных демультиплексоров и отображается на соответствующие параметры демультиплексора.
@REM -ac <— Установите количество аудиоканалов. Для выходных потоков по умолчанию установлено количество входных аудиоканалов. Для входных потоков этот параметр имеет смысл только для устройств захвата звука и необработанных демультиплексоров и отображается на соответствующие параметры демультиплексора. Используется здесь, чтобы убедиться, что это стерео (2 канала).
@REM -b:a 192k <— Дает нам звук с постоянным битрейтом (CBR) 192 кбит/с.
@REM -map_metadata 0 <— Этот параметр отменяет набор метаданных.
@REM "volume=1.5" <— Отрегулируйте громкость входящего звука. Выходные значения обрезаются до максимального значения.
@REM MP3 в любом случае работает с потерями, поэтому если вы действительно хотите получить наивысшее качество, используйте формат без потерь, такой как FLAC.
@REM Конвертировать mp3 во FLAC нет смысла! Говно на входе = говно на выходе..
@REM Link URL info —> https://trac.ffmpeg.org/wiki/Encode/MP3
@echo off
color a
setlocal EnableDelayedExpansion
for /f "tokens=* delims=" %%p in ('mshta.exe "%~f0"') do (
    set "volume=%%p"
)
echo Your time: %volume%
set a="Your_files\*.mp3"
set b="Result\%%~na.mp3"
set c=ffmpeg
set f=-filter:a "volume=%volume%" -map 0:a -ar 44100 -ac 2 -b:a 192k -map_metadata 0 -id3v2_version 3
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"

exit /b
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mp3 audio gain</title>
    <script type="text/javascript">
        function myFunction() {
            var copyText = document.getElementById("myInput");
            copyText.select();
            document.execCommand("copy");
        }
    </script>
</head>

<body style="margin: 5px; border: 3px solid green; background-color: #000000;">
    <script language='javascript'>
        window.resizeTo(800, 300);

        function entperPressed(e) {
            if (e.keyCode == 13) {
                pipeCode();
            }
        }

        function pipeCode() {
            var code = document.getElementById('code').value;
            var fso = new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
            close(fso.Write(code));

        }
    </script>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Enter the sound volume. Введите громкость звука.</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">1.5</p></b>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(1.5 will increase one and a half times. 2 to two.)</p>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(1.5 увеличит в полтора раза. 2 в два.)</p>
    <div style="text-align: center;">
        <input type='tel' name='code' style="padding-left: 10px; margin-right: 15px; background-color: #dfdfdf; border: 2px solid #3f3f3f; width: 160px; height: 30px; font-size: 25; color: #000000;" onkeypress="return entperPressed(event)" autofocus></input>
        <button style="border: 2px solid #3f3f3f; width: 65px; height: 30px; font-size: 20; color: #000000; background-color: #d4d4d4;" onclick='pipeCode()'>Okey</button>
    </div>
    <div style="margin-top: 20px;">
        <button style="border: 2px solid #3f3f3f; background-color: #464646; color: #9b9b9b;" onclick="myFunction()">Copy</button>
        <input type="text" value="github.com/brendan8c" id="myInput" style="text-decoration: none; border: none; border-radius: 0; background-color: transparent; color: #009f0d; font-size: 18px;">
    </div>
</body>

</html>