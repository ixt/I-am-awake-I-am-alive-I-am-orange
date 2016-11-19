#!/bin/bash
# Check for changes in verification repo
checkFor24HourPassing(){
    cd ~/Projects/I-am-awake-I-am-alive-I-am-orange
    local currentTimeStamp=$(git show | head -3 | tail -1 | sed -e 's/Date:   //g;s/+0000//g')
    local twentyFourHoursPast=$(date -d "$currentTimeStamp + 24 hours" +%s)
    local currentTime=$(date +%s)
    if [[ $currentTime -gt $twentyFourHoursPast ]]; then
        echo "Go post the verification you're still alive"
    fi
    cd
}

checkFor24HourPassing
