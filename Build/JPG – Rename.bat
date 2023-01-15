@REM Copy all jpg files from the Your_files folder to the Result folder. Rename all jpg files.
@REM Копируем все файлы jpg из папки Your_files в папку Result. Переименовываем все файлы jpg.

@echo off
color a
setlocal enabledelayedexpansion
set a="Your_files\*.jpg"
set b="Result\*.jpg"
xcopy "%a%" "%b%" /h /k /q /r /c /y
cd /d Result
set "count=1000"
set a="*.jpg"
for /f "usebackq delims=*" %%f in (`dir /b /o:-d %a%`) do (ren "%%f" file-!count:~1!.jpg
set /a count+=1
)
exit