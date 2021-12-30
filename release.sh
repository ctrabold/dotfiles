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
BATS_VERSION=1.5.0
wget --quiet -N https://github.com/bats-core/bats-core/archive/refs/tags/v${BATS_VERSION}.zip -O bats-core.zip
unzip -q -n bats-core.zip
cp -R bats-${BATS_VERSION}/bin/bats .
ln -nfs bats-${BATS_VERSION}/libexec/bats bats
cd ..
echo "INFO installing bats. DONE"

echo "Run tests..."
./bin/bats test/*.bat
