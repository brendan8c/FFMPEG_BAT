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

@echo off
color a
@setlocal EnableDelayedExpansion
for /f "tokens=1,2" %%d in ('mshta.exe "%~f0"') do (
    set "start=%%d"
    set "end=%%e"
)
echo Your time: %t%
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg.exe
set f=-c copy
for %%a in (%a%) do (%c% -y -ss %start% -i "%%a" -to %end% %f% %b%)
start "" "Result"

exit /b
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color filter – mp4</title>
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
        window.resizeTo(800, 350);

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
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Enter start and end times separated by a space</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Введите время начала и конца через пробел</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">hh:mm:ss.mss – 00:00:00.000 00:00:00.000</p></b>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(colons can be omitted as well as milliseconds)</p>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(двоеточия при вводе можно опустить как и миллисекунды)</p>
    <div style="text-align: center;">
        <input type='tel' name='code' style="padding-left: 10px; margin-right: 15px; background-color: #dfdfdf; border: 2px solid #3f3f3f; width: 300px; height: 30px; font-size: 25; color: #000000;" onkeypress="return entperPressed(event)" autofocus></input>
        <button style="border: 2px solid #3f3f3f; width: 65px; height: 30px; font-size: 20; color: #000000; background-color: #d4d4d4;" onclick='pipeCode()'>Okey</button>
    </div>
    <div style="margin-top: 20px;">
        <button style="border: 2px solid #3f3f3f; background-color: #464646; color: #9b9b9b;" onclick="myFunction()">Copy</button>
        <input type="text" value="github.com/brendan8c" id="myInput" style="text-decoration: none; border: none; border-radius: 0; background-color: transparent; color: #009f0d; font-size: 18px;">
    </div>
</body>

</html>