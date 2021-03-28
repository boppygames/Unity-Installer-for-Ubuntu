<p align="center">
 <b>Made by Boppy Games :)</b><br>
    <a href="https://discord.com/invite/yY9wHNn">
        <img src="https://img.shields.io/discord/731217831898906737?logo=discord"
            alt="chat on Discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=boppygames">
        <img src="https://img.shields.io/twitter/follow/boppygames?style=social&logo=twitter"
            alt="follow on Twitter"></a>
    <a href="https://www.twitch.tv/boppygames">
        <img alt="Twitch Status" src="https://img.shields.io/twitch/status/boppygames?style=social"></a>
    <br><a href="https://store.steampowered.com/app/1384030/Boppio/">Checkout Boppio on Steam!</a>
</p>



## How do I run the script?
 
You only need the installer script itself. To run the script, press Ctrl-Alt-T to bring up a terminal.
Paste in these commands using Ctrl-Shift-V:
 
```
wget https://raw.githubusercontent.com/boppygames/Unity-Installer-for-Ubuntu/main/installer.sh
bash installer.sh
```
By running the script you accept the terms of the MIT license.

## Why should I switch from Windows 10 to Ubuntu 20.04?

Here are some of the main reasons I think people should switch:
 - Game development workflow improvements: you can use anything supported on Linux
 - The more people that use the LinuxEditor the better it will get (more bug reports for Unity == more fixes, more resources, etc.)
 - The NTFS URI 255 max path length restriction is a HUGE pain, this isn't really an issue for ext4, XFS, etc.

Here are some reasons not to switch:
 - Not all software is supported on Linux - like Adobe Photoshop.
 - The LinuxEditor is likely not as fast as UnityEditor on Windows 10 even when using Vulkan
 - Linux graphics card drivers are typically not as good as their Windows 10 equivalents
 - Graphical bugs in the LinuxEditor are common
 - Crashes seem to be somewhat common, but seem to be just as common in the Windows 10 UnityEditor

## What does this script do?

This is a simple installer script to install the Unity Engine on Ubuntu 20.04. This script makes some assumptions about your system:
 - You are running Ubuntu 20.04 desktop
 - You have a 64-bit x86_64 PC (raspberry pi or other ARM based platforms are NOT supported)
 
The script does the following things:
 - Installs the latest version of UnityHub for Linux
 - Installs .NET from the official Microsoft source. This is required for JetBrains Rider.
 - Creates a desktop file for the UnityHub so that it can be searched for in the Gnome desktop search
 - Creates a `/opt/Unity` directory where UnityEditors should be installed so they can be accessed by all users
 - Creates a `unity` group - any user in this group can run the installed UnityEditors and download new versions, updates, etc.
 
If you are doing any serious game development, I would highly recommend having at least 16GB of ram and a dedicated graphics card. Make sure you install your video card drivers.
 
## Post Install
 
You should install all Editors in `/opt/Unity/Editors`. Also it is highly highly recommended to switch your current graphics API to Vulkan because it runs substantially better. You can do this in `ProjectSettings/PlayerSettings/Other Settings`. Uncheck automatic Linux Graphics API and drag Vulkan above OpenGL. You can check to see if you are running Vulkan or OpenGL by looking at the title bar of the application window.

Any user that needs to run Unity should belong to the `unity` group. You can add users to the `unity` group by doing this:

```
sudo usermod -a -G unity $USERNAME
```

You may have to restart or log out of your current session for that change to apply. Check your groups by running the `groups` command.

## Known Bugs

There is a bug in the current version of the Unity 2020.3 Linux Editor where you cannot add an existing project to the UnityHub. You can get around this error by first adding a new project, opening the project, closing the project, then adding your existing project. After you have added your existing project you should be able to delete the new project you created and remove it from the UnityHub.
