#!/bin/bash
#Basic hardening for web server

# Install fail2ban
apt install -y fail2ban
systemctl enable fail2ban
systemctl start fail2ban

# Disable server tokens
echo "ServerTokens Prod" >> /etc/apache2/conf-available/security.conf
echo "ServerSignature Off" >> /etc/apache2/conf-available/security.conf
systemctl restart apache2

echo "Web server hardened with fail2ban and security config"
