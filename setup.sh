#!/bin/sh
echo "Copying plist..."
sudo cp ./setComputerName.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/setComputerName.plist

echo "Copying shell script..."
sudo mkdir /opt
sudo cp ./setComputerName.sh /opt/

echo "Updating permissions on script..."
sudo chown root /opt/setComputerName.sh
sudo chmod +rwx /opt/setComputerName.sh

echo "Installing plist with launchctl..."
sudo launchctl unload /Library/LaunchDaemons/setComputerName.plist
sudo launchctl load -w /Library/LaunchDaemons/setComputerName.plist

if [[ $? != 0 ]]; then
  echo "plist installation failed!"
  exit
fi
echo "Complete!"
