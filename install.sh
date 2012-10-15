#!/bin/bash

if [ ! -d dspace-source ] || [ ! -f xoai.diff ]; then
	echo "Must execute this script within the addon directory"
	exit
fi

if [ $# -ne 1 ]; then
	echo "Syntax: $0 <DSpace Source>"
	exit
fi

if [ ! -d "$1"/dspace ] || [ ! -d "$1"/dspace-api ]; then
	echo "$1 isn't the DSpace source diretory"
	exit
fi

cp -r dspace-source/* "$1"

A=`pwd`

cd "$1"
patch -p1 < "$A"/xoai.diff
