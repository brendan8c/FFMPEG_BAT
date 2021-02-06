@echo off
color a
set a="Your_files\*.mp4"
set b="Result\%%~na.avi"
set c=ffmpeg
set f=-f image2 -framerate 25 -pattern_type sequence -start_number 1234 -r 3
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit

ffmpeg.exe -f image2 -framerate 25 -pattern_type sequence -start_number 1234 -r 3 -i Imgp%04d.jpg -s 720x480 test.avi