#!/bin/bash

# Spark Linux
# This is a symlink, thing can break in future
chmod +x ../plymouth/install.sh
../plymouth/install.sh

# patch 
plymouth-set-default-theme -R sparkPlymouth
update-initramfs -u
