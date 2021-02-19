# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# --------------------------- Paths ------------------------------------
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Homebrew path
export PATH="/opt/homebrew/bin:$PATH"

# curl path
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Gettext path
export PATH="/usr/local/opt/gettext/bin:$PATH"

# nvm path (zsh-nvm plugin)
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_NO_USE=true
export NVM_AUTO_USE=true

# pyenv init
eval "$(pyenv init -)"

# Python 3 path (use only without pyenv)
# export PATH="/opt/homebrew/opt/python/libexec/bin"

# Ruby path
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"

# SSL path
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib"

# Support 256 colors path
export TERM="xterm-256color"

# ----------------------------- Plugins ---------------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  extract
  fast-syntax-highlighting
  osx
  zsh-autosuggestions
  zsh-completions
  zsh-nvm
  zsh_reload
)

# Homebrew Command Not Found
HB_CNF_HANDLER="/opt/homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
  source "$HB_CNF_HANDLER";
fi

# Homebrew Shell Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# --------------------------- Aliases ----------------------------------
# Update Homebrew and Cask formulaes
# Include -f to update apps that are marked as latest
alias update="brew update && brew upgrade && brew cu --all"

# Cleanup Homebrew and Cask cache
alias cleanup="brew cleanup"

# Update macOS using Command Line Software Update Tool
alias macupdate="sudo softwareupdate -ia"

# List npm packages installed globally
alias npmlist="npm list -g --depth=0"

# Undo the last commit
alias uncommit="git reset HEAD~1"

# Copy SSH
alias copyssh="pbcopy < ~/.ssh/id_ed25519.pub | echo '=> Public key copied to pasteboard.'"

# Open .zshrc in VSCode
alias zshcfg="code ~/.zshrc"

# Start Olist adminapp APIs database
alias admindb="docker start postgres-admin postgres-ias postgres-sellers"

# Start Olist webapp APIs database
alias webdb="docker start postgres-ias postgres-sellers postgres-payments"

# Open iTermocil with admin-local
alias adminlocal="itermocil admin-local"

# Open iTermocil with web-local
alias weblocal="itermocil web-local"

# Open iTermocil with admin-prod
alias adminprod="itermocil admin-prod"

# Open iTermocil with web-prod
alias webprod="itermocil web-prod"

# Run webapp in Docker
alias webapp="docker rm webapp && docker run --name webapp -d --env-file=.env --network host webapp"

# Django collectstatic
alias collect="pipenv run python adminapp/manage.py collectstatic --noinput"

# ------------------------------ Theme ----------------------------------------
# Starship ZSH theme
# The minimal, blazing-fast, and infinitely customizable prompt for any shell!
# Check out https://starship.rs for more details
ZSH_THEME=""
eval "$(starship init zsh)"

# Starship path to load .config
export PATH="/opt/homebrew/opt/starship/bin:$PATH"
