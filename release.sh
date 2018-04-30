#!/bin/bash -e
# This script tests the repository with 'bats' test
# and creates a new stable tag when the tests are green.
#
# Please make sure that you committed all local changes
# before releasing a new 'stable' branch.
#
# @see https://github.com/sstephenson/bats
echo "INFO installing bats to run tests."
mkdir -p bin
cd bin
wget --quiet -N https://github.com/sstephenson/bats/archive/v0.4.0.zip -O v0.4.0.zip
unzip -q -n v0.4.0.zip
cp -R bats-0.4.0/bin/bats .
ln -nfs bats-0.4.0/libexec/bats bats
cd ..
echo "INFO installing bats. DONE"

echo "Run tests..."
./bin/bats test/*.bat
