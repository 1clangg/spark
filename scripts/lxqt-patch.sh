#!/bin/bash

# Spark Linux
# Patch locale + icon pack error

# This tells the system: "When you look for 'applications-accessories', use 'applications-utilities' instead"
ln -s /usr/share/icons/breeze-dark/categories/32/applications-utilities.svg /usr/share/icons/breeze-dark/categories/32/applications-accessories.svg

# Locale
locale-gen en_US.UTF-8
localepurge

# Icons
gtk-update-icon-cache -f /usr/share/icons/breeze-dark
gtk-update-icon-cache -f /usr/share/icons/breeze

