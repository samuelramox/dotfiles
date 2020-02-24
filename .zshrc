# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# --------------------------- Custom paths ------------------------------------
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Homebrew path
export PATH="/usr/local/sbin:$PATH"

# curl path
export PATH="/usr/local/opt/curl/bin:$PATH"

# nvm path
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# pyenv init
eval "$(pyenv init -)"

# Python 3 path
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Ruby path
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Support 256 colors path
export TERM="xterm-256color"

# ------------------------------ Theme ----------------------------------------
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SYMBOL_ROOT="#"
SPACESHIP_CHAR_SUFFIX=" "

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "robbyrussell" )

# ----------------------------- Options ---------------------------------------
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ----------------------------- Plugins ---------------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  extract
  fast-syntax-highlighting
  git
  npm
  osx
  sudo
  z
  zsh-autosuggestions
  zsh-completions
  zsh_reload
)

# Homebrew Command Not Found
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi

# Homebrew Shell Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# ------------------------- User configuration --------------------------------
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# --------------------------- Custom aliases ----------------------------------
# Update Homebrew and Cask formulaes
# Include -f to update apps that are marked as latest
alias update="brew update && brew upgrade && brew cu --all"

# Cleanup Homebrew and Cask cache
alias cleanup="brew cleanup"

# Update macOS using Command Line Software Update Tool
alias macupdate="sudo softwareupdate -ia"

# List npm packages installed globally
alias npmlist="npm list -g --depth=0"

# Update npm packages globally
alias npmupdate="npm update -g"

# Undo the last commit
alias uncommit="git reset HEAD~1"

# Copy SSH
alias copyssh="pbcopy < ~/.ssh/id_ed25519.pub | echo '=> Public key copied to pasteboard.'"

# Open .zshrc in VSCode
alias zshconfig="code ~/.zshrc"
