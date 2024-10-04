@echo off
:: IMPORTANT NOTE: THIS APPLICATION IS FOR WINDOWS 10. IT MAY NOT WORK ON WINDOWS 11 IF THERE ARE VARIOUS CHANGES. NEED TO TEST {^-^}

:: DATE FORMAT is "Thu 03.10.2024". Check your date format by typing "date" in CMD and adjust accordingly.
:: Lines that start with double colons are comment lines.
:: desktopPath is where the battery report and daily report will be saved.
:: You need to place this .bat file in the StartUp folder.
:: And of course, don’t forget to convert this to a .bat file. If this file send to you with .txt extension.
:: To do this, open File Explorer, click on 'View' in the top menu, and check the box for 'File name extensions' on the left.
:: This will allow you to see and change file extensions.
:: For the StartUp folder, press Win+R and type 'shell:startup'.

:: THIS APPLICATION WILL RUN EVERY TIME YOU BOOT UP THE COMPUTER.

set desktopPath=YOURDESKTOPPATH

for /F "tokens=2 delims= " %%A in ('date /t') do set datePart=%%A

for /F "tokens=1 delims=." %%B in ('echo %datePart%') do set day=%%B
for /F "tokens=2 delims=." %%C in ('echo %datePart%') do set month=%%C
for /F "tokens=3 delims=." %%D in ('echo %datePart%') do set year=%%D

if "%day%"=="01" (
    cd %desktopPath%
    start powercfg /batteryreport
    echo %month% - %year% Battery report created. >> %desktopPath%\rapor_durumu.txt

) else (
echo Today: %day%-%month%-%year% >> %desktopPath%\rapor_durumu.txt
)
