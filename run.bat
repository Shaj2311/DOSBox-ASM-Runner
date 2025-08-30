@echo off

REM Terminate if no argument passed
if "%~1"=="" (
    echo Error: No argument passed
    exit /b
)

REM Terminate if file does not exist
if not exist "%~f1" (
    echo Error: File "%~1" not found.
    exit /b
)

REM Extract file name without extension
set "fileTitle=%~n1"

REM Create temporary config (fullscreen, auto mount, auto compile and debug)
> temp.conf echo [sdl]
>> temp.conf echo fullscreen = true
>> temp.conf echo [dosbox]
>> temp.conf echo [render]
>> temp.conf echo [cpu]
>> temp.conf echo [mixer]
>> temp.conf echo [midi]
>> temp.conf echo [sblaster]
>> temp.conf echo [gus]
>> temp.conf echo [speaker]
>> temp.conf echo [joystick]
>> temp.conf echo [serial]
>> temp.conf echo [dos]
>> temp.conf echo [ipx]
>> temp.conf echo [autoexec]
>> temp.conf echo mount c C://Path/To/Your/ASM/Files
>> temp.conf echo c:
>> temp.conf echo nasm %fileTitle%.asm -o %fileTitle%.com
>> temp.conf echo afd %fileTitle%.com


REM Launch dosbox using temp.conf
C://Path/To/DOSBox.exe -conf temp.conf

REM delete temp.conf once DOSBox is launched
del temp.conf

