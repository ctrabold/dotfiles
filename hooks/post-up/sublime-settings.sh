#!/bin/bash

# Symlink SublimeText3 settings
# @see https://www.sublimetext.com/
if [[ $OSTYPE == darwin* ]]; then
  SUBLIME_CONFIG_FOLDER=$HOME/Library/Application\ Support/Sublime\ Text\ 3
else
  SUBLIME_CONFIG_FOLDER=$HOME/.config/sublime-text-3
fi

if [[ -d $SUBLIME_CONFIG_FOLDER ]]; then
  echo "Symlink sublimetext settings"
  ln -nfs "$HOME/dotfiles/sublime-text-3/Installed Packages" "$SUBLIME_CONFIG_FOLDER/Installed Packages"
  ln -nfs "$HOME/dotfiles/sublime-text-3/Packages" "$SUBLIME_CONFIG_FOLDER/Packages"
fi
