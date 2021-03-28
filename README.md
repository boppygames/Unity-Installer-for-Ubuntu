Checkout my game on Steam! https://store.steampowered.com/app/1384030/Boppio/

## How do I run the script?
 
You only need the installer script itself. To run the script, press Ctrl-Alt-T to bring up a termainal.
Paste in these commands using Ctrl-Shift-V:
 
```
wget https://raw.githubusercontent.com/boppygames/Unity-Installer-for-Ubuntu/main/installer.sh
bash installer.sh
```
By running the script you accept the terms of the MIT license.

## What does this do?

This is a simple installer script to install the Unity Engine on Ubuntu 20.04. This script makes some assumptions about your system:
 - You are running Ubuntu 20.04 desktop
 - You have a 64-bit x86_64 PC (raspberry pi or other ARM based platforms are NOT supported)
 
If you are doing any serious game development, I would highgly recommend having at least 16GB of ram and a dedicated graphics card. Make sure you install your video card drivers before launching Unity.
 
## Post Install
 
You should install all Editors in `/opt/Unity/Editors`. Also it is highly highly recommended to switch your current graphics API to Vulkan because it runs substantially better.

Any user that needs to run Unity should belong to the `unity` group. You can add users to the `unity` group by doing this:

```
sudo usermod -a -G unity $USERNAME
```

You may have to restart or log out of your current session for that change to apply. Check your groups by running the `groups` command.
