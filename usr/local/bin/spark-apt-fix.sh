#!/bin/sh
# Spark Post-install package fix
# Runs after Calamares installs to restore held packages

# Remove any holds
apt-mark unhold sudo kitty bluetooth bluez \
  openssh-client cryptsetup switcheroo-control \
  powertop vainfo vdpauinfo vulkan-tools task-laptop 2>/dev/null

# Reinstall anything Calamares accidentally removed
apt-get install -y \
  sudo \
  kitty \
  openssh-client \
  switcheroo-control \
  powertop \
  vainfo \
  vdpauinfo \
  vulkan-tools 2>/dev/null

echo "Spark post-install fix complete!"
