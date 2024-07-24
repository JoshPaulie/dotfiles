#!/bin/bash

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'


error_msg() {
	echo "${RED}Error: $1${NC}"
	exit 1
}

info_msg() {
	echo "${BLUE}$1{$NC}: $2"
}


## Header ##
echo "####################"
echo "${YELLOW}Welcome to Macstrap!${NC}"
echo "####################"

##################################################
## Ensure Homebrew.sh install (package manager) ##
##################################################
info_msg "Ensuring" "Homebrew is installed!"
if ! command -v brew &> /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# shellcheck disable=SC2016
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/bex/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "${GREEN}Homebrew is already installed"
fi

############################
## Install daily software ##
############################
# grep	:: removes comments, blank lines
# tr	:: flattens lines into single line
info_msg "Installing" "daily software"
brew install "$(grep -vE '^\s*#|^\s*$' macapps.txt | tr '\n' ' ')"

#########################
## Set system settings ##
#########################
info_msg "Setting" "system settings"
# Many, if not all, all of the following settings are from the very helpful https://macos-defaults.com/
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

# Keyboard
defaults write NSGlobalDomain "KeyRepeat" -int "2"
defaults write NSGlobalDomain "InitialKeyRepeat" -int "25"

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
./setup.sh
