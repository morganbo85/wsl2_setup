#!/bin/bash
#
# Sets up WSL to run docker so user doesn't have to use docker desktop
#
# Uncomment Win 11 lines if running on a windows 11 machine
#
# Reference https://dev.to/felipecrs/simply-run-docker-on-wsl2-3o8

# Ensures no older packages are installed
sudo apt-get remove docker docker-engine docker.io containerd runc

# Ensure pre-requisites are installed
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Adds docker apt key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Adds docker apt repository
 echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 

# Refreshes apt repos
sudo apt-get update -y

# Installs Docker CE
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Ensures docker group exists
sudo groupadd docker

# Ensures you are part of it
sudo usermod -aG docker $USER

# Only works in Win10
# Make Docker Daemon start on WSL initialization:
sudo bash -c 'echo "if service docker status 2>&1 | grep -q "is not running"; then
    wsl.exe -d "${WSL_DISTRO_NAME}" -u root -e /usr/sbin/service docker start >/dev/null 2>&1
fi" >> ~/.profile'

###
# Win11
# sudo bash -c 'echo "[boot]
# systemd=true" >> /etc/wsl.conf'
###
echo ""
docker version
echo ""

echo "Now, close your shell and open another for taking the group changes into account"
echo ""
exit
