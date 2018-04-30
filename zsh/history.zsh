# HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

bindkey '^R' zaw-history

zstyle ':filter-select:highlight' matched fg=green
zstyle ':filter-select' max-lines 7
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' hist-find-no-dups yes
zstyle ':filter-select' extended-search yes

# setopt append_history
# setopt inc_append_history
# setopt extended_history
# setopt hist_find_no_dups
# setopt hist_ignore_dups         # ignore repeated commands
# setopt hist_ignore_all_dups
# setopt hist_reduce_blanks
# setopt hist_ignore_space
# setopt hist_no_store
# setopt hist_no_functions
# setopt no_hist_beep
# setopt hist_save_no_dups
