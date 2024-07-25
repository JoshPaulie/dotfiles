#!/bin/bash

error_msg() {
	echo "Error: $1"
	exit 1
}

banner() {
    local message="$1"
    local border_char="#"
    local length=${#message}
    local border_length=$((length + 6))
    local border_line=$(printf "%0.s$border_char" $(seq 1 $border_length))

    echo
    echo "$border_line"
    echo "$border_char  $message  $border_char"
    echo "$border_line"
    echo
}

## Header ##
banner "Welcome to Macstrap!"

##################################################
## Ensure Homebrew.sh install (package manager) ##
##################################################
banner "Ensuring Homebrew"
if ! command -v brew &> /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || error_msg "Failed to run Homebrew install"
	# shellcheck disable=SC2016
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	echo "Homebrew has been installed. Please close and start a new shell"
	exit
else
	echo "Homebrew is already installed"
fi

############################
## Install daily software ##
############################
banner "Installing daily software"
# grep	:: removes comments, blank lines
# tr	:: flattens lines into single line
# shellcheck disable=SC2046
brew install $(grep -vE '^\s*#|^\s*$' macapps.txt | tr '\n' ' ') || error_msg "Failed to install daily software"
# shellcheck disabled bc we want word splitting

#########################
## Set system settings ##
#########################
banner "Setting system prefrences"
# Many, if not all, all of the following settings are from the very helpful
# - https://macos-defaults.com/
# - https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# The rest are discovered by creating a snapshot of `defaults read`, imperatively making the change, snap shotting `defaults read` again, & diff'ing the two

# Globals
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" # Show file extension wherever possible
defaults write NSGlobalDomain "AppleInterfaceStyle" -string "Dark" # Appearance: dark mode

# Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" # View style to "List"

# Dock
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "tilesize" -int "54"
defaults write com.apple.dock "show-recents" -bool "false"

read -p "Clear the dock of default icons? (y/n) " answer
[[ $answer =~ ^[yY]$ ]] && defaults write com.apple.dock persistent-apps -array

# Keyboard
defaults write NSGlobalDomain "KeyRepeat" -int "2"
defaults write NSGlobalDomain "InitialKeyRepeat" -int "25"
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

# Accessibility
sudo defaults write com.apple.universalaccess "reduceMotion" -bool "true"

# Enable battery percentage
defaults write "$HOME"/Library/Preferences/ByHost/com.apple.controlcenter.plist "BatteryShowPercentage" -bool "true"

# Auto-nonsense
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false # No auto caps
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false # No auto dashes
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false # No auto periods
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false # No "smart" quotes

# Screenshots
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

#######################
## Run dotfile setup ##
#######################
banner "Stowing dotfiles"
./setup.sh

#####################
## Reboot reminder ##
#####################
banner "Many settings don't take effect until the machine is restarted."
echo "Rebooting in 15 seconds, exit script to stop."
sleep 15
sudo reboot
