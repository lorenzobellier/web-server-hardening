#!/bin/bash
#Install Apache Server and enable HTTPS

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

apt update
apt install -y apache2
systemctl enable apache2
systemctl start apache2

#enable UFW and allow HTTP/HTTPS
ufw allow 'Apache Full'
ufw enable

echo "Web server installed and basic firewall configured"
