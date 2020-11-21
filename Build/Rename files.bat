<!-- :

@echo off
color a
setlocal EnableDelayedExpansion
for /f "tokens=1,2" %%d in ('mshta.exe "%~f0"') do (
    set "name=%%d"
    set "format=%%e"
)
echo Your file name: %name% %format%
set a="Your_files\*"
set b="Result\*"
xcopy "%a%" "%b%" /h /k /q /r /c /y
cd /d Result
set "count=1000"
set a="*"
for /f "usebackq delims=*" %%f in (`dir /b /o:-d /tc %a%`) do (ren "%%f" %name%!count:~1!.%format%
set /a count+=1
)
cd /d ..
start "" "Result"

exit /b
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rename files</title>
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
        window.resizeTo(900, 350);

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
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Enter the file name in English, separated by a space, the file format.</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">Введите название файла по английски, через пробел формат файла.</p></b>
    <b><p style="font-size: 22; color: #00ff15; font-family: consolas; text-align: center;">name jpg</p></b>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(Output files will be numbered name001.jpg)</p>
    <p style="font-size: 18; color: #00ff15; font-family: consolas, sans-serif; text-align: center;">(Выходные файлы будет пронумерованы name001.jpg)</p>
    <div style="text-align: center;">
        <input type='tel' name='code' style="padding-left: 10px; margin-right: 15px; background-color: #dfdfdf; border: 2px solid #3f3f3f; width: 300px; height: 35px; font-size: 25; color: #000000;" onkeypress="return entperPressed(event)" autofocus></input>
        <button style="border: 2px solid #3f3f3f; width: 65px; height: 30px; font-size: 20; color: #000000; background-color: #d4d4d4;" onclick='pipeCode()'>Okey</button>
    </div>
    <div style="margin-top: 20px;">
        <button style="border: 2px solid #3f3f3f; background-color: #464646; color: #9b9b9b;" onclick="myFunction()">Copy</button>
        <input type="text" value="github.com/brendan8c" id="myInput" style="text-decoration: none; border: none; border-radius: 0; background-color: transparent; color: #009f0d; font-size: 18px;">
    </div>
</body>

</html>