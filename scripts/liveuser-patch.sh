#!/bin/bash

# Spark Linux
# Live-user patch for LightDM

useradd -m -u 1000 -s /bin/bash -c "Live User" user
echo "user:live" | chpasswd
passwd -d user
usermod -aG sudo,audio,video,netdev,plugdev,cdrom,floppy,dip,bluetooth,scanner user
chmod 440 /etc/sudoers.d/live-user
