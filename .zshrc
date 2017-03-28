# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="reed"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails aws nyan docker)

source $ZSH/oh-my-zsh.sh



# User configuration

setopt hist_ignore_all_dups
HISTSIZE=100000
SAVEHIST=100000

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/dreed/.rvm/bin:/home/dave/bin:$PATH"
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias gcal="gcalcli --calendar dave.reed@vidyard.com agenda"
alias paws="/usr/bin/python2 /vidyard/DevTools/DevOps/Scripts/AWS-API_Access.py"
#alias ssh="ssh $(host -t A $1 | cut -f1 -d' ')"
alias t="todo.sh"
alias vpn="sudo openconnect -u dreed vpn.vidyard.com -q -l"


# functions
function multi {
  cmd=$1
  shift
  while [[ $cmd = "ssh" ]]; do
    pre_check="$(echo $@ | tr ' ' '\n' | sed -e 's/^.*@//g' | \
      xargs nmap -p 22 -PN -oG - | grep Port | grep -v open)"
    test "${pre_check}x" != "x" && (clear; echo "$pre_check") || break
  done
  tmux send-keys -t 0 "$cmd ${@[1]}"
  for ((pane = 1; pane < ${#@[@]}; pane++)); do
     tmux splitw -h
     tmux send-keys -t $pane "$cmd ${@[pane+1]}"
     tmux select-layout tiled > /dev/null
  done
  tmux set-window-option synchronize-panes on > /dev/null
  tmux set-window-option pane-active-border-style fg=red > /dev/null
  tmux set-window-option pane-border-style fg=yellow > /dev/null
  tmux send-keys Enter
}

export TODOTXT_DEFAULT_ACTION=ls

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source /usr/local/share/zsh/site-functions/_aws
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source ~/.zshvars

