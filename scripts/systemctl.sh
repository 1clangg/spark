#!/bin/bash

# Spark Linux
# Debloat systemctl and enable useful things

systemctl enable fstrim.timer
systemctl enable systemd-resolved
systemctl enable spark*.service
systemctl enable tmp.mount

systemctl disable \
  avahi-daemon.service \
  avahi-daemon.socket \
  bluetooth.service \
  sysstat.service \
  sysstat-collect.timer \
  sysstat-rotate.timer \
  sysstat-summary.timer \
  mdcheck_continue.timer \
  mdcheck_start.timer \
  mdmonitor-oneshot.timer \
  xfs_scrub_all.timer \
  system-xfs_scrub.slice \
  lynis.timer \
  man-db.timer \
  live-config.service \
  uuidd.socket
