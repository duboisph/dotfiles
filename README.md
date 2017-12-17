# Dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and change things according to your own taste. Use at your own risk!

[Dotbot](https://github.com/anishathalye/dotbot) is used for installation. After cloning this repo, run `./install` to automatically set up the environment. Note that the install script is idempotent: it can safely be run multiple times.

### Customization

#### `.gitconfig.local`

If `~/.gitconfig.local` exists, it will be included at the end of `.gitconfig`. You can use this to set personal and/or sensitive information such as your `git` user credentials.

```ini
[user]
  name = Your Name
  email = name@example.com
  signingkey = APGPKEY
[commit]
  gpgsign = true
```

## Feedback

Suggestions/improvements [welcome](https://github.com/duboisph/dotfiles/issues)!

## Acknowledgements

Inspiration and code was taken from many different sources:

- [GitHub ❤ ~/](http://dotfiles.github.io/)
- [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Kevin Deldycke's dotfiles](https://github.com/kdeldycke/dotfiles)
- [Nick Plekhanov's Dotfiles](https://github.com/nicksp/dotfiles)
- [Dotbot by Anish Athalye](https://github.com/anishathalye/dotbot)
- [Bash-it](https://github.com/Bash-it/bash-it)

## License

The code is available under the [MIT license](https://github.com/duboisph/dotfiles/blob/master/LICENSE).
