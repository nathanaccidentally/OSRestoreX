#!/bin/bash

echo "OSRestoreX will assist in erasing your device. Thanks for the method /u/changemylife99!"
echo "Thanks to major contributions from ipad_kid and thebeastgamer25"
echo "If you would like to quit, exit Terminal NOW! I have purpousefully added a 10 second hang time for you to exit if needed. Use this time wisley."
sleep 10

echo "Starting!"
sleep 1

test "cat /etc/apt/sources.list.d/* | grep http://apt.thebigboss.org/repofiles/cydia/" = "" && { 
echo "Updating your repos. This is needed to install MTerminal. If you have it, it will re-install to trigger stashing."
echo deb http://apt.thebigboss.org/repofiles/cydia/ stable main >> cydia.list
apt-get update
}
echo "Installing MTerminal. This is to ensure Stashings is properly triggered."
test "dpkg --get-selections | grep -v deinstall | grep com.officialscheduler.mterminal" = "" && apt-get install com.officialscheduler.mterminal
test "dpkg --get-selections | grep -v deinstall | grep com.officialscheduler.mterminal" != "" && apt-get install --reinstall com.officialscheduler.mterminal
echo "Done! Moving on to the actual erase!"

echo "THIS IS YOUR LAST CHANCE TO CLOSE TERMINAL/SSH WITHOUT ERASING. YOU HAVE 5 SECONDS."
sleep 5

echo "Starting erase…"
rm -f /.installed_yaluX
echo "Removed Yalu file marker file, this will allow Cydia to re-install when you re-jailbreak and re-enable SSH access."

cd /var/mobile/

echo "Removing /var/mobile and it's contents…"
rm -R Backups
rm -R Containers
rm -R Documents
rm -R Downloads
rm -R Media
rm -R MobileSoftwareUpdate
echo "Removed all contents except for Library from /var/mobile."

echo "Removing the contents of /var/mobile/Library except for carrier settings and important files..."
echo "This step could take a while"

cd /var/mobile/Library

echo "Moved to /var/mobile/Library. Final erase starting."

filecontent=(`ls | grep -v Carrier | grep -v Operator | grep -v Preferences`)
for t in "${filecontent[@]}"
do
rm -r "$t"
done

echo "Removing stashed tweaks..."
rm -r /var/db/stash

echo "Done removing stashed tweaks. Removing Cydia Substrate..."
echo "This should have dpkg remove all leftover tweak files and such."
apt-get --yes remove mobilesubstrate
echo "Removed mobilesubstrate. DO NOT RESPRING, I REPEAT, DO NOT RESPRING. YOU HAVE BEEN WARNED."
sleep 5

echo "Removing dropbear to disable SSH."
cd /usr/local/bin
rm dropbear
rm dropbearconvert
rm dropbearkey
rm /Library/LaunchDeamons/dropbear.plist
echo "Finished removing dropbear."
cd

echo "Removing jailbreak applications, this can take a very long time depending on how many tweaks you have installed. Thanks to /u/ipad_kid for the script for this."
cd /Applications
for t in `ls`
do
if dpkg -S $t > /dev/null 2> /dev/null
then
test "$t" != "Cydia.app" && {
echo Removing $t
rm -r $t
}
fi
done
echo "This should have removed all jailbreak applications except Cydia"

echo "Removing any other temporary files caused by Cydia and other tweaks."
rm /tmp/cydia.log
rm /tmp/flush.log

rm -r /Library/Themes
echo "Just removed Cydia log. More could be added soon over time, but this shouldnt matter too much."

echo "Running final step, removing Cydia."
rm -R /Applications/Cydia.app
rm -R /var/lib/cydia
echo "Removed Cydia.app!"

echo "PLEASE GO TO SETTINGS IMMEDIATLEY AND USE ERASE ALL CONTENTS AND SETTINGS! THIS PACKAGE ONLY DOES HALF OF THE WORK NEEDED. PLEASE DO THIS!"

exit
