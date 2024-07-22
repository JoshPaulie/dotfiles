# Prompt
eval "$(starship init zsh)"

# Zsh Plugins
source $HOME/dotfiles/zsh/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/dotfiles/zsh/zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/dotfiles/zsh/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOME/dotfiles/zsh/zsh-plugins/zsh-syntax-highlighting/highlighters

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
alias dotfiles="cd $HOME/dotfiles"
alias c="clear"
alias mv="mv -v"
alias cp="cp -v"

mkcd() {
	mkdir $1 && cd $1
}

export TEMP_DIR="$HOME/tmp"
tmp() { # Used for quickly making temp directories
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
alias cat="bat -p"

# Pretty manpages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Git
function gcommit {
	git commit -m "$1"
}
alias ginit='git init'
alias gpush='git push'
alias gpull='git pull'
alias gadd='git add'
alias gstat='git status'
alias gdiff='git diff'

# Misc
alias ff="fastfetch"
alias lg="lazygit"
