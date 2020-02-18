#!/bin/bash

declare -A array
while IFS= read -r linia
do
	request=$(echo "$linia" | grep -o -P '(?<=]).*(?=200|302)')
	tiempo=$(echo "$linia" | grep -o -P 'tiempo_request.*' | grep -o -P '[0-9]{1,3}.[0-9]{1,5}')
	array["$tiempo"]=$request
done < $1
echo "TIEMPo                    REQUEST"

for i in "${!array[@]}"
do
	echo "$i                     ${array[$i]}"
done | sort -nr -k1
