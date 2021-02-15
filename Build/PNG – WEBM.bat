@echo off
color a
set a="Your_files\file-%%03d.png"
set b="Result\anim.webm"
set c=ffmpeg.exe
set f1=-framerate 30 -f image2
set f2=-c:v libvpx-vp9 -pix_fmt yuva420p
for %%a in (%a%) do (%c% -y %f1% -i "%%a" %f2% %b%)
exit