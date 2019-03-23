
                        # ARGOS DEVELOPMENT IS STOPPED. FOR GNOME 3.32 USE THİS FORK https://github.com/p-e-w/argos/pull/76
                        # I can fork it too if anyone want...


# Argos Script For Optimus-Manager
Gnome Shell Indicator for Optimus-Manager, using Argos API

Special Thanks to Cyberalex4 and Askannz <3!

Screenshot was first release. Added icon switch for after gpu switching.

![NVidia Prime Argos Indicator](https://github.com/inzar98/optimus-manager-argos/blob/master/screenshots/optimus-manager-1.png)                                       

#### Requirements
- [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome Shell extension.
- [Optimus-Manager](https://github.com/Askannz/optimus-manager) Awesome Optimus Switch script!
- Zenity By @ArionWT
- Any Arch based distro.


#### Installation
Install [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome-Shell extension.
FOR GNOME 3.32 USE THİS FORK https://github.com/p-e-w/argos/pull/76

Create directory `~/.local/share/icons` if it does not exist:
```
! [ -d "~/.local/share/icons" ] && mkdir --parents ~/.local/share/icons || trueg
```

Then:
```
git clone https://github.com/inzar98/optimus-manager-argos.git
cd optimus-manager-argos

    # copy icons (not necessary)
    cp -v icons/* ~/.local/share/icons/

# copy 'optimus-manager-ar.sh' to 'argos' folder
cp -v optimus-manager-ar.sh ~/.config/argos/

# Thats All !
```
#### Uninstall
```
# remove icons
rm ~/.local/share/icons-to-delete/{nvidia-active-symbolic.svg,nvidia-inactive-symbolic.svg,prime-indicator-intel.svg,prime-indicator-intel-symbolic.svg,prime-indicator-nvidia.svg}


# remove argos extension script
rm ~/.config/argos/optimus-manager-ar.sh



