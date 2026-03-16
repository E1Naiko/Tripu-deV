@echo off
SET THEFILE=tp1Ej2.exe
echo Linking %THEFILE%
C:\FPC\3.2.2\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections  -s  --entry=_mainCRTStartup    -o tp1Ej2.exe link19412.res
if errorlevel 1 goto linkend
C:\FPC\3.2.2\bin\i386-win32\postw32.exe --subsystem console --input tp1Ej2.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
