#!/usr/bin/env bats

load test_helper

@test "Override HOME for tests" {
  run echo $HOME
  [ "$status" -eq 0 ]
  echo "$output" | grep tmp/home$
}


#
# post-up
#

@test "Writes Mac OS X settings only on Mac OS X" {
  run ./hooks/post-up/mac-osx-settings.sh
  [ "$status" -eq 1 ]
  echo "$output" | grep "No Mac OS detected"
}


#
# pre-up
#

@test "Creates folders to override dotfiles locally" {
  [ ! -d "${HOME}/dotfiles-local" ]
  run ./hooks/pre-up/create-dotfiles-local-folder.sh
  [ "$status" -eq 0 ]
  [ -d "${HOME}/dotfiles-local" ]
}
