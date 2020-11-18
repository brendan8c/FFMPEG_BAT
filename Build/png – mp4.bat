@REM In the Your_files folder put png files with a similar naming file-001.png file-002.png file-003.png...
@REM В папку Your_files положите png файлы с подобным именованием file-001.png file-002.png file-003.png...
@REM -r 3 Number of frames per second.
@REM -r 3 Количество кадров в секунду.

@echo off
color a
set a="Your_files\file-%%03d.png"
set b="Result\video.mp4"
set c=ffmpeg
set f=-f image2 -r 30
for %%a in (%a%) do (%c% -y %f% -i "%%a" %b%)
exit