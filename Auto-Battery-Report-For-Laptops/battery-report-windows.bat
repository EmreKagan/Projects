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
:: In the "Thu 03.10.2024" format, seperate the format and select the SECOND part.

for /F "tokens=1 delims=." %%B in ('echo %datePart%') do set day=%%B
for /F "tokens=2 delims=." %%C in ('echo %datePart%') do set month=%%C
for /F "tokens=3 delims=." %%D in ('echo %datePart%') do set year=%%D

if "%month%" EQU "1" set LastDay=31
if "%month%" EQU "3" set LastDay=31
if "%month%" EQU "5" set LastDay=31
if "%month%" EQU "7" set LastDay=31
if "%month%" EQU "8" set LastDay=31
if "%month%" EQU "10" set LastDay=31
if "%month%" EQU "12" set LastDay=31

if "%month%" EQU "4" set LastDay=30
if "%month%" EQU "6" set LastDay=30
if "%month%" EQU "9" set LastDay=30
if "%month%" EQU "11" set LastDay=30

:: Every year that is exactly divisible by four is a leap year,
:: except for years that are exactly divisible by 100, 
:: but these centurial years are leap years if they are exactly divisible by 400. 
:: For example, the years 1700, 1800, and 1900 are not leap years, but the years 1600 and 2000 are.
:: FROM WIKIPEDIA

if "%month%" EQU "2" (
    set /A leap=year %% 4
    set /A cent=year %% 100
    set /A vcent=year %% 400

    if "!leap!" EQU "0" (
	if "!cent!" EQU "0" (
	    if "!vcent!" EQU "0" (
		set LastDay=29    
	    ) else (
		set LastDay=28
	    )
	)
        set LastDay=29
    )
    else (
        set LastDay=28
    )
)

set /A "daysleft=!LastDay!-!day!+1"

if %day% LSS 10 (set Day=0%day%) else (set Day=%day%)
if %month% LSS 10 (set Month=0%month%) else (set Month=%month%)

if "%day%" EQU "01" (

    if not exist "!desktopPath!\batteryConfig" (
        mkdir "!desktopPath!\batteryConfig"
    )    

    set batteryName=battery-report-!month!-!year!.html
    start powercfg /batteryreport /output !desktopPath!\batteryConfig\!batteryName!

    if "%Month%" EQU "01" (
    	echo New year new dreams ❄️. !Month!-!year! dated battery report has been created. >> !desktopPath!\rapor_status.txt
	echo -------------------------------------------------------------------------------- >> !desktopPath!\report_status.txt
    ) else (
	echo !Month!-!year! dated battery report has been created. Here is your reward: 🍪 >> %desktopPath%\report_status.txt
	echo -------------------------------------------------------------------------------- >> !desktopPath!\report_status.txt
    )
) 
else (
	echo Today: !Day!-!Month!-!year!. !daysleft! days left to next report. >> %desktopPath%\report_status.txt
	echo -------------------------------------------------------------------------------- >> !desktopPath!\report_status.txt
)
endlocal
