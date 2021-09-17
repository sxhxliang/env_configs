#/bin/bash
sudo apt-get update  
sudo dpkg --configure -a
sudo apt-get install --reinstall ubuntu-desktop  
sudo apt-get install unity  
sudo shutdown -r now 

sudo apt-get install --reinstall lightdm