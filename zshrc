autoload -U colors && colors

# Variable {
    platform="unknown"
    kernel=`uname`
    if [[ "$kernel" == "Darwin" ]]; then
        platform="osx"
    elif [[ "$kernel" == "FreeBSD" ]]; then
        palform="freebsd"
    fi

# }


function get_current_git_branch(){
  git name-rev --name-only --no-undefined --always HEAD
}

function git_prompt_info() {
  git branch | awk '/^\*/ { print $2 }'
}

# General {
    PATH="/usr/local/Cellar/vim/7.4.488/bin:$HOME/.brew/bin:/usr/local/git/bin:$PATH"
    PS1="%{$fg[magenta]%}%n% %{$fg[white]%}@%{$fg[yellow]%}%m% %{$fg[white]%} in%{$fg[green]%} %~ %{$fg[white]%}%{$reset_color%}$ "
# }

# Birdly {
    export DB_HOST_ADDR=192.168.59.103
    export DB_HOST_PORT=5432
# }

# Docker {
    if [[ "$platform" == "osx" ]]; then
        export DOCKER_HOST=tcp://192.168.59.103:2376
        export DOCKER_CERT_PATH=/Users/$USER/.boot2docker/certs/boot2docker-vm
        export DOCKER_TLS_VERIFY=1
    fi
# }

# Alias {
    alias 'l'='ls -lF'
    alias 'la'='ls -laF'

    # Git {
        alias 'g'='git'
    #  }

    # Vim {
      alias 'v'='vim'
    # }

    # Docker {
        alias 'd'='docker'
    # }

    # Ruby {
        alias 'sidekiq'='bundle exec sidekiq'
        alias 'b'='bundle'
    # }
# }

# Function {
    # Git {
        function gc {
            if [ -z "$1" ]; then
                git checkout master
            else
                git checkout $1
            fi
        }
    # }

# }
