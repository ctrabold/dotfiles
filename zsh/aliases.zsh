alias h='history'
alias headers='curl -D - -o /dev/null --silent -A firefox'
alias history='fc -il 1'
alias hosts='vim /etc/hosts'
alias mkdir='mkdir -p'
alias ping='ping -a'

# Git
alias gl='git l'

# Disable deprecation warnings
# @see http://stackoverflow.com/questions/5591509/suppress-ruby-warnings-when-running-specs
alias ruby='ruby -W0'
alias rake='noglob rake'

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
