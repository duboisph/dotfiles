# Dotfiles

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and change things according to your own taste. Use at your own risk!

## Customization

### `.gitconfig.local`

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
- [Nick Plekhanov's dotfiles](https://github.com/nicksp/dotfiles)
- [Dotbot by Anish Athalye](https://github.com/anishathalye/dotbot)
- [mrzool's Sensible Bash](https://github.com/mrzool/bash-sensible)

## License

The code is available under the [MIT license](https://github.com/duboisph/dotfiles/blob/master/LICENSE).

For convenience some third party assets are hard-copied in place. These items have their own license and copyright:

- [Dracula for fish](https://github.com/dracula/fish). Copyright (c) 2018 Dracula Theme. MIT License
- [Dracula for iTerm](https://github.com/dracula/iterm). Copyright (c) 2013-present Dracula Theme. MIT License
- [Dracula for Terminal.app](https://github.com/dracula/terminal-app). Copyright (c) 2016 Dracula Theme. MIT License
