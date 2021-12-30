# Overview

A set of opinionated configuration files for command line tools like vim, [zsh](http://www.zsh.org/), git etc.

It uses pragmatic approaches like [zaw](https://github.com/zsh-users/zaw), [rcm](http://thoughtbot.github.io/rcm/) or [SpaceVim](https://spacevim.org/)
to configure the command line environment as quickly as possible without fiddling too much with nitty gritty implementation details.

The installation is tested on macOS 12.1 and subject to change without prior notice. Use at your own risk :)

[![Build Status](https://travis-ci.org/ctrabold/dotfiles.svg?branch=master)](https://travis-ci.org/ctrabold/dotfiles)

## Installation

- Clone the `dotfiles` repo to your HOME folder:
```
git clone https://github.com/ctrabold/dotfiles.git $HOME/dotfiles
```
- Install [Homebrew](https://docs.brew.sh/Installation):
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- Install required tools:
```
brew bundle --no-lock --file $HOME/dotfiles/Brewfile
```
- Set `zsh` as your default login shell:
```
sudo chsh -s "$(command -v zsh)" "${USER}"
```
- Clone `zaw` repo to your HOME folder:
```
git clone git://github.com/zsh-users/zaw.git $HOME/zaw
```
- Link the symlink configuration file:
```
ln -s $HOME/dotfiles/rcrc $HOME/.rcrc
```
- Verify the symlinks with this command: `lsrc`

This command lists all symlinks that are going to be created so you can review the setup before you apply the settings in the next step.

Once you're happy with the result go ahead and create the symlinks to each dotfile:
```
rcup -v
```
You can safely run this command multiple times to update the symlinks e.g. if you add more dotfiles to the `dotfiles` folder later.

## FAQ

### What's in it?

#### [git](http://git-scm.com/) configuration and commit templates

* Ignores a global set of files through `~/.gitignore_global`
* Sets a bunch of `aliases` in `~/.gitconfig`
* Best practise commit message in `~/.gitmessage`

#### [Ruby](https://www.ruby-lang.org/en/) configuration

* Never download documentation for Rubygems to save space

#### Handy shell aliases and functions

* `~/dotfiles/zsh/aliases.zsh`
* `~/dotfiles/zsh/functions.zsh`

#### [tmux](http://robots.thoughtbot.com/a-tmux-crash-course) configuration:

* The `tmux` config file is a modified version of from [the tmux book](http://media.pragprog.com/titles/bhtmux/code/workflows/tmux.conf).

#### [vim](http://www.vim.org/) configuration:

* The vim config is based on [SpaceVim](https://spacevim.org/).

## How do I customize the setup?

1. Override the files directly (not recommended because it makes it harder to pull changes from upstream due to potential merge conflicts).
2. Create a folder named `dotfiles-local` and store your custom files there. These will overrule the files from the `dotfiles` folder.
3. Create 'local' dotfiles with a `.local` file extension:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.zshrc.local`

These files are included by the respective files. Be aware that not all files support `.local` files.

### Example

Say you want to add your own aliases to your shell environment.

Instead of adding them to the 'core' file `zsh/aliases.zsh` I recommend to create a file called `~/.aliases.local` which might look like this:
```
alias todo='$EDITOR ~/.todo'
```
For `git` your `~/.gitconfig.local` might look like this:
```
[alias]
    l = log --pretty=colored
[pretty]
    colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset
[user]
    name = John Doe
    email = john@example.com
```
Your `~/.zshrc.local` might look like this:
```
# recommended by brew doctor
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
```
You can also override the core files completely or add your own by storing them inside the `dotfiles-local` folder.

This instructs `rcup` to use _your_ files upon the next `rcup` run (see usage instructions above).

## Credits

1. These files are heavily inspired by [thoughtbot, inc](http://thoughtbot.com/community). Thank you for your inspiring work!
The initial versions were inspired by the awesome folks at [peepcode](https://peepcode.com/products/advanced-command-line).
2. `tmux` is awesome - [The `tmux` book](http://pragprog.com/book/bhtmux/tmux) helped me getting used to it and it's fun to read.
The [`tmuxinator`](https://github.com/aziz/tmuxinator) gem makes `tmux` even more fun!
3. My zsh config is based on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
