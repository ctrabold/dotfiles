#!/bin/bash
# This script creates default folders
# 1) a local dotfiles folder
#
# Files in this folder override the 'default' files
# so you can modify the dotfiles without forking.
#
# Use the same filenames to override the default files.
#
# 2) a central folder for projects called 'workspace'

mkdir -p $HOME/dotfiles-local
mkdir -p $HOME/workspace
