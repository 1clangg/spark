#!/bin/bash
# spark fix live user

# remove live user
userdel -r user 2>/dev/null || true
groupdel user 2>/dev/null || true

# remove leftover home
rm -rf /home/user

# clear histories
find /home -name ".bash_history" -delete
rm -f /root/.bash_history

# clear caches
rm -rf /var/cache/*
rm -rf /tmp/*
rm -rf /var/tmp/*

# reset machine identity
truncate -s 0 /etc/machine-id
rm -f /var/lib/dbus/machine-id

# remove network configs
rm -f /etc/NetworkManager/system-connections/*

# remove ssh host keys
rm -f /etc/ssh/ssh_host_*
