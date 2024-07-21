# Prompt
eval "$(starship init zsh)"

# Yen (python environment manager)
export PATH=$PATH:/Users/bex/.yen/bin
alias py="yen exec --python 3.12"

# Homebrew
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
setopt MENU_COMPLETE

# Zsh/Terminal aliases and functions
alias ..="cd .."
alias ~="cd $HOME"
alias dev="cd $HOME/dev"
alias zshrc="nvim $HOME/.zshrc && source $HOME/.zshrc && echo '✨ Sourced .zshrc' "
alias c="clear"
alias mv="mv -v"
alias cp="cp -v"

function mkcd {
	mkdir $1 && cd $1
}

export TEMP_DIR="$HOME/tmp"
function tmp { # Used for quickly making temp directories
	mkdir -p $TEMP_DIR
	cd $TEMP_DIR
	mkdir $1
	cd $1
}

# Oxidized coreutil replacements
alias ls="eza -l --icons --ignore-glob=.git"
alias lsa="ls -a"
alias grep="rg"
alias find="fd"
alias cat="bat -p --theme='Catppuccin Macchiato'"

# Git
function gcommit {
	git commit -m "$*"
}
alias ginit='git init'
alias gpush='git push'
alias gpull='git pull'
alias gadd='git add'
alias gstat='git status'
alias gdiff='git diff'
