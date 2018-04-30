# Overview

A set of vim, zsh, git, and tmux configuration files.

Plus atom packages and MacOS settings to setup my workstation quickly.

[![Build Status](https://travis-ci.org/ctrabold/dotfiles.svg?branch=master)](https://travis-ci.org/ctrabold/dotfiles)

# Requirements

- [zsh](http://www.zsh.org/)
- [zaw](https://github.com/zsh-users/zaw)
- [rcm](http://thoughtbot.github.io/rcm/)

## Mac OS X

- [Homebrew](https://github.com/Homebrew/homebrew/wiki/Installation)
<pre>
    brew tap thoughtbot/formulae
    brew install rcm zsh
</pre>

## Ubuntu

- [`rcm`](http://thoughtbot.github.io/rcm/)
<pre>
    wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.2-2_all.deb
    sudo dpkg -i rcm_1.2.2-2_all.deb
</pre>
- `terminator` (optional)
<pre>
    apt-get install terminator
</pre>


# Usage

- Set `zsh` as your login shell

    chsh -s $(which zsh)

- Clone `zaw` repo to your HOME folder

    git clone git://github.com/zsh-users/zaw.git $HOME/zaw

- Clone `dotfiles` repo to your HOME folder

    git clone https://github.com/ctrabold/dotfiles.git $HOME/dotfiles
    ln -s $HOME/dotfiles/rcrc $HOME/.rcrc

This creates a symlink to the `rcrc` config file which excludes
files that should not be symlinked for example.

- Test the setup with this command

    lsrc

- If you're happy with the result let's create symlinks for each dotfile!

macOS: `rcup -v -t darwin`
Ubuntu: `rcup -v -t ubuntu`

This will create symlinks for each dotfile into your home directory.

You can safely run this command multiple times to update
the symlinks e.g. if you add custom dofiles to the `dotfiles` folder.


# FAQ

## What's in it?

[git](http://git-scm.com/) configuration:

* Ignores a global set of files through `~/.gitignore_global`
* Sets a bunch of `aliases` in `~/.gitconfig`

[Ruby](https://www.ruby-lang.org/en/) configuration:

* Never download documentation for Rubygems

Shell aliases and scripts:

* see `~/dotfiles/zsh/aliases.zsh`

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course) configuration:

* The `tmux` config file is a modified version of from [the tmux book](http://media.pragprog.com/titles/bhtmux/code/workflows/tmux.conf).

[vim](http://www.vim.org/) configuration:

* My vim config is based on [janus](https://github.com/carlhuda/janus).
* `colorscheme solarized`
* `let mapleader = ","`


## How to customize the setup?

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.zshrc.local`

For example, your `~/.aliases.local` might look like this:

    # Productivity
    alias todo='$EDITOR ~/.todo'

Your `~/.gitconfig.local` might look like this:

    [alias]
      l = log --pretty=colored
    [pretty]
      colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset
    [user]
      name = John Doe
      email = john@example.com

Your `~/.zshrc.local` might look like this:

    # recommended by brew doctor
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

You can also override the files by storing them inside the `dotfiles-local` folder.

Just use the same filenames as in the `dotfiles` folder to override the default files with your files.

## How to install atom packages from the file?

    apm install --packages-file atom-package-list.txt

## How to generate the atom package list?

    apm list --installed --bare > atom-package-list.txt

# Credits

1. These files are heavily inspired by [thoughtbot, inc](http://thoughtbot.com/community). Thank you for your inspiring work!
The initial versions were inspired by the awesome folks at [peepcode](https://peepcode.com/products/advanced-command-line).
2. `tmux` is awesome - [The `tmux` book](http://pragprog.com/book/bhtmux/tmux) helped me getting used to it and it's fun to read.
The [`tmuxinator`](https://github.com/aziz/tmuxinator) gem makes `tmux` even more fun!
3. My zsh config is based on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
