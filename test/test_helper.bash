FIXTURES_HOME="${PWD}/tmp/home"

setup() {
  rm -fr $FIXTURES_HOME
  mkdir -p ${FIXTURES_HOME}/dotfiles
  touch ${FIXTURES_HOME}/.zshrc
  OLD_HOME=$HOME
  export HOME=$FIXTURES_HOME
}

teardown() {
  rm -fr $FIXTURES_HOME
  export HOME=$OLD_HOME
}
