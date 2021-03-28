#!/bin/bash

# Copyright 2021, Boppy Games LLC

# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"), 
# to deal in the Software without restriction, including without limitation 
# the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom the 
# Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

set -eou pipefail

echo "Unity3D Installer Version 0.1"
echo "Notice: This script is provided without a warranty, check license before use."
echo "Notice: Boppy Games, LLC is not affiliated with Unity."
read -p "Press [Enter] to accept the license agreement."

[ "$USER" == "root" ] && echo "Don't run this script as root!" && exit 1

sudo echo "";

# Install Unity dependency
sudo apt install libgconf-2-4 -y

# .NET DEB
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm -f packages-microsoft-prod.deb

# Install the .NET SDK
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0
  
# Create a new group to use for Unity
sudo groupadd unity
sudo usermod -a -G unity $USER

# Setup the Unity application directory
sudo mkdir -p /opt/Unity/Hub /opt/Unity/Editors
sudo chown -R nobody:unity /opt/Unity
sudo chmod -R g+ws /opt/Unity
wget https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage -O /tmp/UnityHub.AppImage
sudo mv /tmp/UnityHub.AppImage /opt/Unity/Hub/UnityHub.AppImage
chmod +x /opt/Unity/Hub/UnityHub.AppImage

# Install Unity for the entire system
# Setup the Unity .desktop file (allows you to search for Unity in Gnome)
echo "[Desktop Entry]
Name=UnityHub
Comment=Manager for UnityEditor Installations
Exec=/opt/Unity/Hub/UnityHub.AppImage
Terminal=false
Type=Application
Categories=Development;Graphics;IDE;
Icon=/opt/Unity/Hub/unity-icon
Keywords=3d;cg;animation;rendering;render engine;game engine;unity;hub;" > /tmp/unity.desktop
sudo mv /tmp/unity.desktop /usr/share/applications/

# Download an icon to use for the desktop launcher
wget 'https://i.redd.it/estpv0c6iw841.jpg' -O /tmp/unity-icon.jpg
sudo mv /tmp/unity-icon.jpg /usr/share/icons

echo "The installation process was successful."
echo "Please restart your PC!"
echo ""
read -p "Press [Enter] to restart now, or Ctrl-C to cancel."
sudo reboot
