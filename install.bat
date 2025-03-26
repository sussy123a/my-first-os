@echo off
setlocal

:: Ask for drive letter
set /p drive="Enter the drive letter (e.g., D, E, F): "

:: Check if the input is valid
if not exist %drive%:\ (
    echo Invalid drive letter. Please check and try again.
    exit /b
)

:: Copy boot.img to the selected drive
echo Copying boot.img to %drive%:\
xcopy boot.img %drive%:\ /y

:: Run bootsect to make the drive bootable
echo Running bootsect to make %drive%: bootable...
bootsect /nt60 %drive%: /force /mbr

echo Bootable image installation complete.
pause
