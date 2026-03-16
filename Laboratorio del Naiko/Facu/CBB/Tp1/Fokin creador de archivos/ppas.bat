@echo off
SET THEFILE=FokinCreadorDeFokinArchivos.exe
echo Linking %THEFILE%
C:\FPC\3.2.2\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections  -s  --entry=_mainCRTStartup    -o FokinCreadorDeFokinArchivos.exe link20380.res
if errorlevel 1 goto linkend
C:\FPC\3.2.2\bin\i386-win32\postw32.exe --subsystem console --input FokinCreadorDeFokinArchivos.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
