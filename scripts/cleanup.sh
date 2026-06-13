#!/bin/bash

# Spark Linux
# Cleanup 

# Clear apt cache
apt autoremove --purge -y
apt clean
apt autoclean

# Clear logs
journalctl --vacuum-time=1s 2>/dev/null || true
find /var/log -type f -exec truncate -s 0 {} \;

# Clear temp files
rm -rf /tmp/*
rm -rf /var/tmp/*

# Clear thumbnail cache
rm -rf /home/user/.cache/thumbnails/*
rm -rf /root/.cache/*

# Clear package lists (save space)
rm -rf /var/lib/apt/lists/*

apt remove --purge -y \
  gcc-14 g++-14 cpp-14 \
  gcc g++ cpp \
  linux-headers-7.0.11-1-liquorix-amd64 2>/dev/null
apt autoremove --purge -y

rm -f /usr/share/mythes/th_en_US_v2.dat
apt remove --purge -y mythes-en-us 2>/dev/null

rm -f /var/cache/apt/pkgcache.bin
rm -f /var/cache/apt/srcpkgcache.bin
apt clean

# Clear bash history
history -c
cat /dev/null > /root/.bash_history
cat /dev/null > /home/user/.bash_history
