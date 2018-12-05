# ffmpeg.UWP
##### Build ffmpeg libraries for UWP (x86, x64, ARM and ARM64)
##### The resulted libraries can be used with [FFmpegInterop Project](https://github.com/Microsoft/FFmpegInterop "FFmpegInterop Project") 

## Prerequisites

#### Visual Studio Setup
Download and install [Microsoft Visual Studio 2017](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=15 "Microsoft Visual Studio 2017") on a Windows 10 machine.

---
#### MSYS2 Setup
- Download the latest [MSYS2 installer](http://msys2.github.io/ "MSYS2 installer") on a directory on your PC (eg.: C:\msys64\) and follow the installation instruction closely from the installation webpage. 
- From **msys2_shell.cmd**, replace **rem set MSYS2_PATH_TYPE=inherit** with **set MSYS2_PATH_TYPE=inherit**. This will allow the environment variables for Visual Studio to be transferred to the MSYS2 environment and back.
- Once base MSYS2 is successfully installed, get the latest make package by invoking the following command in your MSYS2 shell: `pacman -S make`
- Also get the latest gcc package: `pacman -S gcc`
- Rename or remove link.exe in the MSYS2 usr bin folder (eg.: C:\msys64\usr\bin\link.exe) to prevent conflict with MSVC link.exe
- Install perl as it will be needed to run gas-preprocessor.pl: `pacman -S perl`
- Install also diffutils for configure script: `pacman -S diffutils`

--- 
#### YASM Setup
- Download [YASM executable](http://yasm.tortall.net/Download.html "YASM executable"). You have to download the "general use" binaries and NOT the ones for VS2010. Either Win32 or Win64 binaries support outputting object files for both architectures so that should not matter. The last tested version was yasm-1.3.0-win64.exe.
- Rename the downloaded executable to yasm.exe and place it in your MSYS2 path.

--- 
#### gas-preprocessor Setup
Download [gas-preprocessor.pl](https://github.com/ionutdanila/ffmpeg.UWP/blob/master/Dependencies/gas-preprocessor.pl "gas-preprocessor.pl") Perl script and place it in your MSYS2 path (eg.: C:\msys64\usr\bin\gas-preprocessor.pl)