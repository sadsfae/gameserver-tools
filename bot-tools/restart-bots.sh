#!/bin/bash
# use qstat (quakestat) to check that bots are loaded
# restart server if there are no players listed
# REQUIRES qstat / quakestat binary in your path
########################
# game type to check
# -woets = ET, ETL
# -q3s   = Urban Terror
########################

game="-woets"
server=gameserver.example.com
port=27960
serverpid=$(ps -ef | grep $port | grep -v grep | awk '{print $2}')
# log locally
exec >> $server-$port-restartlog 2>&1

check_player_count() {
    status=$(quakestat $game $server:$port | grep $server | awk '{print $2}' | awk -F "/" '{print $1}')
    if [[ $status -ne "0" ]] || [[ $status != "DOWN" ]];
    then
        echo "$status players are active running as pid $serverpid, quitting"
    else
        echo "$status players active for pid $serverpid, bots are AWOL.  Restarting"
        kill $serverpid
    fi
}

check_player_count
