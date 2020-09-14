export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/root/.oh-my-zsh"

# Antigen config
source $HOME/antigen.zsh
antigen init ~/.antigenrc

# THEME CONFIG
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context battery dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable ip custom_wifi_signal ram load background_jobs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_RAM_BACKGROUND='yellow'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

# GOLANG config
export GO111MODULE=auto 
export GOPATH=$HOME/work
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# aliases
alias getdates='date | tee ~/fulldate.txt | cut --delimiter=" " --fields=1 | tee ~/shortdate.txt | xargs echo date added'
alias p='cd ~/../mnt/c/Users/laptop/Desktop/projects/'

# Only use this alias for linux 
alias bat='batcat'
alias vi='nvim'
alias gvim='cd ~/.config/nvim'
alias cr="clear"
alias md="mkdir"
alias rmf="rm -rf"

# LS commands 
alias la="ls -alFh --color=yes"
alias l="ls -lF --color=yes"
alias ld="ls -lF ${colorflag} | grep --color=never '^d'"

# lock laptop
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# log all aliases
alias las="bat ~/.zshrc | grep ^alias"

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Directory name"
  elif [ -d $1 ]; then
    echo "Directory already exists"
      cd $1
  else
    md $1 && cd $1
  fi
}


function goto {
  if [ ! -n "$1" ]; then
    echo "Please provide project folder"
  else
    p && cd $1
  fi
}

function crp {
  if [ ! -n "$1" ]; then
    echo "provide github link"
    return 1
  elif [ ! -n "$2" ]; then
    echo "provide new name"
    return 1
  fi
  GL=$1 # github link
  DN=$2 # directory name
  p
  while [ -d $DN ]
  do
   read "DN?directory already exists, please choose a other name" 
   echo
   DN=$DN
  done
  p && git c $GL $DN && cd $DN && yarn install 
}
alias config='/usr/bin/git --git-dir=/root/dotfiles --work-tree=/root'
