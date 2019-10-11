#!/usr/bin/env bash

function yell() { tput setaf 1; echo "$0: $*" >&2; tput init; }
function simple_yell() { tput setaf 1; echo "$*" >&2; tput init; }
function die() { yell "$*"; exit 111; }
function try() { "$@" || die "cannot $*"; }

function check_integer(){
	local local_variable=$1
	if ! [[ "$local_variable" =~ ^[0-9]+$ ]]; then
		die "Sorry integers only"
	fi
}

function banner(){
	cat <<EOF
           _            _       _          _
  __ _  __| | _____   _(_)_ __ | |_ __ _  | |_ _ __ ___  ___
 / _  |/ _  |/ _ \ \ / / |  _ \| __/ _  | | __|  __/ _ \/ _ \\
| (_| | (_| |  __/\ V /| | | | | || (_| | | |_| | |  __/  __/
 \__ _|\__ _|\___| \_/ |_|_| |_|\__\__ _|  \__|_|  \___|\___|

EOF
}

function help(){
	echo "Usage: $0 \$height"
}

function tree(){
	local LEVELS=$1
	for i in $(seq 1 ${LEVELS}); do
		for j in $(seq 1 $((${LEVELS}-${i}+1))); do
			echo -n " "
		done
		for j in $(seq 1 $((2*${i}-1))); do
			echo -n "*"
		done
		echo ""
	done
}

banner

if [[ "$#" != 1 ]]; then
	help
	exit 0
fi

check_integer $1

# Check if $1 is an integer

tree $1
