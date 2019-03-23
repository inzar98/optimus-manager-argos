
                        # ARGOS DEV. IS STOPED SO THIS EXTESION TOO !!!!!!!!!!!!1


# Argos Script For Optimus-Manager
Gnome Shell Indicator for Optimus-Manager, using Argos API

Special Thanks to Cyberalex4 and Askannz <3!

Screenshot was first release. Added icon switch for after gpu switching.

![NVidia Prime Argos Indicator](https://github.com/inzar98/optimus-manager-argos/blob/master/screenshots/optimus-manager-1.png)                                       

#### Requirements
- [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome Shell extension.
- [Optimus-Manager](https://github.com/Askannz/optimus-manager) Awesome Optimus Switch script!
- Any Arch based distro.


#### Installation
Install [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome-Shell extension.

Create directory `~/.local/share/icons` if it does not exist:
```
! [ -d "~/.local/share/icons" ] && mkdir --parents ~/.local/share/icons || trueg
```

Then:
```
git clone https://github.com/inzar98/optimus-manager-argos.git
cd argos-indicator-nvidia-prime

# copy icons
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



