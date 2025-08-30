# DOSBox-ASM-Runner
This repo contains a single batch file that can be used to effectively run and debug single-file asm code within DOSBox.

# How To Use
1. Clone this repo to your machine
2. Place the batch file in the same location as your .asm files
3. Open a Windows terminal (Command Prompt or Powershell) and navigate to that location
4. Run the following command for Command Prompt:
``` cmd
run.bat myFile.asm
```
or the following command for PowerShell:
``` PowerShell
./run.bat ./myFile.asm
```
(don't forget to replace myFile.asm with the name of your asm file)

This will open up DOSBox in fullscreen, compile your .asm file into a .COM file and open that .COM file inside AFD.
