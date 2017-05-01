function __load_fsf_configuration {
  [ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
}

function __load_rb_configuration {
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
}

function __load_dotfile_builtins {
  export PATH="$HOME/dotfiles/bin:$PATH"
}

function __load_ps1 {
  PS1="%{$fg[red]%}%n% %{$fg[white]%} {%{$fg[cyan]%}%1d% %{$fg[white]%}} %{$fg[blue]%}> %{$reset_color%}"
}

function __active_autocomplete {
  # Autocomplete
  autoload -U compinit && compinit
  # matches case insensitive for lowercase
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  # pasting with tabs doesn't perform completion
  zstyle ':completion:*' insert-tab pending
  compdef g='git'
  # Docker bug on OSX
  # because docker run into hyperkit
  #compdef d='docker'
  compdef dc='docker-compose'
}

function __load_history_configuration {
  HISTFILE="$HOME/.zsh_history"
  HISTSIZE=10000
  SAVEHIST=10000
}

function current_dir {

}

CLICOLOR=true
LC_CTYPE=en_US.UTF-8

# Read (http://linux.die.net/man/1/zshoptions)
setopt NO_BG_NICE
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

alias 'l'='ls -lF'
alias 'la'='ls -laF'
alias 'g'='git'
alias 'd'='docker'
alias 'dc'='docker-compose'
alias 'h'='heroku'
alias 't'='tmux'
alias 'tat'='tmux attach -t'
alias 'dnsclear'='sudo killall -HUP mDNSResponder'

bindkey -e
autoload -U colors && colors

__load_fsf_configuration
__load_history_configuration
__load_rb_configuration
__load_dotfile_builtins
__load_ps1
__active_autocomplete
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
