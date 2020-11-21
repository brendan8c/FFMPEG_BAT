<!-- :
@REM This filter will resize the output image to 320 pixels wide and automatically detect the height while maintaining the aspect ratio.
@REM Этот фильтр изменит размер выходного изображения до 320 пикселей в ширину и автоматически определит высоту, сохранив соотношение сторон.
@REM set f=-filter_complex "fps=10,scale=320:-1:flags=lanczos,split[o1][o2];[o1]palettegen[p];[o2]fifo[o3];[o3][p]paletteuse"

@REM http://ffmpeg.org/ffmpeg-filters.html#palettegen

@REM In the ffmpeg source code (libavcodec/gif.c) there are some command line flags - these are "-gifflags -offsetting", "-gifflags -transdiff" and "-gifimage". 
@REM -gifflags   set GIF flags (default 3)
@REM -offsetting enable picture offsetting
@REM -transdiff  enable transparency detection between frames
@REM https://trac.ffmpeg.org/ticket/8584 
@REM If disabled, the file size will grow!! -gifflags 0
@REM В исходном коде ffmpeg (libavcodec/gif.c) есть несколько флагов командной строки - это «-gifflags -offsetting», «-gifflags -transdiff» и «-gifimage».
@REM -gifflags   устанавливает флаги GIF (по умолчанию 3)
@REM -offsetting включить смещение изображения
@REM -transdiff  включить определение прозрачности между кадрами
@REM https://trac.ffmpeg.org/ticket/8584 
@REM Если отключить, размер файла вырастет!! -gifflags 0

@REM If it crashes, remove these lines: -gifflags -offsetting
@REM Если вылетает с ошибкой, удалите эти строки: -gifflags -offsetting

@echo off
color a
setlocal EnableDelayedExpansion
for /f "tokens=* delims=" %%p in ('mshta.exe "%~f0"') do (
    set "size=%%p"
)
echo Your time: %t%
set a="Your_files\*.mp4"
set b="Result\%%~na.gif"
set c=ffmpeg
set f=-filter_complex "[0:v] fps=10,scale=-1:%size%:flags=full_chroma_int,split [a][b];[a] palettegen=max_colors=255:reserve_transparent=1:stats_mode=diff [p];[b][p] paletteuse=dither=none:bayer_scale=5:diff_mode=rectangle:new=1:alpha_threshold=128" -gifflags -offsetting
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
start "" "Result"
exit /b
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Time of frame</title>
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
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Please enter permission.</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Введите нужно разрешение.</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">144 240 360 480 720 1080 -1</p></b>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(Select or enter your)</p>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(Выберете или введите своё)</p>
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