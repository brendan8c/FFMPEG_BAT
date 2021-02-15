<!-- :
@REM "setpts=PTS/2.0" <— Video speed
@REM "atempo=1.5" <— Sound speed
@REM *--------------------------------------*
@REM "setpts=PTS/2.0" <— Скорость видео
@REM "atempo=1.5" <— Скорость звука
@REM Link URL info —> https://trac.ffmpeg.org/wiki/How%20to%20speed%20up%20/%20slow%20down%20a%20video
@echo off
color a
setlocal EnableDelayedExpansion
for /f "tokens=* delims=" %%p in ('mshta.exe "%~f0"') do (
    set "s=%%p"
)
echo Your time: %t%
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg.exe
set f=-filter:v "setpts=PTS/%s%" -filter:a "atempo=%s%" -map_metadata 0
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"

exit /b
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mp4 speedup X2</title>
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
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Enter video speed. Введите скорость для видео</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">2.0</p></b>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(For example, speed x2 is 2.0)</p>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(Например скорость х2 это значение 2.0)</p>
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