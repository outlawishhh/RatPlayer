@echo off
echo GIF to Rainmeter Frames Extractor (RatPlayer Edition)
echo ===================================================
echo.

REM Check if ffmpeg is available
where ffmpeg >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: ffmpeg not found in PATH.
    echo Please install ffmpeg and make sure it's in your system PATH.
    echo Download from: https://ffmpeg.org/download.html
    pause
    exit /b
)

REM Get the directory of this batch file (@Resources)
set "RESOURCE_DIR=%~dp0"
set "FRAMES_DIR=%RESOURCE_DIR%Images\frames"

REM Create frames directory if it doesn't exist
if not exist "%FRAMES_DIR%" mkdir "%FRAMES_DIR%"

REM Clean previous frames
del "%FRAMES_DIR%\frame*.png" 2>nul

echo Extracting frames from input.gif...
echo This may take a moment...

REM Extract frames from GIF into the Images\frames subdirectory
ffmpeg -i "%RESOURCE_DIR%input.gif" "%FRAMES_DIR%\frame%%d.png" -y

REM Count the number of frames extracted
set /a count=0
for %%f in ("%FRAMES_DIR%\frame*.png") do set /a count+=1

echo.
echo Extraction complete! Found %count% frames.
echo.
echo IMPORTANT: Update the FrameCount value in RatPlayer.ini to %count%
echo.
pause
