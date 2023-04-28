export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.rbenv/shims:$PATH"

if ! command -v rbenv &> /dev/null; then
    eval "$(rbenv init - zsh)"
fi
