#!/bin/bash

# add rhel user to wheel
# Unregister and register the VM
subscription-manager clean
subscription-manager register --activationkey=12-5-22-instruqt --org=12451665 --force

/usr/sbin/usermod -a -G wheel rhel
# allow passwordless sudo for wheel group
/usr/bin/sed -i '
    /%wheel\s\+ALL=(ALL)\s*NOPASSWD:\s*LOG_INPUT:\s*LOG_OUTPUT:\s*ALL/{
        s/^#\+\s*//
        b
    }
    /^[^#].*wheel/s/^/#/
    ' /etc/sudoers
/usr/bin/sed -i 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers

timedatectl set-timezone America/New_York
