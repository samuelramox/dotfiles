# Export paths
export PATH="/usr/local/sbin:$PATH" #Homebrew path


# Source dotfiles
for file in ~/.{aliases,functions,git-completion}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# Export terminal colors
export TERM=xterm-color
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch) $ "
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"


# Git branch in terminal
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
