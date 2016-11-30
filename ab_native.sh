#!/bin/bash

set -euo pipefail

PREFIX=ab_native

function run_apache {
    printf "please enter how many server you want for this run:\n";
    read numOfServers;
    if [ $numOfServers -gt 32 ]; then
        echo "number of servers cannot be greater than number of vm"
        exit
    fi
    printf "Running $numOfServers server(s) benchmark will start in 3 secs...\n"
    for i in `seq 500 $((numOfServers+499))`; do 
        touch $PREFIX$i.dat;
        taskset  0x$((1 << $((i-500)))) ab -n 2500 -c 50  "http://127.0.0.1:$i/" >> $PREFIX$i.dat  &
    done
    wait
}

echo "start experiment..."
rm result*.csv || true  # remove previous calculation
rm ab_native*.dat  ||true
wait
echo "old data cleaned"

    run_apache;

