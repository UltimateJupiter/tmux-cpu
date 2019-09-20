#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# script global variables
cpu_l0_icon=""
cpu_l1_icon=""
cpu_l2_icon=""
cpu_l3_icon=""
cpu_l4_icon=""

cpu_l0_default_icon=""
cpu_l1_default_icon=""
cpu_l2_default_icon=""
cpu_l3_default_icon=""
cpu_l4_default_icon=""

# icons are set as script global variables
get_icon_settings() {
	cpu_l0_icon=$(get_tmux_option "@cpu_l0_icon" "$cpu_l0_default_icon")
	cpu_l1_icon=$(get_tmux_option "@cpu_l1_icon" "$cpu_l1_default_icon")
	cpu_l2_icon=$(get_tmux_option "@cpu_l2_icon" "$cpu_l2_default_icon")
	cpu_l3_icon=$(get_tmux_option "@cpu_l3_icon" "$cpu_l3_default_icon")
	cpu_l4_icon=$(get_tmux_option "@cpu_l4_icon" "$cpu_l4_default_icon")
}

print_icon() {
	local cpu_percentage=$($CURRENT_DIR/cpu_percentage.sh | sed -e 's/%//')
	local cpu_load_status=$(cpu_load_status $cpu_percentage)
	if [ $cpu_load_status == "l0" ]; then
		echo "$cpu_l0_icon"
	elif [ $cpu_load_status == "l1" ]; then
		echo "$cpu_l1_icon"
	elif [ $cpu_load_status == "l2" ]; then
		echo "$cpu_l2_icon"
	elif [ $cpu_load_status == "l3" ]; then
		echo "$cpu_l3_icon"
	elif [ $cpu_load_status == "l4" ]; then
		echo "$cpu_l4_icon"
	fi
}

main() {
	get_icon_settings 
	local cpu_icon=$(print_icon "$1")
	echo "$cpu_icon"
}
main
