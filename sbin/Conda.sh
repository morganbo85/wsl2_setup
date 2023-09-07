#!/bin/bash
#
# Simple script to download Conda3
# 2023-09-01
# Updated path for download
# and set to enforce conda-forge
# bmorgan
#

# Define the URL of the Anaconda repository
repo_url="https://repo.anaconda.com/archive/Anaconda3-2023.03-Linux-x86_64.sh"

sudo apt update && sudo apt upgrade -y

sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y

# Download conda
wget $repo_url

# Check if the download was successful
CONDASH=$(find ./ -maxdepth 1 -type f -name "Anaconda3-*.sh")
if [ -f "${CONDASH}" ]; then

  echo "Download successful!"
  sudo bash ./Anaconda*.sh -b -f -u -p /opt/anaconda3
else
  echo "Download failed."
fi

# Sets conda-forge channel and removes defaults
/opt/anaconda3/condabin/conda config --add channels conda-forge
/opt/anaconda3/condabin/conda config --set channel_priority strict
/opt/anaconda3/condabin/conda config --remove channels defaults

# Runs conda init for user and 
# Sources file so you don't have to
# Log out and back in
/opt/anaconda3/condabin/conda init
source ~/.bashrc



