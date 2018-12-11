# FFmpeg for UWP (Universal Windows Platform)

#### You can install the NuGet Package (FFmpeg UWP 4.1) from [here](https://www.nuget.org/packages/FFmpeg.UWP/4.1.0 "here").
#### You can download the latest compiled libraries (FFmpeg UWP 4.1) from [here](https://github.com/ionutdanila/ffmpeg.UWP/releases "here").

---
## Scope of this project
- Build FFmpeg libraries for UWP (x86, x64, ARM and ARM64) in order to port applications to UWP
- The resulted libraries can be used with the [FFmpegInterop Project](https://github.com/ionutdanila/FFmpegInterop "FFmpegInterop Project") or any other application that requires FFmpeg libraries to run on UWP (usually C++/CX projects)

## Disclaimer
The original compilation guide for WinRT/UWP can be found on [FFmpeg website](https://trac.ffmpeg.org/wiki/CompilationGuide/WinRT "ffmpeg website"). I extended the instructions from the original [Microsoft FFmpegInterop](https://github.com/Microsoft/FFmpegInterop/blob/master/README.md "Microsoft FFmpegInterop") project. This project builds libraries only for Windows 10 (UWP) using Visual Studio 2017 (this way we can also build for ARM64).

## License
- [FFmpeg](https://github.com/FFmpeg/FFmpeg "FFmpeg") offers the code under [GNU Lesser General Public License version 2.1 or later (LGPL v2.1+)](https://github.com/FFmpeg/FFmpeg/blob/master/LICENSE.md "LGPL 2.1")
- [gas-preprocessor.pl](https://github.com/ionutdanila/ffmpeg.UWP/blob/master/Dependencies/gas-preprocessor.pl "gas-preprocessor.pl") is licensed under [GNU Lesser General Public License version 2.1 or later (LGPL v2.1+)](https://github.com/ionutdanila/ffmpeg.UWP/blob/master/Dependencies/gas-preprocessor.pl)

## Prerequisites
#### FFmpeg source code
The project uses an [embedded git submodule](git://github.com/FFmpeg/FFmpeg.git "embedded git submodule") that points to the latest tested release of FFmpeg.

---
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

## Compilation
Invoke `BuildFFmpeg.bat` script without any parameters to build the libraries on all available architectures (x86, x64, ARM, ARM64). Also, you can invoke the script with parameters:
```
    BuildFFmpeg.bat				- Build for UWP ARM, x64, x86 and ARM64
    BuildFFmpeg.bat ARM64			- Build for UWP ARM64 only
    BuildFFmpeg.bat x86 x64			- Build for UWP x86 and x64 only
```
