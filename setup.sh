#!/bin/sh
echo "Copying plist..."
sudo cp ./setComputerName.plist /Library/LaunchDaemons/

echo "Copying shell script..."
cp ./setComputerName.sh /opt/

echo "Updating permissions on script..."
sudo chown root:root /opt/setComputerName.sh
sudo chmod +rwx /opt/setComputerName.sh

echo "Installing plist with launchctl..."
sudo launchctl -w load /Library/LaunchDaemons/setComputerName.plist

clear
echo "Complete!"
