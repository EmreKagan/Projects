# IMPORTANT NOTE: THIS APPLICATION HAS BEEN MADED FOR UNIX BASED LAPTOPS BUT ONLY TESTED ON FEDORAOS

# desktopPath is where the battery report and daily report will be saved.
# You should write desktopPath without any addition like ",!,' etc.
# Exp: /home/user/Desktop
# You have to make this file executable.
# Exp: chmod +x battery-report-unixs.sh

# THIS APPLICATION WILL RUN EVERY TIME YOU BOOT UP THE COMPUTER.
# But I don't know how to do that. You may check "Systemd" in linuxs and "Launchd" in MacOS.

desktopPath="YOURPATH"

currentDate=$(date +"%d.%m.%Y")
day=$(echo $currentDate | cut -d '.' -f1)
month=$(echo $currentDate | cut -d '.' -f2)
year=$(echo $currentDate | cut -d '.' -f3)

case "$month" in
    "1"|"3"|"5"|"7"|"8"|"10"|"12")
        LastDay=31
        ;;
    "4"|"6"|"9"|"11")
        LastDay=30
        ;;
    "2")
        if (( year % 4 == 0 )) && (( year % 100 != 0 || year % 400 == 0 )); then
            LastDay=29
        else
            LastDay=28
        fi
        ;;
esac

daysLeft=$((LastDay - day + 1))

if [ $day -lt 10 ]; then
	Day=0$day
else
	Day=$day
fi
if [ $month -lt 10 ]; then
	Month=0$month
else
	Monsth=$month
fi

reportStatusPath="$desktopPath/report_status.txt"

if [ "$day" -eq 1 ]; then
    batteryConfigPath="$desktopPath/batteryConfig"
    if [ ! -d "$batteryConfigPath" ]; then
        mkdir -p "$batteryConfigPath"
    fi

    if [[ "$OSTYPE" == "darwin"* ]]; then
        batteryName="battery-report-${month}-${year}.html"
        pmset -g batt > "$batteryConfigPath/$batteryName"

    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        batteryName="battery-report-${month}-${year}.txt"
        upower -i /org/freedesktop/UPower/devices/battery_BAT0 > "$batteryConfigPath/$batteryName"
    fi

    if [ "$month" -eq 1 ]; then
	echo "New year new dreams ❄️. $Month-$year dated battery report has been created." >> "$reportStatusPath"
    else
        echo "$Month-$year dated battery report has been created. Here is your reward: 🍪" >> "$reportStatusPath"
    fi
    echo "--------------------------------------------------------------------------------" >> "$reportStatusPath"
else
    echo "Today: $Day-$Month-$year. $daysLeft days left to next report." >> "$reportStatusPath"
    echo "--------------------------------------------------------------------------------" >> "$reportStatusPath"
fi
