@REM colorbalance=rs=.3 – Add red color cast to shadows.
@REM *--------------------------------------------------------------------------------------------------------*
@REM colorbalance=rs=.3 – Добавьте красный оттенок теням.

@REM Link URL info —> http://ffmpeg.org/ffmpeg-all.html#toc-Examples-84

@REM @echo off
@REM color a
@REM set a="Your_files\*.mp4"
@REM set b="Result\%%~na.mp4"
@REM set c=ffmpeg
@REM set f=-vf colorbalance=rs=.3
@REM for %%a in (%a%) do (%c% -i "%%a" %f% %b%)
@REM pause
@REM exit
@REM *--------------------------------------------------------------------------------------------------------*


<!-- :
@echo off
setlocal EnableDelayedExpansion
color a
for /f "tokens=1,2" %%d in ('mshta.exe "%~f0"') do (
    set "color=%%d"
    set "opacity=%%e"
)
echo Your time: %t%
set a="Your_files\*.mp4"
set b="Result\%%~na.mp4"
set c=ffmpeg.exe
set f=-f lavfi -i "color=color=%color%:s=1280x720" -filter_complex "blend=shortest=1:all_mode=overlay:all_opacity=%opacity%"
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
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
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Enter color in HEX format. Введите цвет в формате HEX</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">#ffffff 0.5</p></b>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(Specify transparency through a space. from 0.0 to 1.0)</p>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(Через пробел укажите прозрачность. от 0.0 до 1.0)</p>
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