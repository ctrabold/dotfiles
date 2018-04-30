# Directory profiles

Change zsh profile based on which directory you change to.

## Basic usage

    # only execute the profile function once in that directory tree
    zstyle ':chpwd:profiles:*' re-execute false
    # ohmyzsh profile for oh-my-zsh directory and subdirectories
    zstyle ":chpwd:profiles:$HOME/.oh-my-zsh(|/|/*)" profile ohmyzsh
    # actually call the function
    chpwd_profiles

    # Executed when entering the profile
    chpwd_profile_ohmyzsh()
    {
        print "Switching to profile: $profile"

        export GIT_AUTOR_EMAIL='example@ohmyzsh.sh'
        export GIT_COMMITTER_EMAIL='example@ohmyzsh.sh'
    }

    # Execute when leaving the profile
    chpwd_leave_profile_ohmyzsh()
    {
        print "Leaving profile: $CHPWD_PROFILE"

        unset GIT_AUTOR_EMAIL
        unset GIT_COMMITTER_EMAIL
    }

## More information

This plugin is extracted from _grmlzshrc_, you can find more information in
[`grmlzshrc.5`](http://grml.org/zsh/grmlzshrc.html) in the section "DIRECTORY
BASED PROFILES".

## Authors

* The [grml Team](grml.org), &copy; [Michael Prokop](mika@grml.org)
* Adapted for [oh-my-zsh](http://ohmyz.sh/) by [Felix
  Schäfer](https://github.com/thegcat)

## License

GPLv2, see LICENSE file.
