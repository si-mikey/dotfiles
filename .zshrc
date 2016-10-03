# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

# Now we can pipe to multiple outputs!
setopt MULTIOS

# This makes cd=pushd
setopt AUTO_PUSHD

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# deleting everything? Better wait.
setopt RM_STAR_WAIT

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.aliases
source ~/.shell_funcs
# eclim dir
export ECLIM_HOME=/Users/luislopez/code/java/eclipse.app/Contents/Eclipse/plugins/org.eclim_2.5.0/bin
# workmarket stuff
export WM_HOME=/Users/luislopez/code/workMarket/
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home'
export MAVEN_OPTS="-server -Xms1G -Xmx2G -XX:MaxPermSize=1G"
export JRUBY_OPTS="--server -J-Xms1G -J-Xmx2G -J-XX:+CMSClassUnloadingEnabled -J-XX:+UseConcMarkSweepGC -J-XX:MaxPermSize=1G"
# source 

# Gradle bin
PATH=$PATH:~/code/java/gradle-2.13/bin


# ==== Docker ===== #
export DOCKER_HOST=tcp://127.0.0.1
export DOCKER_CERT_PATH=/Users/luislopez/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
# ==== Docker ====== #



# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#=================== Run time management ====================#
# node.js version manager
export PATH=$PATH:~/.npm/bin
#export NPM_CONFIG_PREFIX=~/.npm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Go version manager
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# ruby version manager
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# java version manager
#=================== Run time management ====================#


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:~/bin/

