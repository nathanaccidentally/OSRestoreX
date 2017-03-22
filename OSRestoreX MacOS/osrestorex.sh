#!/bin/bash

echo "Welcome to OSRestoreX for MacOS. This will walk you through the process of restoring your device to the default firmware."
echo "Several times throughout running OSRestoreX, you will be promted for user input."

read -p "Would you like to continue? (y / n) " -n 1 -r
echo "" # For new line.
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "OK! Trying to contact device. Make sure you have dropbear and local SSH enabled..."
    echo "You may be prompted for a root password for the device."
fi

ssh -l root -p 2222  127.0.0.1 'bash -s' < semierase.sh