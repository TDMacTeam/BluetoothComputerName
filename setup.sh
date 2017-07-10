#!/bin/sh
echo "Copying plist..."
sudo cp ./setComputerName.plist /Library/LaunchDaemons/

echo "Copying shell script..."
sudo mkdir /opt
sudo cp ./setComputerName.sh /opt/

echo "Updating permissions on script..."
sudo chown root /opt/setComputerName.sh
sudo chmod +rwx /opt/setComputerName.sh

echo "Installing plist with launchctl..."
sudo launchctl load -w /Library/LaunchDaemons/setComputerName.plist

if [[ $? != 0 ]]; then
  echo "plist installation failed!"
  exit
fi
echo "Complete!"
