# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/bin:$PATH"
export EDITOR='vim'
export LANGUAGE=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="spaceship"

ZSH_TMUX_AUTOSTART='true'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
plugins=(sudo git history taskwarrior tmux tmuxinator zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gst='git status'
alias gcom='git commit -m'
alias gco='git checkout'
alias gl='git pull'
alias gpom="git pull origin master"
alias gp='git push'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'
alias gfa='git fetch -all'
alias gr='git reset'
alias gm='git merge'
alias gs='git stash'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'
alias gfhs='git flow hotfix start'
alias gfhf='git flow hotfix finish'
alias gcl='git clean'

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/Applications/MAMP/Library/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Goodbye, VIM
# # https://robots.thoughtbot.com/my-life-with-neovim
if type nvim > /dev/null 2>&1; then
  # https://stackoverflow.com/a/2596835
  export VISUAL="nvim"
  export EDITOR="$VISUAL"

  alias vim="$VISUAL"

  # https://gist.github.com/blainesch/9844f5ebf9628e5396b2f137ea3b0022
  # ln -sf ~/.vim ~/.config/nvim
  # ln -sf ~/.vimrc ~/.vim/init.vim
fi

# https://junegunn.kr/2015/03/browsing-git-commits-with-fzf
# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
 fzhow() {
   local out shas sha q k
   while out=$(
     git log --graph --color=always \
       --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" "$@" |
     fzf --ansi --multi --no-sort --reverse --query="$q" \
         --print-query --expect=ctrl-d --toggle-sort=\`); do
     q=$(head -1 <<< "$out")
     k=$(head -2 <<< "$out" | tail -1)
     shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
     [ -z "$shas" ] && continue
     if [ "$k" = ctrl-d ]; then
       git diff --color=always $shas | less -R
     else
       for sha in $shas; do
         git show --color=always $sha | less -R
       done
     fi
   done
 }

eval "$(rbenv init -)"
