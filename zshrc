autoload -U colors && colors

eval "$(docker-machine env default)"
PATH="./bin:/usr/local/Cellar/vim/7.4.488/bin:$HOME/.brew/bin:/usr/local/git/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[ -f /Users/gearnode/.travis/travis.sh ] && source /Users/gearnode/.travis/travis.sh

PS1="%{$fg[magenta]%}%n% %{$fg[white]%}@%{$fg[yellow]%}%m% %{$fg[white]%} in%{$fg[green]%} %~ %{$fg[white]%}%{$reset_color%}$ "

alias 'l'='ls -lF'
alias 'la'='ls -laF'
alias 'g'='git'
alias 'v'='vim'
alias 'd'='docker'
alias 'b'='bundle'
alias 'h'='heroku'

# smart checkout
function gc {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}
