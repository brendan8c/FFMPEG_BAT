@REM Creates a temporary file list.tmp which contains a list of files contained in the Your_files folder
@REM Combines all files from the list into one file and converts to audio.mp3
@REM Goes into the Result folder and removes the previously created temporary list list.tmp
@REM --------------------------------------------------------------------------
@REM Создаёт временный файл list.tmp который содержит список файлов содержащихся в папке Your_files
@REM Объединяет все файлы из списка в один файл и преобразует в audio.mp3
@REM Заходит в папку Result и удаляет созданный ранее временный список list.tmp

@REM Your files must be renamed in the order in which you want to merge them!
@REM Ваши файлы должны быть переименованы в том порядке в котором вы хотите их склеить!

@echo off
color a
set a="Your_files\*.ts"
set b="Result\audio.mp3"
set c=ffmpeg
set f=-c:a libmp3lame
set tmp="Result\list.tmp"
for %%f in (%a%) do (@echo file 'file:%cd%\%%f' >> %tmp%)
%c% -y -f concat -safe 0 -i %tmp% %f% %b%
cd /d Result
del /f /q list.tmp
exit