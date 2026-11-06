# Overview

A set of opinionated configuration files for command line tools like vim, [zsh](http://www.zsh.org/), git etc.

The installation is tested on macOS 26.6 and subject to change without prior notice. Use at your own risk!

![Build Status](https://github.com/ctrabold/dotfiles/workflows/ci.yml/badge.svg?branch=main)

## Installation

- Clone the `dotfiles` repo to your HOME folder:
```
git clone https://github.com/ctrabold/dotfiles.git $HOME/dotfiles
```
- Install [Command Line Tools](https://developer.apple.com/documentation/xcode/installing-the-command-line-tools) without Xcode:
```
xcode-select --install
```
- Install [Homebrew](https://docs.brew.sh/Installation):
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- Install required tools:
```
brew bundle --file $HOME/dotfiles/Brewfile
```
- Set `zsh` as your default login shell:
```
sudo chsh -s "$(command -v zsh)" "${USER}"
```
- Clone `zaw` repo to your HOME folder:
```
git clone https://github.com/zsh-users/zaw.git $HOME/zaw
```
- Setup local dotfiles repository:
```
chezmoi init https://github.com/ctrabold/dotfiles.git
chezmoi diff
```
This command lists all files that are going to be created so you can review the setup before you apply the settings in the next step. Refer to the docs for more details: https://www.chezmoi.io/quick-start/

- Verify the symlinks with this command: `chezmoi status`

Once you're happy with the result go ahead and create the symlinks to each dotfile:
```
chezmoi apply -v
```
You can safely run this command multiple times to update the symlinks e.g. if you add more dotfiles to the `dotfiles` folder later.
- (optional): Install Oh-My-ZSH: https://ohmyz.sh/#install
- (optional): install Janus Vim Setup: https://github.com/carlhuda/janus#installation
- (optional): install additional apps via mise with this command:
```shell
mise install
```
- (optional): install additional apps by commenting out the line(s) in `Brewfile.apps` and then run:
```
brew bundle --file $HOME/dotfiles/Brewfile.apps
```
- (optional): Create a dedicated SSH key for work:
```
ssh-keygen -t ed25519 -C "work_email@example.com" -f ~/.ssh/work_key
```
- (optional): Use the work key on certain work directory by adjusting `~/gitconfig.local`:
```
vi ~/gitconfig.local

[includeIf "gitdir:~/workspace/vendor"]
   [user]
       email = "work_email@example.com"
   [core]
       sshCommand = "ssh -i ~/.ssh/work_key"
```

## Known issues

### Vim: Solarized Theme needs patching

The colors do not work without patching the color theme.

Fix Solarized issue with this approach:

```shell
git clone https://codeberg.org/lifepillar/vim-solarized8.git \
    ~/.vim/janus/vim/colors/vim-solarized8
```
See https://codeberg.org/lifepillar/vim-solarized8 for more details on that issue.

## Vim: Janus tlib.vim needs patching

The issue is described here: https://github.com/carlhuda/janus/issues/716

```shell
cd ~/.vim/janus/vim/tools
git submodule update --remote tlib
```

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

* The `tmux` config file is a modified version from [the tmux book](http://media.pragprog.com/titles/bhtmux/code/workflows/tmux.conf).

#### [vim](http://www.vim.org/) configuration:

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

### How do I remove default apps in the default dock?

To cleanup the dock from the default apps use this command:
```
defaults write com.apple.dock persistent-apps -array
killall Dock
```
This will remove all the default apps in the dock. Now you can add apps that you find actually useful.

> [!NOTE]
> I personally store only a handful apps in the dock and rather use the search feature to open apps, either with the built in Spotlight or 3rd party apps like [Alfred](https://www.alfredapp.com/). I generally try to keep the Dock as small as possible to avoid visual distraction.

### How do I install apps on macOS?

This command installs the common tools I use on a regular basis:
```
brew bundle --file=~/dotfiles/Brewfile.apps
```

### How do I use a Node Package manager?

I use `mise` as described here: https://mise.jdx.dev/lang/node.html

### How do I setup the Java environment?

Use `mise` as described here: https://mise.jdx.dev/lang/java.html

Or use `SDKMan` and follow the installation step:
```
curl -s "https://get.sdkman.io" | bash
```
Then head over to their wiki to read up on the installation steps for each Java tool: https://sdkman.io/usage

## Credits

1. These files are heavily inspired by [thoughtbot, inc](http://thoughtbot.com/community). Thank you for your inspiring work!
The initial versions were inspired by the awesome folks at [peepcode](https://peepcode.com/products/advanced-command-line).
2. `tmux` is awesome - [The `tmux` book](http://pragprog.com/book/bhtmux/tmux) helped me getting used to it and it's fun to read.
The [`tmuxinator`](https://github.com/aziz/tmuxinator) gem makes `tmux` even more fun!
3. My zsh config is based on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
