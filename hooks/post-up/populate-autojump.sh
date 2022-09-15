#!/bin/bash
# This script adds all folders in the workspace to autojump
# so you can jump to all projects automatically after the setup
#
# USAGE
#
# j project-name
find $HOME/workspace -type d -maxdepth 1 -exec autojump --add "{}" \;
