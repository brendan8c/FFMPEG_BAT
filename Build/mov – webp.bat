@REM If you have any problems, try this filter.
@REM Если у вас имеются какие-то проблемы, попробуйте этот фильтр.
@REM set f=-vcodec libwebp -preset default -loop 0 -an -vsync 0

@echo off
color a
set a="Your_files\*.mov"
set b="Result\%%~na.webp"
set c=ffmpeg
set f=-vcodec libwebp -lossless 1 -q: 60 -preset default -loop 0 -an -vsync 0
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit