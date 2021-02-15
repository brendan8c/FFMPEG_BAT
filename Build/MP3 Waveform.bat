@REM https://trac.ffmpeg.org/wiki/Waveform

@REM The background color is solid red. The color of the waveform is transparent.
@REM Цвет фона - сплошной красный. Цвет формы волны - прозрачный.
@REM set f=-filter_complex "[0:a]aformat=channel_layouts=mono,compand=gain=-6,showwavespic=s=600x120:colors=white,negate[a];color=red:600x120[c];[c][a]alphamerge" -vframes 1

@REM The background color is solid red. The color of the waveform is black.
@REM Цвет фона - сплошной красный. Цвет формы волны - чёрный.
@REM set f=-f lavfi -i color=s=600x120:c=red -filter_complex "[0:a]showwavespic=s=600x120:colors=#000000[fg];[1:v][fg]overlay=format=rgb" -frames:v 1

@REM The background color is black. The color of the waveform is white.
@REM Цвет фона - чёрный. Цвет формы волны - белый.
@REM set f=-f lavfi -i color=s=600x120:c=black -filter_complex "[0:a]showwavespic=s=600x120:colors=#ffffff[fg];[1:v][fg]overlay=format=rgb" -frames:v 1



@echo off
color a
set a="Your_files\*.mp3"
set b="Result\%%~na.png"
set c=ffmpeg
set f=-filter_complex "compand,aformat=channel_layouts=mono,showwavespic=s=1280x90:colors=#000000" -frames:v 1
for %%a in (%a%) do (%c% -y -i "%%a" %f% %b%)
exit