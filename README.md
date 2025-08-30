# DOSBox-ASM-Runner
This repo contains a single Windows batch file that can be used to effectively run and debug single-file asm code within DOSBox.
This file, when launched, 
* Launches DOSBox
* Mounts it to the desired location
* Assembles `.asm` file to a `.COM` file
* Opens `.COM` file in AFD

> [!NOTE]
> These instructions assume that you already have DOSBox, NASM and AFD fully set up. Make sure you have done that before proceeding

# How To Use
## Setup
1. Clone this repo to your machine
2. Place the batch file in the same location as your `.asm` files
3. Open run.bat in a text editor
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
1. Open a terminal window and navigate to the location of your `.asm` file (the run.bat file should also be at the same location)
2. Run the following command for Command Prompt:
``` cmd
run.bat myFile.asm
```
or the following command for Bash or PowerShell:
``` Bash
.\run.bat .\myFile.asm
```
(don't forget to replace myFile.asm with the name of your asm file)

This will open up DOSBox in fullscreen, assemble your `.asm` file into a `.COM` file and open that `.COM` file inside AFD.

## Optional Step
For added convenience, add the `run.bat`'s location to PATH. By doing this, the terminal command gets shortened to:
``` cmd
run my File.asm
```
for command prompt, and
``` PowerShell
run .\myFile.asm
```
for PowerShell. 