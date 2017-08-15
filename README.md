# Overview

A set of vim, zsh, git, and tmux configuration files.

Plus atom packages and MacOS settings to setup my workstation quickly.

[![Build Status](https://travis-ci.org/ctrabold/dotfiles.svg?branch=master)](https://travis-ci.org/ctrabold/dotfiles)

# Requirements

- [zsh](http://www.zsh.org/)
- [`rcm`](http://thoughtbot.github.io/rcm/)

## Mac OS X

- [Homebrew](https://github.com/Homebrew/homebrew/wiki/Installation)

    brew tap thoughtbot/formulae
    brew install rcm zsh

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


# Install

Set zsh as your login shell:

    chsh -s $(which zsh)

Clone onto your laptop:

    cd
    git clone git://github.com/ctrabold/dotfiles.git
    ln -s dotfiles/rcrc .rcrc


## Install

### Mac OSX:

    rcup -v -t darwin

### Ubuntu:

    rcup -v -t ubuntu

This will create symlinks for config files in your home directory. The `ln -s dotfiles/rcrc .rcrc`
command only creates a symlink for the `rcrc` file, which excludes the `README.md`, `LICENSE` and `Brewfile` files, that should not be symlinked.
We then run `rcup` again to create symlinks on all the files but with exclude patterns within `.rcrc`.

Make sure you use the `ubuntu` tag when executing this on Ubuntu machines!

You can then safely run `rcup` multiple times to update:

    rcup -t ubuntu


# What's in it?

[git](http://git-scm.com/) configuration:

* Ignores a global set of files through `~/.gitignore_global`
* Sets a bunch of `aliases` in ~/.gitconfig`

[Ruby](https://www.ruby-lang.org/en/) configuration:

* Never download documentation for Rubygems

Shell aliases and scripts:

* see `~/.aliases`

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course) configuration:

* The `tmux` config file is a modified version of from [the tmux book](http://media.pragprog.com/titles/bhtmux/code/workflows/tmux.conf).

[vim](http://www.vim.org/) configuration:

* My vim config is based on [janus](https://github.com/carlhuda/janus).
* `colorscheme solarized`
* `let mapleader = ","`


# Make your own customizations

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


# Install atom packages

    apm install --packages-file atom-package-list.txt

# Generate atom package list

    apm list --installed --bare > atom-package-list.txt

# Credits

1. These files are heavily inspired by [thoughtbot, inc](http://thoughtbot.com/community). Thank you for your inspiring work!
The initial versions were inspired by the awesome folks at [peepcode](https://peepcode.com/products/advanced-command-line).
2. `tmux` is awesome - [The `tmux` book](http://pragprog.com/book/bhtmux/tmux) helped me getting used to it and it's fun to read.
The [`tmuxinator`](https://github.com/aziz/tmuxinator) gem makes `tmux` even more fun!
3. My zsh config is based on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
