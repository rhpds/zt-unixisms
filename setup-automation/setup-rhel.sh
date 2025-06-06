#!/bin/bash
# creating sample data
/usr/bin/touch {anaconda-ks.cfg,original-ks.cfg}
/usr/bin/mkdir /root/openscap_data
/usr/bin/touch /root/openscap_data/{eval_remediate_report.html,eval_remediate_results.xml}

# add rhel user to wheel
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