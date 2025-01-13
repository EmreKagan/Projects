@echo off
:: IMPORTANT NOTE: THIS APPLICATION CAN RUN IN WINDOWS

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

setlocal enabledelayedexpansion

set desktopPath=YOURDESKTOPPATH

for /F "tokens=2 delims= " %%A in ('date /t') do set datePart=%%A

for /F "tokens=1 delims=." %%B in ('echo %datePart%') do set day=%%B
for /F "tokens=2 delims=." %%C in ('echo %datePart%') do set month=%%C
for /F "tokens=3 delims=." %%D in ('echo %datePart%') do set year=%%D

if "%month%" EQU "01" set LastDay=31
if "%month%" EQU "03" set LastDay=31
if "%month%" EQU "05" set LastDay=31
if "%month%" EQU "07" set LastDay=31
if "%month%" EQU "08" set LastDay=31
if "%month%" EQU "10" set LastDay=31
if "%month%" EQU "12" set LastDay=31

if "%month%" EQU "04" set LastDay=30
if "%month%" EQU "06" set LastDay=30
if "%month%" EQU "09" set LastDay=30
if "%month%" EQU "11" set LastDay=30

if "%month%" EQU "02" (
    set /A leap=year %% 4

    if "!leap!" EQU "0" (
        set LastDay=29
    )
    else (
        set LastDay=28
    )
)

set /A "daysleft=!LastDay!-!day!+1"

if "%day%" EQU "01" (

    if not exist "!desktopPath!\batteryConfig" (
        mkdir "!desktopPath!\batteryConfig"
    )    

    set batteryName=battery-report-!month!-!year!.html
    start powercfg /batteryreport /output !desktopPath!\batteryConfig\!batteryName!

    if "%month%" NEQ "01" (
	echo !month!-!year! dated battery report has been created. Here is your reward: 🍪 >> %desktopPath%\report_status.txt
	echo -------------------------------------------------------------------------------- >> !desktopPath!\rapor_durumu.txt
    ) else (
    	echo New year new dreams ❄️. !month!-!year! dated battery report has been created. >> !desktopPath!\rapor_durumu.txt
	echo -------------------------------------------------------------------------------- >> !desktopPath!\rapor_durumu.txt
    )
) 
else (
	echo Today: !day!-!month!-!year!. !daysleft! days left to next report. >> %desktopPath%\report_status.txt
	echo -------------------------------------------------------------------------------- >> !desktopPath!\rapor_durumu.txt
)
endlocal
