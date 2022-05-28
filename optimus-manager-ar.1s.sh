#!/usr/bin/env bash
# Thanks for idea and base script cyberalex4life <3 

# You can set parameters in this file
source ~/.config/optimus-manager-argos/omarc 2> /dev/null

nvidia_switch="optimus-manager --no-confirm --switch nvidia"
hybrid_switch="optimus-manager --no-confirm --switch hybrid"
integrated_switch="optimus-manager --no-confirm --switch integrated"
notify_switch="notify-send -h int:transient:2 -i \\\"dialog-information-symbolic\\\" \\\"Optimus Manager Indicator\\\" \\\"Switching graphics and restaring X server to finalize process! \\\" ; "
activate_integrated="\"\
	if zenity --question --title \\\"Optimus Manager Indicator\\\" --text \\\"Restart X server to switch on Integrated?\\\" --width=256; \
	then \
	$notify_switch \
	sleep 2; \
	$integrated_switch; \
	else \
	exit 1; \
	fi \
	\""

activate_hybrid="\"\
	if zenity --question --title \\\"Optimus Manager Indicator\\\" --text \\\"Restart X server to switch on Hybrid?\\\" --width=256; \
	then \
	$notify_switch \
	sleep 2; \
	$hybrid_switch; \
	else \
	exit 1; \
	fi \
	\""

activate_nvidia="\"\
	if zenity --question --title \\\"Optimus Manager Indicator\\\" --text \\\"Restart X server to switch on NVIDIA?\\\" --width=256; \
	then \
	$notify_switch \
	sleep 2; \
	$nvidia_switch; \
	else \
	exit 1; \
	fi \
	\""

nvidia_settings="\"nvidia-settings -p 'PRIME Profiles'\""


QUERY=$(optimus-manager --print-mode | grep 'Current GPU mode' | awk '{print $5}')
if [ "$QUERY" == 'nvidia' ] || [ "$QUERY" == 'hybrid' ]; then
	if [ "$QUERY" == 'nvidia' ]; then
		nvidia_state_icon=primeindicatornvidiasymbolic
	else
		nvidia_state_icon=primeindicatorhybridsymbolic
	fi

	MULTIPLE_DATA=false
	_OPTIMUS_MANAGER_ARGOS_SHOW_TEMP=${_OPTIMUS_MANAGER_ARGOS_SHOW_TEMP:-1}
	_OPTIMUS_MANAGER_ARGOS_SHOW_POWER=${_OPTIMUS_MANAGER_ARGOS_SHOW_POWER:-0}
	panel_string = ""

	if [ "$_OPTIMUS_MANAGER_ARGOS_SHOW_TEMP" != '0' ]; then
		TEMP=$(nvidia-smi -q -d TEMPERATURE | grep 'GPU Current Temp' | awk '{print $5}')
		if [ "$MULTIPLE_DATA" == true ]; then
			panel_string="$panel_string -"
		fi
		panel_string="$panel_string $TEMP\xe2\x84\x83"
		MULTIPLE_DATA=true
	fi
	
	if [ "$_OPTIMUS_MANAGER_ARGOS_SHOW_POWER" != '0' ]; then
		POWER=$(nvidia-smi -q -d POWER | grep 'Power Draw' | awk '{print $4}')
		if [ "$MULTIPLE_DATA" == true ]; then
			panel_string="$panel_string -"
		fi
		panel_string="$panel_string $POWER\x57"
		MULTIPLE_DATA=true
	fi

	panel_string="$panel_string | "
else
    nvidia_state_icon=primeindicatorintelsymbolic
    panel_string=""
fi

echo -e "$panel_string | iconName=$nvidia_state_icon"
echo "---"
echo "NVIDIA Settings | iconName=$nvidia_state_icon bash=$nvidia_settings terminal=false"
echo "---"
echo "Switch:"
echo "Integrated | iconName='primeindicatorintelsymbolic' bash=$activate_integrated terminal=false"
echo "Hybrid  | iconName='primeindicatorhybridsymbolic' bash=$activate_hybrid  terminal=false"
echo "NVIDIA  | iconName='primeindicatornvidiasymbolic' bash=$activate_nvidia  terminal=false"

_OPTIMUS_MANAGER_ARGOS_SHOW_CURRENT_PROFILE=${_OPTIMUS_MANAGER_ARGOS_SHOW_CURRENT_PROFILE:-0}
if [ "$_OPTIMUS_MANAGER_ARGOS_SHOW_CURRENT_PROFILE" != '0' ]; then
	echo "---"
	echo "Current profile : $(optimus-manager --print-mode | grep 'Current GPU mode' | awk '{print $5}') | "
fi
