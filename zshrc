# Set $PATH
# @see http://en.wikipedia.org/wiki/PATH_%28variable%29
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER=$USER
DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/dotfiles/zsh
ZSH_THEME="avit"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  extract
  git
  sublime
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='vim -f'
export GIT_EDITOR='vim -f'
export VIM_APP_DIR='/usr/bin/vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Load additional files
[[ -f $HOME/.secrets ]] && source $HOME/.secrets
[[ -f $HOME/.travis/travis.sh ]] && source $HOME/.travis/travis.sh
[[ -f $HOME/.iterm2_shell_integration.zsh ]] && source $HOME/.iterm2_shell_integration.zsh
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
