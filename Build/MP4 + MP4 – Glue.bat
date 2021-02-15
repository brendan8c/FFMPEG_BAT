::https://github.com/brendan8c/FFMPEG_BAT

@REM -qscale:a 4 ? Sound quality level.
@REM -qscale:v 3 ? Video quality level. The range is from 1 to 31, where 1 is the highest quality - largest file size and 31 is the lowest quality - smallest file size.
@REM  ----------------------------------------------------------------------------------------------------------------*
@REM -qscale:a 4 ? �஢��� ����⢠ ��㪠.
@REM -qscale:v 3 ? �஢��� ����⢠ �����. �������� �� 1 �� 31, ��� 1 - ᠬ�� ��᮪�� ����⢮ - ᠬ� ����让 ࠧ��� 䠩��, � 31 - ᠬ�� ������ ����⢮ - ᠬ� �����쪨� ࠧ���.

@REM codec 
@REM https://trac.ffmpeg.org/wiki/Encode/MPEG-4

@echo off
color a
@REM This bat file is saved in CP 866 encoding. In VSCode.
@REM ��� bat 䠩� ��࠭� � ����஢�� CP 866. � VSCode.
@REM chcp 866 > nul
@REM chcp 1251 > nul
@REM chcp 65001 > nul   
echo --------------------------------------------------------------------------------
echo.
echo                       Choose language (�롥�� ��)
echo.
echo                               [1] ENG [2] RUS
echo.
choice /c 12
echo.
echo --------------------------------------------------------------------------------
if %errorlevel% == 2 goto RUS
if %errorlevel% == 1 goto ENG

@REM RUS
echo --------------------------------------------------------------------------------
:RUS
set lang=RUS
echo �ਢ�� %username%
echo.
echo  ��� ����� ������ ���� ��२�������� � 1.mp4 2.mp4 3.mp4 � �.�.
echo.
echo  ������ �� � ������ 1!
echo.
choice /c 1
echo.
if errorlevel 1 goto next

@REM ENG
echo --------------------------------------------------------------------------------
:ENG
set lang=ENG
echo Hello %username%
echo.
echo  Your videos must be rename in 1.mp4 2.mp4 3.mp4 etc..
echo.
echo  Do it and press 1!
echo.
choice /c 1
echo.
if errorlevel 1 goto next

@REM next
@REM echo --------------------------------------------------------------------------------
:next
set a="Your_files\*.mp4"
set b="Result\video.mp4"
set c=ffmpeg
set f=-c:v mpeg4 -qscale:v 3 -c:a libmp3lame -qscale:a 4
set tmp="Result\list.tmp"
for %%f in (%a%) do (@echo file 'file:%cd%\%%f' >> %tmp%)
%c% -y -f concat -safe 0 -i %tmp% %f% %b%
cd /d Result
del /f /q list.tmp
exit