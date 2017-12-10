# Philip’s dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and change things according to your own taste. Use at your own risk!

_TODO:_ Create installer

### Customization

The dotfiles can be extended to suit additional local requirements by using the following files `.local` files. These files are excluded from source control and can therefore be used for setting sesitive info.

#### `.bash_profile.local`

If `~/.bash_profile.local` exists, it will be sourced before all other files. You can use this to set your $PATH and machine specific directives.

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
