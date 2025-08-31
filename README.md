# DOSBox-ASM-Runner
This repo contains a single Windows batch file that can be used to effectively run and debug single-file asm code within DOSBox.
This file, when launched, 
* Launches DOSBox
* Mounts drive to the desired location
* Assembles `.asm` file to a `.COM` file
* Opens `.COM` file in AFD

> [!NOTE]
> These instructions assume that you already have DOSBox, NASM and AFD fully set up. Make sure you have done that before proceeding

# How To Use
## Setup
1. Clone this repo to your machine
2. Place the batch file in the same location as your `.asm` files
3. Open `run.bat` in a text editor
4. Navigate to the following line:
```
>> temp.conf echo mount c C://Path/To/Your/ASM/Files
```
and replace `C://Path/To/Your/ASM/Files` with the path to the folder where you `.asm` files are placed

5. Navigate to the following line:
```
C://Path/To/DOSBox.exe -conf temp.conf
```
and replace `C://Path/To/DOSBox.exe` with the path to your DOSBox executable

The initial setup is now complete.
## Usage
1. Open a terminal window
2. Navigate to the location of your `.asm` file (`run.bat` should also be at the same location)
3. Run the following command for Command Prompt:
``` cmd
run myFile.asm
```
or the following command for PowerShell:
``` PowerShell
run .\myFile.asm
```
or the following for Bash:
``` Bash
run.bat .\myFile.asm
```
(don't forget to replace `myFile.asm` with the name of your `.asm` file)

This will open up DOSBox in fullscreen, assemble your `.asm` file into a `.COM` file and open that `.COM` file inside AFD.

## Additional Steps
### 1. Add `run.bat` to PATH
For added convenience, add `run.bat`'s location to PATH. By doing this, the batchfile can be launched from any location on your device, given that the target `.asm` file is still at the same location as the `nasm` and `afd` executables.
This means that commands like:
``` Bash
cd C://Path/To/Your/ASM/Files
run myFile.asm
```
get shortened to:
``` Bash
run C://Path/To/Your/ASM/Files/myFile.asm
```
### 2. Edit Temporary Configuration
The batchfile creates and deletes a temporary config file when executed. The following lines are written to that config file:
```> temp.conf echo [sdl]
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
>> temp.conf echo @echo off
>> temp.conf echo mount c C://Path/To/Your/ASM/Files
>> temp.conf echo c:
>> temp.conf echo del %fileTitle%.com
>> temp.conf echo nasm %fileTitle%.asm -o %fileTitle%.com
>> temp.conf echo if not errorLevel 1 afd %fileTitle%.com
>>temp.conf echo @echo on
```
If you have any custom settings in your local DOSBox config, add those lines to this section (preceded by `temp.conf echo `). That will cause `run.bat` to launch DOSBox with the same settings you are familiar with.
