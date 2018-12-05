# ffmpeg.UWP
ffmpeg NuGet package for UWP

Visual Studio Setup
Download and install ​Microsoft Visual Studio 2017 on a Windows 10 machine.

MSYS2 Setup
Download the latest MSYS2 installer from ​http://msys2.github.io/ and follow the installation instruction closely from the installation webpage. In order for the environment from the Windows side to be inherited on the MSYS2 side, uncomment the following line from msys2_shell.cmd if it is present: replace rem set MSYS2_PATH_TYPE=inherit with set MSYS2_PATH_TYPE=inherit this will allow the environment variables for Visual Studio to be transferred to the MSYS2 environment and back.

Once base MSYS2 is successfully installed, get the latest make package by invoking the following command in your MSYS2 shell

pacman -S make
Also get the latest gcc package

pacman -S gcc
Rename or remove link.exe in the MSYS2 usr bin folder (E.g. C:\msys64\usr\bin\link.exe) to prevent conflict with MSVC link.exe

Install perl as it will be needed to run 'gas-preprocessor.pl'

pacman -S perl
Install also diffutils for configure script

pacman -S diffutils

YASM Setup
Download YASM executable from ​http://yasm.tortall.net/Download.html. You have to download the "general use" binaries and NOT the ones for VS2010. Either Win32 or Win64 binaries support outputting object files for both architectures so that should not matter. The last tested version was yasm-1.3.0-win64.exe.

Rename the downloaded executable to yasm.exe and place it in your MSYS2 path. E.g.C:\msys64\usr\bin\yasm.exe.

gas-preprocessor Setup
Download gas-preprocessor.pl Perl script from ​https://github.com/FFmpeg/gas-preprocessor

Place the downloaded Perl script in your MSYS2 path. E.g. C:\msys64\usr\bin\gas-preprocessor.pl