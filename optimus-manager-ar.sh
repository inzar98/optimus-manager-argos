#!/usr/bin/env bash
# Thanks for idea and base script cyberalex4life <3 
nvidia_switch="optimus-manager --no-confirm --switch nvidia"
intel_switch="optimus-manager --no-confirm --switch intel"
notify_switch="notify-send -h int:transient:2 -i \\\"dialog-information-symbolic\\\" \\\"Optimus Manager Indicator\\\" \\\"Switching graphics and restaring X server to finalize process! \\\" ; "
notify_reboot="notify-send -h int:transient:2 -i \\\"dialog-information-symbolic\\\"  \\\"Optimus Manager Indicator\\\" \\\"System will reboot! \\\" ; "

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

reboot_cmd="\"\
	if zenity --question --title \\\"Optimus Manager Indicator\\\" --text \\\"Reboot your system?\\\" --width=160; \
	then \
	$notify_reboot \
	sleep 1; \
	systemctl --no-wall reboot; \
	else \
	exit 1; \
	fi \
	\""

nvidia_settings="\"nvidia-settings -p 'PRIME Profiles'\""
reboot_icon="'system-reboot-symbolic'"


QUERY=$(optimus-manager --print-mode)
if [ "$QUERY" == 'Current mode : nvidia' ]; then
    nvidia_state_icon=prime-nvidia
    TEMP=$(nvidia-smi -q -d TEMPERATURE | grep 'GPU Current Temp' | awk '{print $5}')
    panel_string="$TEMP\xe2\x84\x83 | "
else
    nvidia_state_icon=prime-intel
    panel_string=" | "
fi

echo -e "$panel_string""iconName=$nvidia_state_icon"
echo "---"
echo "NVIDIA PRIME Profiles| iconName=$nvidia_state_icon bash=$nvidia_settings terminal=false"
echo "---"
echo "Switch to INTEL | iconName='prime-intel' bash=$activate_intel terminal=false"
echo "Switch to NVIDIA  | iconName='prime-nvidia' bash=$activate_nvidia  terminal=false"

echo "---"
echo "System Reboot | iconName=$reboot_icon bash=$reboot_cmd terminal=false"
