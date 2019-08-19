#!/usr/bin/env bash
# Thanks for idea and base script cyberalex4life <3 
nvidia_switch="optimus-manager --no-confirm --switch nvidia"
intel_switch="optimus-manager --no-confirm --switch intel"
notify_switch="notify-send -h int:transient:2 -i \\\"dialog-information-symbolic\\\" \\\"Optimus Manager Indicator\\\" \\\"Switching graphics and restaring X server to finalize process! \\\" ; "
activate_intel="\"\
	if zenity --question --title \\\"Optimus Manager Indicator\\\" --text \\\"Restart X server to switch on Intel?\\\" --width=256; \
	then \
	$notify_switch \
	sleep 2; \
	$intel_switch; \
	else \
	exit 1; \
	fi \
	\""

activate_nvidia="\"\
	if zenity --question --title \\\"Optimus Manager Indicator\\\" --text \\\"Restart X server to switch on Nvidia?\\\" --width=256; \
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
if [ "$QUERY" == 'nvidia' ]; then
    nvidia_state_icon=primeindicatornvidiasymbolic
    TEMP=$(nvidia-smi -q -d TEMPERATURE | grep 'GPU Current Temp' | awk '{print $5}')
    panel_string="$TEMP\xe2\x84\x83 | "
else
    nvidia_state_icon=primeindicatorintelsymbolic
    panel_string=""
fi

echo -e "$panel_string | iconName=$nvidia_state_icon"
echo "---"
echo "NVIDIA PRIME Profiles | iconName=$nvidia_state_icon bash=$nvidia_settings terminal=false"
echo "---"
echo "Switch to INTEL | iconName='primeindicatorintelsymbolic' bash=$activate_intel terminal=false"
echo "Switch to NVIDIA  | iconName='primeindicatornvidiasymbolic' bash=$activate_nvidia  terminal=false"
