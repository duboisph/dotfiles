# Philip’s dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and change things according to your own taste. Use at your own risk!

_TODO:_ Create installer

### Customization

The dotfiles can be extended to suit additional local requirements by using the following files `.local` files. These files are excluded from source control and can therefore be used for setting sesitive info.

#### `.bash_profile.local`

If `~/.bash_profile.local` exists, it will be sourced before all other files. You can use this to set your $PATH and machine specific directives.

```bash
#!/usr/bin/env bash

# PATH
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

# GH API token for Homebrew
export HOMEBREW_GITHUB_API_TOKEN='somegithubtoken'

# Disable Ansible host checking
export ANSIBLE_HOST_KEY_CHECKING=False
```

#### `.gitconfig.local`

If `~/.gitconfig.local` exists, it will be included at the end of `.gitconfig`. You can use this to set sensitive information such as your `git` user credentials.

```ini
[user]
  name = Philip Dubois
  email = philip@example.com
  signingkey = apgpkey
[commit]
  # Source: https://github.com/pstadler/keybase-gpg-github
  gpgsign = true
[difftool "Kaleidoscope"]
  cmd = ksdiff --partial-changeset --relative-path \"$MERGED\" -- \"$LOCAL\" \"$REMOTE\"
[mergetool "Kaleidoscope"]
  cmd = ksdiff --merge --output \"$MERGED\" --base \"$BASE\" -- \"$LOCAL\" --snapshot \"$REMOTE\" --snapshot
  trustexitcode = true
```

### Set macOS defaults

**Warning:** Be sure to check this script first and comment/uncomment the relevant parts to your liking!

When setting up a new Mac, you may want to set some sensible macOS defaults via the `macos.sh` script:
```bash
./macos.sh
```

#### Updating macos.sh

Regularly compare the `macos.sh` script with Mathias Bynens' upstream version to merge new changes:
```bash
curl -s https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.macos | diff -u - macos.sh
```

Or if you use [Kaleidoscope](http://www.kaleidoscopeapp.com/):
```bash
curl -so $TMPDIR/macos https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.macos; ksdiff $TMPDIR/macos macos.sh
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

## Feedback

Suggestions/improvements [welcome](https://github.com/duboisph/dotfiles/issues)!

## Acknowledgements

Inspiration and code was taken from many different sources:

-   [GitHub ❤ ~/](http://dotfiles.github.io/)
-   [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
-   [Kevin Deldycke's dotfiles](https://github.com/kdeldycke/dotfiles)
-   [Nick Plekhanov's Dotfiles](https://github.com/nicksp/dotfiles)

## License

The code is available under the [MIT license](https://github.com/duboisph/dotfiles/blob/master/LICENSE).

For convenience, some third party assets are hard-copied in place. These particular items have their own licenses and copyrights:

-   [onedark.vim](https://github.com/joshdick/onedark.vim) iTerm2 color scheme: Copyright (c) 2015 Joshua Dick. MIT License.
