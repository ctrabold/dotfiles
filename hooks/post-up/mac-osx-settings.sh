#!/bin/bash

#
# Set defaults for OSX 10.8.x
# @see https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
if [[ $OSTYPE == darwin* ]]; then
  echo "Apply Mac OS X settings"

  ###############################################################################
  # General UI/UX #
  ###############################################################################

  # Disable mobile backups
  # @see https://classicyuppie.io/what-crap-is-this-os-xs-mobilebackups/
  sudo tmutil disablelocal

  # Exclude folders from time machine
  #sudo tmutil addexclusion -p "/Users/$USER/Desktop/folder"

  # Disable the sound effects on boot
  sudo nvram SystemAudioVolume=" "

  # Disable captive network window
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false

  # Disable transparency in the menu bar and elsewhere on Yosemite
  defaults write com.apple.universalaccess reduceTransparency -bool true

  # Menu bar: show remaining battery time (on pre-10.8); hide percentage
  defaults write com.apple.menuextra.battery ShowPercent -string "NO"
  defaults write com.apple.menuextra.battery ShowTime -string "YES"

  # Menu bar: hide the useless Time Machine and Volume icons
  defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


  # Change Desktop default BackgroundColor to grey
  osascript -e 'tell application "Finder"' -e 'set theFile to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Aqua Graphite.png"' -e 'set desktop picture to (theFile as alias)' -e 'end tell'

  # Always show scrollbars
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

  # Increase window resize speed for Cocoa applications
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

  # Expand save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  # Expand print panel by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  # Save to disk (not to iCloud) by default
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

  # Automatically quit printer app once the print jobs complete
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  # Disable the “Are you sure you want to open this application?” dialog
  #defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Disable the crash reporter
  #defaults write com.apple.CrashReporter DialogType -string "none"

  # Set Help Viewer windows to non-floating mode
  defaults write com.apple.helpviewer DevMode -bool true

  # Disable Notification Center and remove the menu bar icon
  #launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

  # Disable smart quotes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

  # Disable smart dashes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


  ###############################################################################
  # Trackpad, mouse, keyboard, Bluetooth accessories, and input #
  ###############################################################################

  # Enable full keyboard access for all controls
  # (e.g. enable Tab in modal dialogs)
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # Use scroll gesture with the Ctrl (^) modifier key to zoom
  defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
  defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
  # Follow the keyboard focus while zoomed in
  defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

  # Disable press-and-hold for keys in favor of key repeat
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Set a blazingly fast keyboard repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 0


  ###############################################################################
  # Screen #
  ###############################################################################

  # Require password immediately after sleep or screen saver begins
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  # Disable screensafer
  defaults -currentHost write com.apple.screensaver idleTime 0

  # Save screenshots to a dedicated folder
  defaults write com.apple.screencapture location ~/Pictures/Screenshots

  # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
  defaults write com.apple.screencapture type -string "png"

  # Disable shadow in screenshots
  defaults write com.apple.screencapture disable-shadow -bool true


  ###############################################################################
  # Finder #
  ###############################################################################

  # Finder: disable window animations and Get Info animations
  defaults write com.apple.finder DisableAllAnimations -bool true

  # Show icons for hard drives, servers, and removable media on the desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  # Finder: show hidden files by default
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Finder: show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Finder: allow text selection in Quick Look
  defaults write com.apple.finder QLEnableTextSelection -bool true

  # Display full POSIX path as Finder window title
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # When performing a search, search the current folder by default
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # Disable the warning when changing a file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # Enable spring loading for directories
  defaults write NSGlobalDomain com.apple.springing.enabled -bool true

  # Remove the spring loading delay for directories
  defaults write NSGlobalDomain com.apple.springing.delay -float 0

  # Avoid creating .DS_Store files on network volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

  # Automatically open a new Finder window when a volume is mounted
  defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
  defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
  defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

  # Show item info below icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

  # Enable snap-to-grid for icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

  # Increase grid spacing for icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

  # Increase the size of icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist



  # Use list view in all Finder windows by default
  # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Expand the following File Info panes:
  # “General”, “Open with”, and “Sharing & Permissions”
  defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true


  ###############################################################################
  # Dock, Dashboard, and hot corners #
  ###############################################################################

  # Enable highlight hover effect for the grid view of a stack (Dock)
  defaults write com.apple.dock mouse-over-hilite-stack -bool true

  # Set the icon size of Dock items to 36 pixels
  defaults write com.apple.dock tilesize -int 36

  # Change minimize/maximize window effect
  defaults write com.apple.dock mineffect -string "scale"

  # Minimize windows into their application’s icon
  defaults write com.apple.dock minimize-to-application -bool true

  # Wipe all (default) app icons from the Dock
  # This is only really useful when setting up a new Mac, or if you don’t use
  # the Dock to launch apps.
  #defaults write com.apple.dock persistent-apps -array ""

  # Don’t animate opening applications from the Dock
  defaults write com.apple.dock launchanim -bool false

  # Disable Dashboard
  defaults write com.apple.dashboard mcx-disabled -bool true

  # Don’t show Dashboard as a Space
  defaults write com.apple.dock dashboard-in-overlay -bool true

  # Reset Launchpad
  find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

  # Hot corners
  # Possible values:
  # 0: no-op
  # 2: Mission Control
  # 3: Show application windows
  # 4: Desktop
  # 5: Start screen saver
  # 6: Disable screen saver
  # 7: Dashboard
  # 10: Put display to sleep
  # 11: Launchpad
  # 12: Notification Center
  # Top left screen corner → Start screen saver
  defaults write com.apple.dock wvous-tl-corner -int 5
  defaults write com.apple.dock wvous-tl-modifier -int 0
  # Top right screen corner → Notification Center
  defaults write com.apple.dock wvous-tr-corner -int 12
  defaults write com.apple.dock wvous-tr-modifier -int 0


  ###############################################################################
  # Safari & WebKit #
  ###############################################################################

  # Set Safari’s home page to `about:blank` for faster loading
  defaults write com.apple.Safari HomePage -string "about:blank"

  # Prevent Safari from opening ‘safe’ files automatically after downloading
  defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

  # Hide Safari’s bookmarks bar by default
  defaults write com.apple.Safari ShowFavoritesBar -bool false

  # Disable Safari’s thumbnail cache for History and Top Sites
  defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

  # Remove useless icons from Safari’s bookmarks bar
  defaults write com.apple.Safari ProxiesInBookmarksBar "()"

  # Enable Safari’s debug menu
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

  # Enable the Develop menu and the Web Inspector in Safari
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true


  ###############################################################################
  # Mail #
  ###############################################################################

  # Disable send and reply animations in Mail.app
  defaults write com.apple.mail DisableReplyAnimations -bool true
  defaults write com.apple.mail DisableSendAnimations -bool true

  # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
  defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

  # Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
  defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

  # Display emails in threaded mode, sorted by date (oldest at the bottom)
  defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
  defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "no"
  defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

  # Force all mail to be displayed as plain text.
  defaults write com.apple.mail PreferPlainText -bool YES


  ###############################################################################
  # Activity Monitor #
  ###############################################################################

  # Show the main window when launching Activity Monitor
  defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

  # Visualize CPU usage in the Activity Monitor Dock icon
  defaults write com.apple.ActivityMonitor IconType -int 5

  # Show all processes in Activity Monitor
  defaults write com.apple.ActivityMonitor ShowCategory -int 0

  # Sort Activity Monitor results by CPU usage
  defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
  defaults write com.apple.ActivityMonitor SortDirection -int 0


  ###############################################################################
  # Address Book, Dashboard, iCal, TextEdit, and Disk Utility #
  ###############################################################################

  # Use plain text mode for new TextEdit documents
  defaults write com.apple.TextEdit RichText -int 0
  # Open and save files as UTF-8 in TextEdit
  defaults write com.apple.TextEdit PlainTextEncoding -int 4
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4


  ###############################################################################
  # Messages #
  ###############################################################################

  # Disable automatic emoji substitution (i.e. use plain text smileys)
  defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

  # Disable smart quotes as it’s annoying for messages that contain code
  defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

  # Disable continuous spell checking
  defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false


  ###############################################################################
  # Google Chrome & Google Chrome Canary                                        #
  ###############################################################################

  # Allow installing user scripts via GitHub Gist or Userscripts.org
  defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
  defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"

  # Disable the all too sensitive backswipe on trackpads
  defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
  defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

  # Disable the all too sensitive backswipe on Magic Mouse
  defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
  defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

  # Use the system-native print preview dialog
  defaults write com.google.Chrome DisablePrintPreview -bool true
  defaults write com.google.Chrome.canary DisablePrintPreview -bool true

  # Expand the print dialog by default
  defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
  defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true


  ###############################################################################
  # GPGMail 2 #
  ###############################################################################

  # Enable signing emails by default
  defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool true


  ###############################################################################
  # Preview #
  ###############################################################################

  # Stop Quicktime and Preview from Auto-Restoring What You Left Open
  defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
  defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false


  ###############################################################################
  # iTunes #
  ###############################################################################

  # Make the iTunes arrow links go to your library instead of the iTunes Store
  defaults write com.apple.iTunes invertStoreLinks -bool true

  # Turn off backups of iPhone/iPod Touch in iTunes during sync (0 to re-enable)
  defaults write com.apple.iTunes DeviceBackupsDisabled 1

  # Disable the Ping sidebar in iTunes
  defaults write com.apple.iTunes disablePingSidebar -bool true

  # Disable all the other Ping stuff in iTunes
  defaults write com.apple.iTunes disablePing -bool true

  # Make ⌘ + F focus the search input in iTunes
  defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"


  ###############################################################################
  # Terminal & iTerm 2                                                          #
  ###############################################################################

  # Only use UTF-8 in Terminal.app
  defaults write com.apple.terminal StringEncodings -array 4

  # Enable “focus follows mouse” for Terminal.app and all X11 apps
  # This means you can hover over a window and start typing in it without clicking first
  defaults write com.apple.terminal FocusFollowsMouse -bool true
  defaults write org.x.X11 wm_ffm -bool true

  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false


  ###############################################################################
  # Time Machine #
  ###############################################################################

  # Prevent Time Machine from prompting to use new hard drives as backup volume
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
else
  echo "No Mac OS detected"
fi
