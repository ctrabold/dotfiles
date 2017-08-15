FIXTURES_HOME="${PWD}/tmp/home"
FIXTURES_OSTYPE="ubuntu"

setup() {
  rm -fr $FIXTURES_HOME
  mkdir -p ${FIXTURES_HOME}/dotfiles
  touch ${FIXTURES_HOME}/.zshrc
  OLD_HOME=$HOME
  OLD_OSTYPE=$OSTYPE
  export HOME=$FIXTURES_HOME
  export OSTYPE=$FIXTURES_OSTYPE
}

teardown() {
  rm -fr $FIXTURES_HOME
  export HOME=$OLD_HOME
  export OSTYPE=$OLD_OSTYPE
}
