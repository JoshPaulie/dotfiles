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


# Get to stowing!
echo "${YELLOW}Setting up dotfiles..${NC}"
for dir in */; do
	if [ -d "$dir" ]; then
		info_msg "Stowing" "$dir"
		stow "$dir" || error_msg "failed to stow '${BLUE}$dir${NC}'"
	fi
done

