# OSRestoreX and Terminal
A semi-restore Alternative for Jailbroken iOS devices.

You can build OSRestoreX yourself or use the Mac version via SSH.

## Steps for installation:
OSRestoreX does all the heavy lifting for you, so all you need to do is follow these easy steps:

1. Install iCleaner
2. Uninstall Cydia Substrate
3. Run iCleaner
4. Now click the "+" in iCleaner, then preference files, then remove all of them.
5. Uninstall iCleaner
6. Install OSRestoreX (This will get everything set up for a restore. This can take up to 5 minutes so be paitent.)
7. Go into settings app and 'Erase all Content and Settings'
8. Enjoy your freshly restored device on a Jailbreakable firmware!

This will remove all tweaks from your device and reverse stashing by Coolstars Stashing for 9.3.3-10. It will do quite a bit to remove all un-needed files from your device to make for a fresher install as best as it can. It will also remove mobilesubstrate from your device so dpkg should handle removal of leftover files. (Including Anemone themes and their data.)

## Command Line Utility:
Also on this page is command line utility; This can be run over SSH or via MTerminal. It is exactly the same as the default package but it can be triggered when you'd prefer rather than having to run it immideatley.

**But be warned:** This can be triggered by any ol' Cydia tweak with a postinst script so I'd be **VERY** careful if you install this, although I reccomend you don't. You can trigger OSRestore by typing `osrestore` from the command line.

## MacOS OSRestoreX
This version of OSRestoreX can be run entirley from MacOS with no device interaction at all. Can be helpful for people who are having issues or just would prefer to use OSRestoreX on a Mac.

You can run it by opening Terminal and entering `cd /Path/to/OSRestore MacOS/` and then dragging in osrestorex.sh. That should walk you through the process and 'semi-restore' your device.

### DISCLAIMER:

I have only tried this on iOS 10.2 and 10.1.1 and OSRestore may not be compatible with other firmwares. I am not responsible for any damage to your device.

Although I work hard to make sure OSRestore works perfectly, bugs may slip through and issues may happen. If someting happens feel free to PM me on reddit /u/nathanaccidentally. Thanks.

**Thanks to contributions from ipad_kid (great work by the way) and thebeastgamer25.**
