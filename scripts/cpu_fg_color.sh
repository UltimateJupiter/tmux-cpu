#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

cpu_l0_fg_color=""
cpu_l1_fg_color=""
cpu_l2_fg_color=""
cpu_l3_fg_color=""
cpu_l4_fg_color=""

cpu_l0_default_fg_color="#[fg=#30ff30] "
cpu_l1_default_fg_color="#[fg=#d9ff66] "
cpu_l2_default_fg_color="#[fg=#ffd500] "
cpu_l3_default_fg_color="#[fg=#ff7700] "
cpu_l4_default_fg_color="#[fg=#ff0000] "

get_fg_color_settings() {
	cpu_l0_fg_color=$(get_tmux_option "@cpu_l0_fg_color" "$cpu_l0_default_fg_color")
	cpu_l1_fg_color=$(get_tmux_option "@cpu_l1_fg_color" "$cpu_l1_default_fg_color")
	cpu_l2_fg_color=$(get_tmux_option "@cpu_l2_fg_color" "$cpu_l2_default_fg_color")
	cpu_l3_fg_color=$(get_tmux_option "@cpu_l3_fg_color" "$cpu_l3_default_fg_color")
	cpu_l4_fg_color=$(get_tmux_option "@cpu_l4_fg_color" "$cpu_l4_default_fg_color")
}

print_fg_color() {
	local cpu_percentage=$($CURRENT_DIR/cpu_percentage.sh | sed -e 's/%//')
	local cpu_load_status=$(cpu_load_status $cpu_percentage)
	if [ $cpu_load_status == "l0" ]; then
		echo "$cpu_l0_fg_color"
	elif [ $cpu_load_status == "l1" ]; then
		echo "$cpu_l1_fg_color"
	elif [ $cpu_load_status == "l2" ]; then
		echo "$cpu_l2_fg_color"
	elif [ $cpu_load_status == "l3" ]; then
		echo "$cpu_l3_fg_color"
	elif [ $cpu_load_status == "l4" ]; then
		echo "$cpu_l4_fg_color"
	fi
}

main() {
	get_fg_color_settings
	print_fg_color
}
main
