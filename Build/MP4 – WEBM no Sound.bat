@echo off
color a
set a="Your_files\*.mp4"
set b="Result\file-%%03d.png"
set c=ffmpeg
set f=-vf fps=30
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
set a="Result\file-%%03d.png"
set b="Result\anim.webm"
set c=ffmpeg.exe
set f1=-framerate 30 -f image2
set f2=-c:v libvpx-vp9 -pix_fmt yuva420p
for %%a in (%a%) do (%c% -y %f1% -i "%%a" %f2% %b%)
cd /d Result
del /f /q *.png
exit