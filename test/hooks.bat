#!/usr/bin/env bats

load test_helper

@test "Override HOME for tests" {
  run echo $HOME
  [ "$status" -eq 0 ]
  echo "$output" | grep tmp/home$
}

#
# pre-up
#

@test "Creates folders to override dotfiles locally" {
  [ ! -d "${HOME}/dotfiles-local" ]
  run bash .chezmoiscripts/run_before_00-install-pre-requisites.sh
  [ "$status" -eq 0 ]
  [ -d "${HOME}/dotfiles-local" ]
}
