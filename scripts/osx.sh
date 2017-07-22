#!/bin/sh
#
# Thanks at @mathiasbynens
# Link : https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Ask for the administrator password upfront
sudo -v

# General {
    # Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "

    # Save to disk (not to iCloud) by default
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

    # Automatically quit printer app once the print jobs complete
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

    # Disable the “Are you sure you want to open this application?” dialog
    defaults write com.apple.LaunchServices LSQuarantine -bool false

    # Disable automatic termination of inactive apps
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

    # Require password immediately after sleep or screen saver begins
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0

    # Save screenshots to the desktop
    defaults write com.apple.screencapture location -string "${HOME}/Desktop"

    # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
    defaults write com.apple.screencapture type -string "png"

    # Disable shadow in screenshots
    defaults write com.apple.screencapture disable-shadow -bool true

    # Enable subpixel font rendering on non-Apple LCDs
    defaults write NSGlobalDomain AppleFontSmoothing -int 2

    # Enable HiDPI display modes (requires restart)
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

    # Use AirDrop with every interface.
    defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

    # Set fast key repeat
    defaults write NSGlobalDomain KeyRepeat -int 0

    # Turn On Always Verbose Booting for OS X
    sudo nvram boot-args="-v"

    # Check for software updates daily, not just once per week
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# }

# Finder {
    # Always open everything in Finder's list view.
    defaults write com.apple.Finder FXPreferredViewStyle Nlsv

    # Show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Allow text selection in Quick Look
    defaults write com.apple.finder QLEnableTextSelection -bool true

    # Show the user library folder
    chflags nohidden ~/Library

    # Disable the warning when changing a file extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    # Avoid creating .DS_Store files on network volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    # Disable disk image verification
    defaults write com.apple.frameworks.diskimages skip-verify -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

    # Automatically open a new Finder window when a volume is mounted
    defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
    defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
    defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

    # Disable shadow in screenshots
    defaults write com.apple.screencapture disable-shadow -bool true

    # Enable subpixel font rendering on non-Apple LCDs
    defaults write NSGlobalDomain AppleFontSmoothing -int 2

    # Enable HiDPI display modes (requires restart)
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
# }

# Dock {
    # Don’t animate opening applications from the Dock
    defaults write com.apple.dock launchanim -bool false

    # Remove the auto-hiding Dock delay
    defaults write com.apple.dock autohide-delay -float 0

    # Remove the animation when hiding/showing the Dock
    defaults write com.apple.dock autohide-time-modifier -float 0

    # Automatically hide and show the Dock
    defaults write com.apple.dock autohide -bool true

    # Add iOS Simulator to Launchpad
    sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"
# }

# Safari {
    # Privacy: don’t send search queries to Apple
    defaults write com.apple.Safari UniversalSearchEnabled -bool false
    defaults write com.apple.Safari SuppressSearchSuggestions -bool true

    # Enable Safari’s debug menu
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

    # Enable the Develop menu and the Web Inspector in Safari
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# }


# Transmission {
    # Don’t prompt for confirmation before downloading
    defaults write org.m0k.transmission DownloadAsk -bool false

    # Trash original torrent files
    defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

    # Hide the donate message
    defaults write org.m0k.transmission WarningDonate -bool false

    # Hide the legal disclaimer
    defaults write org.m0k.transmission WarningLegal -bool false
# }

