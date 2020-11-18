@REM In the Your_files folder put jpg files with a similar naming out-001.jpg out-002.jpg out-003.jpg ...
@REM В папку Your_files положите jpg файлы с подобным именованием out-001.jpg out-002.jpg out-003.jpg ...
@REM -r 5 Number of frames per second.
@REM -r 5 Количество кадров в секунду.

@echo off
color a
set a="Your_files\file-%%03d.jpg"
set b="Result\video.mp4"
set c=ffmpeg
set f=-f image2 -r 30
for %%a in (%a%) do (%c% -y %f% -i "%%a" %b%)
exit