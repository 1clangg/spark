#!/bin/bash

# Spark Linux
# PipeWire patching

mkdir -p /etc/wireplumber
ln -sf /usr/lib/systemd/user/pipewire.service \
  /etc/skel/.config/systemd/user/default.target.wants/pipewire.service

ln -sf /usr/lib/systemd/user/pipewire-pulse.service \
  /etc/skel/.config/systemd/user/default.target.wants/pipewire-pulse.service

ln -sf /usr/lib/systemd/user/wireplumber.service \
  /etc/skel/.config/systemd/user/default.target.wants/wireplumber.service
