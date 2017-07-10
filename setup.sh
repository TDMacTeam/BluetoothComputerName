#!/bin/sh
echo "Copying plist..."
sudo cp ./setComputerName.plist /Library/LaunchDaemons/

echo "Copying bash script..."
cp ./setComputerName.sh ~/

echo "Installing plist with launchctl..."
sudo launchctl -w load /Library/LaunchDaemons/setComputerName.plist
