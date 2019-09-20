#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

cpu_l0_bg_color=""
cpu_l1_bg_color=""
cpu_l2_bg_color=""
cpu_l3_bg_color=""
cpu_l4_bg_color=""

cpu_l0_default_bg_color="#[bg=#30ff30] "
cpu_l1_default_bg_color="#[bg=#d9ff66] "
cpu_l2_default_bg_color="#[bg=#ffd500] "
cpu_l3_default_bg_color="#[bg=#ff7700] "
cpu_l4_default_bg_color="#[bg=#ff0000] "

get_bg_color_settings() {
	cpu_l0_bg_color=$(get_tmux_option "@cpu_l0_bg_color" "$cpu_l0_default_bg_color")
 	cpu_l1_bg_color=$(get_tmux_option "@cpu_l1_bg_color" "$cpu_l1_default_bg_color")
	cpu_l2_bg_color=$(get_tmux_option "@cpu_l2_bg_color" "$cpu_l2_default_bg_color")
	cpu_l3_bg_color=$(get_tmux_option "@cpu_l3_bg_color" "$cpu_l3_default_bg_color")
	cpu_l4_bg_color=$(get_tmux_option "@cpu_l4_bg_color" "$cpu_l4_default_bg_color")
}

print_bg_color() {
	local cpu_percentage=$($CURRENT_DIR/cpu_percentage.sh | sed -e 's/%//')
	local cpu_load_status=$(cpu_load_status $cpu_percentage)
	if [ $cpu_load_status == "l0" ]; then
		echo "$cpu_l0_bg_color"
	elif [ $cpu_load_status == "l1" ]; then
		echo "$cpu_l1_bg_color"
	elif [ $cpu_load_status == "l2" ]; then
		echo "$cpu_l2_bg_color"
	elif [ $cpu_load_status == "l3" ]; then
		echo "$cpu_l3_bg_color"
	elif [ $cpu_load_status == "l4" ]; then
		echo "$cpu_l4_bg_color"
	fi
}

main() {
	get_bg_color_settings
	print_bg_color
}
main
