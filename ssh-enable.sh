#!/bin/sh
set -e

echo "==> Installing and configuring OpenSSH..."
apk add --no-cache openssh

# Ensure root login and password/key auth settings are cleanly applied
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Generate host keys if they don't already exist
ssh-keygen -A

# Enable and start the SSH service via OpenRC
rc-update add sshd default
rc-service sshd restart

echo "==> SSH setup complete."
