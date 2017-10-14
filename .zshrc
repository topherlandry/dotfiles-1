# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

compinit





# Exports
export TODOTXT_DEFAULT_ACTION=ls
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/daphne/bin:/home/daphne/.gem/ruby/2.4.0/bin:$PATH"
ZSH_THEME="daphne"
export EDITOR=vim



# oh-my-zsh configs
plugins=(git ruby rails aws nyan docker)


setopt hist_ignore_all_dups
HISTSIZE=100000
SAVEHIST=100000



# aliases
alias gcal="gcalcli --calendar 'Daphne Reed'"

alias paws="ruby /vidyard/DevTools/scripts/aws/auth.rb"
#alias paws="/usr/bin/python2 /vidyard/DevTools/DevOps/Scripts/AWS-API_Access.py --username=dreed"
#alias ssh="ssh $(host -t A $1 | cut -f1 -d' ')"
alias t="todo.sh"
alias vpn="nmcli con up id Vidyard-VPN --ask"
alias ltp="ruby ~/src/tmux-profile/load-tmux-profile.rb"
alias lsd="ls -1t | head -5"
alias signal-app="chromium --profile-directory=Default --app-id=bikioccmkafdpakkkcpdbppfkghcmihk"
alias lps="lpass show"
alias lpc="grep password | sed 's/[^ ]* //' | xclip"




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

# external configs
source /usr/local/share/zsh/site-functions/_aws
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source $ZSH/oh-my-zsh.sh
source ~/.zshvars
source ~/bin/tmuxinator.zsh
source ~/.cache/wal/colors.sh


# Run pywal for every new terminal
wal -r -t 
