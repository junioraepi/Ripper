#!/bin/bash

function encode() {

echo "TITLE: $3"
echo "INPUT: $1"
echo "OUT: $2_title$3.mkv"

echo "" | /usr/bin/HandBrakeCLI \
	--format av_mkv \
	--encoder x264 \
	--quality 24 \
	--strict-anamorphic \
	--audio 1,2,3,4,5,6,7,8,9,10 \
	--aencoder copy,mp3,mp3,mp3,mp3,mp3,mp3,mp3,mp3,mp3,mp3 \
	--mixdown 7point1,stereo,stereo,stereo,stereo,stereo,stereo,stereo,stereo,stereo \
	--subtitle 1,2,3,4,5,6,7,8,8,10 \
	--encoder-preset ultrafast \
	--title "$3" \
	--input "$1" \
	--output "$2"
}

if (($#  != 2 )); then
	echo "Usage: hb.sh [path to video] [dest Path]"
	exit 1
fi

title_list=$(/usr/bin/HandBrakeCLI --title 0 --input "$1" 2>&1 | \
	grep 'scan: duration' | \
	grep -n '^' | \
	sort -r -k 5)

count=0
while read  line; do
	if (( 60000 < $(sed 's/^.*(\([0-9]\+\) ms.*$/\1/g' <<<"$line") )); then
		title=$(echo "$line" | awk -F":" '{print $1}')
		if((count == 0)); then
			mkdir -p "$2"
			encode "$1" "$2/mainFeature.mkv" "$title"
		else
			mkdir -p "$2/Season00"
			encode "$1" "$2/Season00/Episode_$title.mkv" "$title"
		fi
		((count++))
	fi;
done <<< "$title_list"
