# Set defaut editor
export EDITOR=vim
export CLICOLOR=true

export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/dotfiles/bin:$PATH"

# Load RVM, NVM, Kiex, Travis
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
[ -f /Users/gearnode/.travis/travis.sh ] && source /Users/gearnode/.travis/travis.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Read (http://linux.die.net/man/1/zshoptions)
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt COMPLETE_ALIASES

# Alias
alias 'l'='ls -lF'
alias 'la'='ls -laF'
alias 'g'='git'
alias 'v'='vim'
alias 'd'='docker'
alias 'b'='bundle'
alias 'h'='heroku'
alias 't'='tmux'
alias 'tat'='tmux attach -t'


# Autocomplete
autoload -U compinit && compinit
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
compdef g='git'

autoload -U colors && colors

PS1="%{$fg[magenta]%}%n% %{$fg[white]%}@%{$fg[yellow]%}%m% %{$fg[white]%} in%{$fg[green]%} %~ %{$fg[white]%}%{$reset_color%}$ "

