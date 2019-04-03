@setlocal
@echo off

if "%1" == "/?" goto Usage

:: Initialize build configuration
set BUILD.ARM=N
set BUILD.ARM64=N
set BUILD.x86=N
set BUILD.x64=N

:: Export full current PATH from environment into MSYS2
set MSYS2_PATH_TYPE=inherit

:: Iterate through arguments and set the right configuration
for %%a in (%*) do (
    if /I "%%a"=="ARM" (
        set BUILD.ARM=Y
    ) else if /I "%%a"=="x86" (
        set BUILD.x86=Y
    ) else if /I "%%a"=="x64" (
        set BUILD.x64=Y
	) else if /I "%%a"=="ARM64" (
        set BUILD.ARM64=Y
    ) else (
        goto Usage
    )
)

:: Set build all architecture if none are specified
if %BUILD.ARM%==N (
    if %BUILD.x86%==N (
        if %BUILD.x64%==N (
			if %BUILD.ARM64%==N (
				set BUILD.ARM=Y
				set BUILD.x86=Y
				set BUILD.x64=Y
				set BUILD.ARM64=Y
			)
        )
    )
)

:: Verifying ffmpeg directory
echo Verifying ffmpeg directory...
pushd FFmpeg
if not exist configure (
    echo:
    echo configure is not found in ffmpeg folder. Ensure this folder is populated with ffmpeg snapshot
    goto Cleanup
)
popd

:: Check for required tools
if defined MSYS2_BIN (
    if exist %MSYS2_BIN% goto UWPx86
)

echo:
echo MSYS2 is needed. Set it up properly and provide the executable path in MSYS2_BIN environment variable. E.g.
echo:
echo     set MSYS2_BIN="E:\Development\msys64\usr\bin\bash.exe"
echo:
echo See https://trac.ffmpeg.org/wiki/CompilationGuide/WinRT#PrerequisitesandFirstTimeSetupInstructions
echo:
echo Also, make sure that VS150COMCOMNTOOLS is correctly set in your environment varialbes. E.g.
echo:
echo     VS150COMCOMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\
echo:
goto Cleanup

:UWPx86
if %BUILD.x86%==N goto UWPx64
echo Building FFmpeg for UWP architecture x86...
echo:

setlocal
call "%VS150COMCOMNTOOLS%..\..\VC\Auxiliary\Build\vcvarsall.bat" x86 store
set LIB=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\x86;%UniversalCRTSdkDir%lib\%UCRTVersion%\ucrt\x86;%UniversalCRTSdkDir%lib\%UCRTVersion%\um\x86;
set LIBPATH=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\x86;
set INCLUDE=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\include;%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\atlmfc\include;%UniversalCRTSdkDir%Include\%UCRTVersion%\ucrt;%UniversalCRTSdkDir%Include\%UCRTVersion%\um;%UniversalCRTSdkDir%Include\%UCRTVersion%\shared;%UniversalCRTSdkDir%Include\%UCRTVersion%\winrt;

%MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh x86
endlocal

:UWPx64
if %BUILD.x64%==N goto UWPARM
echo Building FFmpeg for UWP architecture x64...
echo:

setlocal
call "%VS150COMCOMNTOOLS%..\..\VC\Auxiliary\Build\vcvarsall.bat" x64 store
set LIB=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\x64;%UniversalCRTSdkDir%lib\%UCRTVersion%\ucrt\x64;%UniversalCRTSdkDir%lib\%UCRTVersion%\um\x64;
set LIBPATH=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\x64;
set INCLUDE=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\include;%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\atlmfc\include;%UniversalCRTSdkDir%Include\%UCRTVersion%\ucrt;%UniversalCRTSdkDir%Include\%UCRTVersion%\um;%UniversalCRTSdkDir%Include\%UCRTVersion%\shared;%UniversalCRTSdkDir%Include\%UCRTVersion%\winrt;

%MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh x64
endlocal

:UWPARM
if %BUILD.ARM%==N goto UWPARM64
echo Building FFmpeg for UWP architecture ARM...
echo:

setlocal
call "%VS150COMCOMNTOOLS%..\..\VC\Auxiliary\Build\vcvarsall.bat" x86_arm store
set LIB=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\arm;%UniversalCRTSdkDir%lib\%UCRTVersion%\ucrt\arm;%UniversalCRTSdkDir%lib\%UCRTVersion%\um\arm;
set LIBPATH=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\arm;
set INCLUDE=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\include;%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\atlmfc\include;%UniversalCRTSdkDir%Include\%UCRTVersion%\ucrt;%UniversalCRTSdkDir%Include\%UCRTVersion%\um;%UniversalCRTSdkDir%Include\%UCRTVersion%\shared;%UniversalCRTSdkDir%Include\%UCRTVersion%\winrt;

%MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh ARM
endlocal

:UWPARM64
if %BUILD.ARM64%==N goto Cleanup
echo Building FFmpeg for UWP architecture ARM64...
echo:

setlocal
call "%VS150COMCOMNTOOLS%..\..\VC\Auxiliary\Build\vcvarsall.bat" x86_arm64 store
set LIB=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\arm64;%UniversalCRTSdkDir%lib\%UCRTVersion%\ucrt\arm64;%UniversalCRTSdkDir%lib\%UCRTVersion%\um\arm64;
set LIBPATH=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\lib\arm64;
set INCLUDE=%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\include;%VS150COMCOMNTOOLS%..\..\VC\Tools\MSVC\%VCToolsVersion%\atlmfc\include;%UniversalCRTSdkDir%Include\%UCRTVersion%\ucrt;%UniversalCRTSdkDir%Include\%UCRTVersion%\um;%UniversalCRTSdkDir%Include\%UCRTVersion%\shared;%UniversalCRTSdkDir%Include\%UCRTVersion%\winrt;

%MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh ARM64
endlocal

goto Cleanup

:: Display help message
:Usage
echo The correct usage is:
echo:
echo     %0 [architecture]
echo:
echo where
echo:
echo [architecture]    is: x86 ^| x64 ^| ARM ^| ARM64 (optional)
echo:
echo For example:
echo     %0                  - Build for UWP ARM, x64, x86 and ARM64
echo     %0 ARM              - Build for UWP ARM only
echo     %0 x86 x64          - Build for UWP x86 and x64 only
goto :eof

:Cleanup
@endlocal