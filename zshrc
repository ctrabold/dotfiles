# Setup environment
#!/usr/local/bin/zsh
umask 0022

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=13
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
REPORTTIME=10
TERM=xterm-256color
DEFAULT_USER=$USER

export LANG="en_US.UTF-8"
export GREP_OPTIONS="--color=auto --exclude=\*.svn\* --exclude=\*.git\*"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

if [[ $OSTYPE == darwin* ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home);
else
  export JAVA_HOME="/usr/bin/java";
fi

# Set git editor
export EDITOR='vim -f'
export GIT_EDITOR='vim -f'
export VIM_APP_DIR='/usr/bin/vim'

# Get helpful ruby warnings when calling scripts
#export RUBYOPT="w"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
MY_ZSH_PLUGINS="autojump bundler docker extract git-extras gitfast golang gradle jira mix tmux tmuxinator vagrant"

if [[ $OSTYPE == darwin* ]]; then
  MY_ZSH_PLUGINS="${MY_ZSH_PLUGINS} osx"
fi

plugins=(`echo ${MY_ZSH_PLUGINS}`)

source $ZSH/oh-my-zsh.sh


# Setup PATH to make binaries visible
#
# @see http://en.wikipedia.org/wiki/PATH_%28variable%29
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=/usr/local/share/npm/bin:$PATH
export GOPATH=$HOME/workspace/golang
export PATH=$GOPATH/bin:/usr/local/opt/go/libexec/bin:$PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin/":$PATH

# Make openssl visible e.g. for crystal
# @see https://github.com/crystal-lang/crystal/issues/4745#issuecomment-332553374
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# Shell config
#
# @see http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput
autoload -Uz compinit
compinit
unsetopt correct_all


# Setup history
#
# @see http://zsh.sourceforge.net/Doc/Release/Options.html#History

# Ignore commands starting with a space, duplicates,
# and a few others.
export HISTIGNORE="[ ]*:&:bg:fg:ls -l:ls -al:ls -la:ls1:lsa:lsr:gits:gits?"

HISTSIZE=500
SAVEHIST=500
export ZSH_HISTORY_PATH=$HOME/.zsh_history
HISTFILE=$HOME/.zsh_history
setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_dups         # ignore repeated commands
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups


# Local config
eval "$(rbenv init -)"

if [[ $OSTYPE == darwin* ]]; then
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
[[ -f $HOME/.travis/travis.sh ]] && source $HOME/.travis/travis.sh
[[ -f $HOME/.iterm2_shell_integration.zsh ]] && source $HOME/.iterm2_shell_integration.zsh
[[ -s $HOME/.secrets ]] && source $HOME/.secrets
[[ -f $HOME/.aliases ]] && source $HOME/.aliases
[[ -f $HOME/.profile ]] && source $HOME/.profile
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
