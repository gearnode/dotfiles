zssh_ids=(github_rsa)

fpath=(~/.zsh/completion $fpath)

# Emacs binding
bindkey -e

#
# Configures prompt
#
# autoload -U promptinit && promptinit
# prompt purer

#
# Configures custom autocompletes
#
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi

autoload -Uz compinit && compinit -i

autoload -U colors && colors

export CLICOLOR=true

export LC_CTYPE=en_US.UTF-8

#
# Configures
#
export PATH=$PATH:/usr/local/sbin:$HOME/dotfiles/bin:$HOME/.rbenv/shims:$GOPATH/bin

#
# Configures default editor
#
export EDITOR=vim
export VISUAL=vim

#
# Configures psql command
#
export PGSYSCONFDIR=$HOME
export PGSERVICE docker

alias l='ls -lF'
alias la='ls -laF'
alias tat='tmux attach -t'
alias tx=tmux
alias d=docker
alias g=git
alias dc=docker-compose
alias tf=terraform
alias k=kubectl
alias kns=kubens
alias kctx=kubectx
alias h=helm

#
# Configures history options
#

# Save timestamps along with commands
setopt EXTENDED_HISTORY

# limit of history entries
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt BANG_HIST

# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
# ‘: <beginning time>:<elapsed seconds>;<command>’.
setopt EXTENDED_HISTORY

# This options works like APPEND_HISTORY except that new history lines are added to the ${HISTFILE} incrementally
# (as soon as they are entered), rather than waiting until the shell exits.
setopt INC_APPEND_HISTORY

# Shares history across all sessions rather than waiting for a new shell invocation to read the history file.
setopt SHARE_HISTORY

# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS

# Remove command lines from the history list when the first character on the line is a space,
# or when one of the expanded aliases contains a leading space.
setopt HIST_IGNORE_SPACE

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# Whenever the user enters a line with history expansion, don’t execute the line directly;
# instead, perform history expansion and reload the line into the editing buffer.
setopt HIST_VERIFY

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

#
# generic options and environment settings
#

# use smart URL pasting and escaping
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Treat single word simple commands without redirection as candidates for resumption of an existing job.
setopt AUTO_RESUME

# List jobs in the long format by default.
setopt LONG_LIST_JOBS

# Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt NOTIFY

# Recognize comments starting with `#`.
setopt INTERACTIVE_COMMENTS

# Run all background jobs at a lower priority. This option is set by default.
unsetopt BG_NICE

# Send the HUP signal to running jobs when the shell exits.
unsetopt HUP


# Report the status of background and suspended jobs before exiting a shell with job control;
# a second attempt to exit the shell will succeed.
# NO_CHECK_JOBS is best used only in combination with NO_HUP, else such jobs will be killed automatically.
unsetopt CHECK_JOBS

#
# Directory navigation options
#

#
# Navigation
#

# If a command is issued that can’t be executed as a normal command,
# and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Have pushd with no arguments act like ‘pushd ${HOME}’.
setopt PUSHD_TO_HOME

#
# Globbing and fds
#

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.
# (An initial unquoted ‘~’ always produces named directory expansion.)
setopt EXTENDED_GLOB

# Perform implicit tees or cats when multiple redirections are attempted.
setopt MULTIOS

# Disallow ‘>’ redirection to overwrite existing files.
# ‘>|’ or ‘>!’ must be used to overwrite a file.
setopt NO_CLOBBER

#
# enables fish-shell like syntax highlighting
#
ZSH_HIGHLIGHT_HIGHLIGHTERS=(${zhighlighters[@]})
local file=/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f $file ] && source $file
local file=/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $file ] && source $file

#
# sets up ssh-agent
#

# don't do anything unless we can actually use ssh-agent
if (( ! ${+commands[ssh-agent]} )); then
  return 1
fi

# use a sane temp dir; creating 1k ssh-* files in /tmp is crazy
if [[ ${TMPDIR} ]]; then
  local ssh_env=${TMPDIR}/ssh-agent.env
  local ssh_sock=${TMPDIR}/ssh-agent.sock
else
  # create a sane tmp dir at /tmp/username
  mkdir -p /tmp/${USER}
  local ssh_env=/tmp/${USER}/ssh-agent.env
  local ssh_sock=/tmp/${USER}/ssh-agent.sock
fi

# start ssh-agent if not already running
if [[ ! -S ${SSH_AUTH_SOCK} ]]; then
  # read environment if possible
  source ${ssh_env} 2> /dev/null

  if ! ps -U ${LOGNAME} -o pid,ucomm | grep -q -- "${SSH_AGENT_PID:--1} ssh-agent"; then
    eval "$(ssh-agent | sed '/^echo /d' | tee ${ssh_env})"
  fi
fi

# create socket
if [[ -S ${SSH_AUTH_SOCKET} && ${SSH_AUTH_SOCKET} != ${ssh_sock} ]]; then
  ln -sf ${SSH_AUTH_SOCKET} ${ssh_sock}
  export SSH_AUTH_SOCK=${ssh_sock}
fi

# load ids
if ssh-add -l 2>&1 | grep -q 'no identities'; then
  if (( ${#zssh_ids} > 0 )); then
    ssh-add "${HOME}/.ssh/${^zssh_ids[@]}" 2> /dev/null
  else
    ssh-add 2> /dev/null
  fi
fi

unset ssh_{sock,env}

#
# enables fzf
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# configures node version manager
#
 export NVM_DIR="$HOME/.nvm"
 [ -f /usr/local/opt/nvm/nvm.sh ] && source /usr/local/opt/nvm/nvm.sh
