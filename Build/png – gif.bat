@REM In the Your_files folder put png files with a similar naming file-001.png file-002.png file-003.png...
@REM fps=10 frames per second
@REM *--------------------------------------------------------------------------------------------------------*
@REM В папку Your_files положите png файлы с подобным именованием file-001.png file-002.png file-003.png...
@REM fps=10 количество кадров в секунду

@echo off
color a
set a="Your_files\file-%%03d.png"
set b="Result\anim.gif"
set c=ffmpeg
set f=-filter_complex "[0:v] fps=30,scale=-1:-1:flags=full_chroma_int,split [a][b];[a] palettegen=max_colors=255:reserve_transparent=1:stats_mode=diff [p];[b][p] paletteuse=dither=none:bayer_scale=5:diff_mode=rectangle:new=1:alpha_threshold=128" -gifflags -offsetting
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit