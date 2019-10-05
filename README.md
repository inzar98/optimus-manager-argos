# Argos Script For Optimus-Manager

Gnome Shell Indicator for Optimus-Manager, using Argos API.

Special Thanks to Cyberalex4 and Askannz <3!

Screenshot was first release. Added icon switch for after GPU Switching.

![NVidia Prime Argos Indicator](https://github.com/inzar98/optimus-manager-argos/blob/master/screenshots/optimus-manager-1.png)                                       

___

### Requirements

- [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome Shell extension.
- [Optimus-Manager](https://github.com/Askannz/optimus-manager) Awesome Optimus Switch script!
- Zenity for dialog window By @ArionWT
- Any Arch based distro.


### Installation

#### 1. Create directory `~/.local/share/icons` if it does not exist:

  ```bash
  ! [ -d "~/.local/share/icons" ] && mkdir --parents ~/.local/share/icons
  ```

#### 2. Install

  ```bash
  git clone https://github.com/inzar98/optimus-manager-argos.git
  cd optimus-manager-argos

  # Install the files
  make install
  ```

#### 3. Enjoy!

___

### Uninstall

```bash
# Remove the files
make uninstall
```
