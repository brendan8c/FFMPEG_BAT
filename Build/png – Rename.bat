@REM Copy all png files from the Your_files folder to the Result folder. Rename all png files.
@REM Копируем все файлы png из папки Your_files в папку Result. Переименовываем все файлы png.

@echo off
color a
setlocal enabledelayedexpansion
set a="Your_files\*.png"
set b="Result\*.png"
xcopy "%a%" "%b%" /h /k /q /r /c /y
cd /d Result
set "count=1000"
set a="*.png"
for /f "usebackq delims=*" %%f in (`dir /b /o:-d /tc %a%`) do (ren "%%f" file-!count:~1!.png
set /a count+=1
)
exit