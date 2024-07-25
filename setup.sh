#!/bin/bash


# Get to stowing!
echo "Setting up dotfiles.."
for dir in */; do
	if [ -d "$dir" ]; then
		echo "Stowing $dir"
		stow "$dir" || echo "Error: Failed to stow $dir"
	fi
done

