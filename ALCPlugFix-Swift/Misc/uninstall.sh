#!/bin/bash

#  install.sh
#  ALCPlugFix-Swift
#
#  Created by Nick on 10/14/20.
#  

# Get hold of actual directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
pledit=/usr/libexec/PlistBuddy

# Clean up old installs
function cleanUpOldInstall() {
    # Remove codec commander based ALCPlugFix
    sudo launchctl unload /Library/LaunchAgents/good.win.ALCPlugFix.plist
    sudo rm -rf /Library/LaunchAgents/good.win.ALCPlugFix.plist
    
    # Remove any existing alc-verb install
    sudo launchctl unload /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
    sudo rm -rf /Library/LaunchAgents/com.black-dragon74.ALCPlugFix.plist
}

# Function that exits with an error code and message
function abort() {
    echo $1
    exit 1
}

echo "**                                          **"
echo "** UnInstalling ALCPlugFix (AppleALC variant) **"
echo "**                                          **"


# Set the logs to be ~/Library/Logs
#$pledit -c "Set StandardOutPath ${HOME}/Library/Logs/alcplugfix_stdout.log" ./com.black-dragon74.ALCPlugFix.plist || abort "Failed to write STDOUT logpath to plist"
#$pledit -c "Set StandardErrorPath ${HOME}/Library/Logs/alcplugfix_stderr.log" ./com.black-dragon74.ALCPlugFix.plist || abort "Failed to write STDERR logpath to plist"

echo ""

echo "**        Removing old installs             **"
cleanUpOldInstall 2>/dev/null
