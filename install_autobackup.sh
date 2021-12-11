#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

this_dir=$(pwd)

ln -sf $this_dir/autobackup/40-backup.rules /etc/udev/rules.d/40-backup.rules 
ln -sf $this_dir/autobackup/automatic-backup.service /etc/systemd/system/automatic-backup.service
ln -sf $this_dir/autobackup/automatic-backup.timer /etc/systemd/system/automatic-backup.timer

ln -sf $this_dir/autobackup/autoeject-no /etc/backups/autoeject-no
ln -sf $this_dir/autobackup/backup.disks /etc/backups/backup.disks
ln -sf $this_dir/autobackup/run.sh /etc/backups/run.sh

systemctl daemon-reload
udevadm control --reload
