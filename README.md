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

## Manual steps

Not everything's automated unfortunately, depending on taste there's a couple of extra steps to do:

- DOwnload and install the Cascadia Code font via <https://github.com/microsoft/cascadia-code>
- Install the Dracula theme for the new Windows Terminal via <https://github.com/dracula/windows-terminal>
- Initialize Neovim plugins by runnin `nvim` and then executing `:PlugInstall`
- Install & configure GUI software 😅

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

- [Dracula for Terminal.app](https://github.com/dracula/terminal-app). Copyright (c) 2016 Dracula Theme. MIT License
- [Dracula for iTerm](https://github.com/dracula/iterm). Copyright (c) 2013-present Dracula Theme. MIT License
- [Dracula for Xresources](https://github.com/dracula/xresources). Copyright (c) 2016 Dracula Theme. MIT License
- [Fira Code font](https://github.com/tonsky/FiraCode). Copyright (c) 2014, The Fira Code Project Authors. SIL Open Font License 1.1
