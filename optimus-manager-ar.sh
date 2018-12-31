#!/usr/bin/env bash
# Thanks for idea and base script cyberalex4life <3 
nvidia_switch="optimus-manager --no-confirm --switch nvidia"
intel_switch="optimus-manager --no-confirm --switch intel"
notify_switch="notify-send -h int:transient:2 -i \\\"dialog-information-symbolic\\\" \\\"Optimus Manager Indicator\\\" \\\"Switching graphics and restaring X server to finalize process! \\\" ; "
notify_reboot="notify-send -h int:transient:2 -i \\\"dialog-information-symbolic\\\"  \\\"Optimus Manager Indicator\\\" \\\"System will reboot! \\\" ; "

activate_intel="\"\
	$notify_switch \
	sleep 2; \
	$intel_switch \
	\""

activate_nvidia="\"\
	$notify_switch \
	sleep 2; \
	$nvidia_switch \
	\""

reboot_cmd="\"\
	$notify_reboot \
	sleep 1; \
	systemctl --no-wall reboot \
	\""

nvidia_settings="\"nvidia-settings -p 'PRIME Profiles'\""
nvidia_active_icon="nvidiaactivesymbolic"
nvidia_inactive_icon="primeindicatorintelsymbolic"
reboot_icon="'system-restart'"


QUERY=$(optimus-manager --print-mode)
if [ "$QUERY" == 'Current mode : nvidia' ]; then
    nvidia_state_icon=$nvidia_active_icon
    TEMP=$(nvidia-smi -q -d TEMPERATURE | grep 'GPU Current Temp' | awk '{print $5}')
    panel_string="$TEMP\xe2\x84\x83 | "
else
    nvidia_state_icon=$nvidia_inactive_icon
    panel_string=" | "
fi

echo -e "$panel_string""iconName=$nvidia_state_icon"
echo "---"
echo "NVIDIA PRIME Profiles| iconName=$nvidia_state_icon bash=$nvidia_settings terminal=false"
echo "---"
echo "Switch to INTEL | iconName='primeindicatorintel' bash=$activate_intel terminal=false"
echo "Switch to NVIDIA  | iconName='primeindicatornvidia' bash=$activate_nvidia  terminal=false"

echo "---"
echo "System Reboot | iconName=$reboot_icon bash=$reboot_cmd terminal=false"
