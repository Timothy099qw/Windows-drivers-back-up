@echo off
echo Auth Tim. Driver backup for Windows...

:: Prompt user to select the flash drive
set /p "flashDrive=Enter the drive letter of the flash drive (e.g., E): "

:: Validate the input
if not exist "%flashDrive%:\" (
    echo Invalid drive letter. Make sure the flash drive is connected.
    pause
    exit /b 1
)

:: Prompt user to enter the folder name for driver backup
set /p "backupFolder=Enter the folder name for driver backup: "

:: Create the specified directory for driver backup on the selected drive
mkdir "%flashDrive%:\%backupFolder%"
cd /d "%flashDrive%:\%backupFolder%"

:: Use DISM to export drivers
dism /online /export-driver /destination:"%flashDrive%:\%backupFolder%"

echo Driver backup completed. The backup is saved in %flashDrive%:\%backupFolder%
pause
