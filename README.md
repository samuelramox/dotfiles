# macOS Dotfiles

This is a simple and flexible dotfiles and scripts to setup _macOS_.

## Table of Contents

1. [What are dotfiles][]
1. [Features][]
1. [Installation][]
1. [Manual setup][]
1. [Screenshot][]
1. [Resources][]

## What are dotfiles

Dotfiles are configuration files on Unix-based systems. At first they are just hidden configuration files of the system (that's why the reason for starting with `.`). However, we can use them to make it easier to configure our computers, with many advantages:

- Easy to format a new computer
- Automation of tasks
- Easy maintenance
- Storage in remote locations (GitHub, Dropbox, etc)
- Versioning
- Import to multiple computers
- Customize the terminal

## Features

_Check linked files to more details._

### Installation files

- [apps.sh][] - installs _Homebrew_, _Homebrew Cask Upgrade_ and some _apps_.
- [dock.sh][] - macOS Dock items customization.
- [dotfiles.sh][] - _Oh My Zsh_ installer, _.zshrc_ and _git_ configs.
- [hostname.sh][] - change _hostname_ (MacBook name).
- [macos.sh][] - macOS defaults configs.
- [npm.sh][] - install _npm_ packages.
- [setup.sh][] - main installer.
- [ssh.sh][] - generate _SSH_.
- [util.sh][] - support functions for other installers.

**Note:** _These files will be discarded later._

### Settings Files

- [.gitconfig][] - basic _git_ settings.
- [.gitignore_global][] - global _gitignore_.
- [.zshrc][] - terminal configs with aliases, paths, plugins and theme.
- [com.googlecode.iterm2.plist][] - [iTerm2][] settings.
- [starship.toml][] - [Starship][] theme settings.

**Note:** _These files are permanent_.

## Installation

```bash
git clone -b work https://github.com/samuelramox/dotfiles.git && cd dotfiles

./install/setup.sh
```

**Note:** You can also download a specific [release][].

### Explaining the process

The [setup.sh][] process will ask if you want to install the following scripts, in this order:

- [apps.sh][] - install _Homebrew_, _Homebrew Cask Upgrade_ and applications.
  I suggest you comment apps that should not be installed and include those that are not listed. This script will install in the following order:

  - Install [Homebrew][].
  - Homebrew formulas: [curl][], [Git][], [iTermocil][], [Nano][], [Node][], [nvm][], [PostgreSQL][], [pyenv][], [Python][], [Ruby][], [Tree][], [Unrar][], [Yarn][], [Zsh][].
  - Homebrew taps: [homebrew/fonts][], [homebrew/drivers][], [homebrew/versions][], [homebrew/command-not-found][].
  - Homebrew casks: [Google Chrome][], [IINA][], [iTerm2][], [JetBrains Mono][], [Mumble][], [Insomnia][], [Slack][], [Visual Studio Code][] and [Zoom][].
  - Install [Homebrew Cask Upgrade][].

- [dotfiles.sh][] - install [Oh My Zsh][], some Zsh plugins, [Starship][] theme and set _iTerm2_ preferences (including [Dracula Theme][]). This step also opens [.gitconfig][] so that the user can put his data.
- [npm.sh][] - install some npm packages.
- [macos.sh][] - set custom macOS preferences.
- [dock.sh][] - install [dockutil][] and set custom permanent apps in Dock. _Finder_ and _Recycle Bin_ are already permanent (unless you change this).
- [ssh.sh][] - Generate _SSH_.
- [hostname.sh][] - Update _hostname_ (MacBook name).
- Create a directory called _Developer_ in _Home_ directory for projects and development.
- Cleanup cached downloads and remove the installation zip and folder.

**Note:** I suggest you read these files and turn your preferences on/off before installation.

## Manual setup

[iTerm2][] settings are changed by [dotfiles.sh][] and it will look the same as [screenshot][], but you can change them manually if you prefer. My [Visual Studio Code][] settings are loaded by the [Settings Sync][], so you will have to change manually or load your settings.

### iTerm2 - Change the color theme

You can use the default theme or switch to your preferred theme. I use [Dracula Theme][].

`iTerm2 → Preferences → Profiles → Colors → Color presets`

### iTerm2 - Change font

You can use the default font or switch to your preferred font. I use [JetBrains Mono][] with 12px.

`iTerm2 → Preferences → Profiles → Text → Change Font`

### iTerm2 - Enable word jumps and word deletion, aka natural text selection

By default, word jumps (`option` + `→` or `←`) and word deletions (`option` + `backspace`) do not work.

`iTerm2 → Preferences → Profiles → Keys → Load Preset... → Natural Text Editing`

### Visual Studio Code - Config

`Code → Preference → Settings (or CMD + ,) and add or edit the following values:`

```json
"editor.fontFamily": "JetBrains Mono",
"editor.fontLigatures": true,
"editor.fontSize": 12,
"terminal.integrated.fontFamily": "JetBrains Mono",
"terminal.integrated.fontSize": 12,
```

### Visual Studio Code - Configurable External Terminal

If you are using [iTerm2][] as a default terminal, you need to configure this in [Visual Studio Code][].

`Code → Preference → Settings (or CMD + ,) and add or edit the following values:`

```json
"terminal.external.osxExec": "iTerm.app",
```

## Screenshot

Default install (can be configured):

![macOS screenshot][]

## Resources

- [Dotfiles Repositories][]
- [Awesome Dotfiles][]
- [Homebrew][]
- [Homebrew Cask Upgrade][]
- [Dockutil][]
- [Sensible macOS defaults][]
- [Awesome OSX Command Line][]
- [Oh My Zsh][]
- [Starship][]
- [Dracula Theme][]

[.gitconfig]: .gitconfig
[.gitignore_global]: .gitignore_global
[.zshrc]: .zshrc
[apps.sh]: install/apps.sh
[awesome dotfiles]: https://github.com/webpro/awesome-dotfiles
[awesome osx command line]: https://github.com/herrbischoff/awesome-osx-command-line
[com.googlecode.iterm2.plist]: com.googlecode.iterm2.plist
[starship.toml]: starship.toml
[curl]: https://curl.haxx.se
[dock.sh]: install/dock.sh
[dockutil]: https://github.com/kcrawford/dockutil
[dotfiles.sh]: install/dotfiles.sh
[dotfiles repositories]: https://dotfiles.github.io/
[dracula theme]: https://draculatheme.com
[features]: #features
[git]: https://git-scm.com
[google chrome]: https://www.google.com/chrome/
[homebrew]: https://brew.sh/
[homebrew cask upgrade]: https://github.com/buo/homebrew-cask-upgrade
[homebrew/command-not-found]: https://github.com/Homebrew/homebrew-command-not-found
[homebrew/drivers]: https://github.com/Homebrew/homebrew-cask-drivers
[homebrew/fonts]: https://github.com/Homebrew/homebrew-cask-fonts
[homebrew/versions]: https://github.com/Homebrew/homebrew-cask-versions
[hostname.sh]: install/hostname.sh
[iina]: https://iina.io/
[insomnia]: https://insomnia.rest
[installation]: #installation
[iterm2]: https://iterm2.com
[itermocil]: https://github.com/TomAnthony/itermocil
[jetbrains mono]: https://jetbrains.com/mono
[macos screenshot]: ./images/macOS.jpg 'macOS screenshot with default install'
[macos.sh]: install/macos.sh
[manual setup]: #manual-setup
[mumble]: https://www.mumble.com
[nano]: https://www.nano-editor.org
[node]: https://nodejs.org/
[npm.sh]: install/npm.sh
[nvm]: https://github.com/nvm-sh/nvm
[oh my zsh]: https://ohmyz.sh
[postgresql]: https://www.postgresql.org
[pyenv]: https://github.com/pyenv/pyenv
[python]: https://www.python.org
[release]: https://github.com/samuelramox/dotfiles/releases
[resources]: #resources
[ruby]: https://www.ruby-lang.org/
[screenshot]: #screenshot
[sensible macos defaults]: https://github.com/mathiasbynens/dotfiles/blob/master/.macos
[settings sync]: https://code.visualstudio.com/docs/editor/settings-sync
[setup.sh]: install/setup.sh
[slack]: https://slack.com/
[starship]: https://starship.rs
[ssh.sh]: install/ssh.sh
[tree]: http://mama.indstate.edu/users/ice/tree/
[unrar]: https://www.rarlab.com/
[util.sh]: install/util.sh
[visual studio code]: https://code.visualstudio.com
[what are dotfiles]: #what-are-dotfiles
[yarn]: https://yarnpkg.com/
[zoom]: https://zoom.us
[zsh]: https://www.zsh.org
