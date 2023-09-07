# Quick install guide for WSL2 on windows 10

## Manual Setup
Contains 3 simple PowerShell scripts. Need to be run in this order:
1. `VM_Setup.bat` This turns Windows special features for VM on if they are not already on.
2. `wsl_install` This downloads wsl ubuntu 20.04
   * This will at the end open a wsl command prompt and ask you to set up a user.
   * I suggest running `sudo apt update && sudo apt upgrade -y` before moving forward
   * Close this window and go back to the original PS prompt
3. `WSl_2_force` force it to use WSL 2.
   * Not always needed on newer machines but doesn't hurt to run.
  
## sbin
Contains Linux scripts for installing conda3 on wsl
* `Conda.sh`
* `Docker.sh` And a script for setting up docker in WSL

  ## `.condarc`
  A quick script to set conda to use conda-forge
  and to shorten the conda prompt.
  * Probably will move this to sbin in the future.

  
