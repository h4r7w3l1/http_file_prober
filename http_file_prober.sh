#!/usr/bin/env bash
# Simply bash tool for parsing size and type of URLs
# Each request get only firsts KB of data and parse content length+type & headers
# Output will be saved in execution path, file appends results
# 
# Author: h4r7w3l1 https://github.com/h4r7w3l1

if ! command -v rg &> /dev/null
then
        echo "rip-grep [\"rg\"] could not be found"
        echo "Install On Linux: apt install ripgrep"
        echo "Install On MacOS: brew install ripgrep"
    exit
fi

if [ $# -lt 1 ]; then
 		echo -e "USAGE: $(basename "$0") [url] [url2] [urlX..]
		cat urls.txt | xargs -n10 -P25 $(pwd)/$(basename "$0")"
	exit 0 
fi

SAVEDATE=$(date +%Y.%m.%d)

for LINK in "$@"
do
	GETHEAD=$(curl -m 1 -sS -Lk -D - -X HEAD "$LINK" 2>/dev/null )
	GETSIZE=$(printf "%s\n" "$GETHEAD" | rg "content-length:" -i | rg -e "\d+" -o --trim | tail -1 )
		if [[ -z "$GETSIZE" ]]
		then
			GETSIZE="Null"
		fi
	GETTYPE=$(printf "%s\n" "$GETHEAD" | rg "content-type:" -i | rg -e "\w+/[\w-]+" -o --trim | tail -1 )
		if [[ -z "$GETTYPE" ]]
		then
			GETTYPE="Null"
		fi
	printf "%-85s | %-10s | %-5s\n" "$LINK" "$GETSIZE" "$GETTYPE" >> ./out_probing_"$SAVEDATE".txt
	printf "%-85s | %-10s | %-5s\n" "$LINK" "$GETSIZE" "$GETTYPE"
done
