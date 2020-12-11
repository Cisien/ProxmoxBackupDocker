#!/bin/bash

chown backup:backup /etc/proxmox-backup
chmod 700 /etc/proxmox-backup
chown backup:backup /var/log/proxmox-backup

# Start the first process
/usr/lib/x86_64-linux-gnu/proxmox-backup/proxmox-backup-api &
echo "proxmox-backup-api started"
sleep 10
# Start the second process
sudo -u backup /usr/lib/x86_64-linux-gnu/proxmox-backup/proxmox-backup-proxy &
echo "proxmox-backup-proxy started"

while /bin/true; do
  sleep 60
done
