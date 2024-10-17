@echo off
:: IMPORTANT NOTE: THIS APPLICATION HAS DEVELOPED IN WINDOWS 10. IT MAY NOT WORK ON WINDOWS 11 IF THERE ARE VARIOUS CHANGES. NEED TO TEST {^-^}

:: DATE FORMAT is "Thu 03.10.2024". Check your date format by typing "date" in CMD and adjust accordingly.
:: Lines that start with double colons are comment lines.
:: desktopPath is where the battery report and daily report will be saved.
:: You should write desktopPath without any addition like ",!,' etc.
:: Exp: C:\Users\User\Desktop
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

if "%month%"=="01" (
    set LastDay=31
)
else if "%month%"=="03" (
    set LastDay=31
)
else if "%month%"=="05" (
    set LastDay=31
)
else if "%month%"=="07" (
    set LastDay=31
)
else if "%month%"=="08" (
    set LastDay=31
)
else if "%month%"=="10" (
    set LastDay=31
)
else if "%month%"=="12" (
    set LastDay=31
)

if "%month%"=="04" (
    set LastDay=30
)
else if "%month%"=="06" (
    set LastDay=30
)
else if "%month%"=="09" (
    set LastDay=30
)
else if "%month%"=="11" (
    set LastDay=30
)

if "%month%"=="02" (
    set /A leap=year %% 4
    if "!leap!"=="0" (
        set LastDay=29
    )
    else (
        set LastDay=28
    )
)

if "%day%"=="01" (
    if not exist "!desktopPath!\batteryConfig" (
        mkdir "!desktopPath!\batteryConfig"
    )
    
    set batteryName=battery-report-!month!-!year!.html
    start powercfg /batteryreport /output !desktopPath!\batteryConfig\!batteryName!

    echo !month!-!year! Battery report created. >> %desktopPath%\report_status.txt

) else (
set /A "daysleft=!LastDay!-!day!"
echo Today: !day!-!month!-!year!. !daysleft! days left to next report. >> %desktopPath%\report_status.txt
)
