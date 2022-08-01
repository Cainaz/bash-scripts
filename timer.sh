#!/bin/bash

# Time variable (seconds)
sek=0

while getopts h:m:s: flag
do
	case "${flag}" in
		h) sek=$(($sek + $((${OPTARG} * 60 * 60))));;
		m) sek=$(($sek + $((${OPTARG} * 60))));;
		s) sek=$(($sek + ${OPTARG}))
	esac
done


while [ $sek -ge 1 ]
do
	hours=$(printf '%02d' $(($sek/3600)))
	param=$(($sek%3600))
	minutes=$(printf '%02d' $(( $param / 60)))
	seconds=$(printf '%02d' $(($sek%60)))
	echo -ne "${hours}h ${minutes}m ${seconds}s \r"
	sleep 1
	sek=$[$sek-1]
	echo -en "\b\b\b"
done

echo "Finished!"
