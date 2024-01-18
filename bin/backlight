#!/bin/bash

# function definitions

FILE="/sys/class/backlight/intel_backlight/brightness"

print_exit() {

    NEW=$(cat "$FILE")
    MAX=$(cat '/sys/class/backlight/intel_backlight/max_brightness')

    echo "Missing parameter(s)"
    echo "Internal: "$(($NEW * 100 / $MAX))"%"
    echo "Monitor : "$(ddcutil getvcp 10 | tail -n 1 | cut -d '=' -f 2 | cut -d ',' -f 1 | xargs)"%"
    exit
}

# initialize
if [ $# == 1 ] && ([ $1 == '-init' ] || [ $1 == '-i' ]); then

    sudo chmod a+rw $FILE
    sudo modprobe i2c-dev
    echo 'Done'

    exit
fi

# internal display
if [ $# == 2 ] && ([ $1 == '-inc' ] || [ $1 == '-i' ] || [ $1 == '-dec' ] || [ $1 == '-d' ]); then

    MIN=0
    MAX=$(cat '/sys/class/backlight/intel_backlight/max_brightness')

    CURRENT=$(cat "$FILE")

    DELTA=$(($2 * $MAX / 100))

    if [ $1 == '-inc' ] || [ $1 == '-i' ]; then
        NEW=$(($CURRENT + $DELTA))
    elif [ $1 == '-dec' ] || [ $1 == '-d' ]; then
        NEW=$(($CURRENT - $DELTA))
    fi

    if [ $NEW -gt $MAX ]; then
        NEW=$MAX
    elif [ $NEW -lt $MIN ]; then
        NEW=$MIN
    fi

    echo $NEW >"$FILE"

    exit
fi

# external monitor
if [ $# -ge 2 ] && ([ $1 == '-monitor' ] || [ $1 == '-m' ] || [ $2 == '-dec' ] || [ $2 == '-d' ] || [ $2 == '-inc' ] || [ $2 == '-i' ]); then

    CURRENT=$(ddcutil getvcp 10 | tail -n 1 | cut -d '=' -f 2 | cut -d ',' -f 1 | xargs)

    if [ ! "$3" ]; then
        DELTA=10
    else
        DELTA=$3
    fi

    if [ $2 == '-inc' ] || [ $2 == '-i' ]; then
        NEW=$(($CURRENT + $DELTA))
    elif [ $2 == '-dec' ] || [ $2 == '-d' ]; then
        NEW=$(($CURRENT - $DELTA))
    fi

    if [ $NEW -gt 100 ]; then
        NEW=100
    elif [ $NEW -lt 0 ]; then
        NEW=0
    fi

    ddcutil setvcp 10 $NEW &>/dev/null &

    exit
fi

# not enough params, print & exit
print_exit

