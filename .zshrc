# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
OS=$(uname -s)

if [ "$OS" = "Linux" ] && [ "$USER" = "victor" ]; then
  export ZSH="/home/victor/.oh-my-zsh"
elif [ "$OS" = "Linux" ] && [ "$USER" = "pi" ]; then
  export ZSH="/home/pi/.oh-my-zsh"
else
  export ZSH="/Users/vkuo/.oh-my-zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
)

  # autojump
  # syntax-highlighting
  # autosuggestions
  # ansiweather
  # zsh-completions

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# For zsh-autosuggestions to accept suggestion on ctrl + space
bindkey '^ ' autosuggest-accept

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custom aliases
alias gs="git status"
alias gdc="git diff --cached"

export FORGE_CLI_PATH=~/Coding/forge
# export FORGE_CLI_PATH=~/forge
# alias devforge='FORGE_DEV_TUNNEL=true PATH=$FORGE_CLI_PATH/scripts:$PATH node $FORGE_CLI_PATH/packages/forge-cli/out/bin/cli.js'
devforge() {AUTOCOMPLETE_ALIAS=devforge FORGE_DEV_TUNNEL=true PATH=$FORGE_CLI_PATH/scripts:$PATH node $FORGE_CLI_PATH/packages/forge-cli/out/bin/cli.js $@ }
# _devforge_completion() {FORGE_DEV_TUNNEL=true PATH=$FORGE_CLI_PATH/scripts:$PATH node $FORGE_CLI_PATH/packages/forge-cli/out/bin/cli.js $@ }

alias devforgedocker='FORGE_DEV_DOCKER_TUNNEL=true PATH=$FORGE_CLI_PATH/scripts:$PATH node $FORGE_CLI_PATH/packages/forge-cli/out/bin/cli.js'

export LOCAL_CLI_EXECUTABLE=~/Coding/forge/packages/forge-cli/out/bin/cli.js

# Automatically run `nvm use` when in a directory with it.
# place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

if [ "$OS" = "Linux" ]; then
else
  # begin devforge completion
  # . <(devforge --completion)
  # end devforge completion

  # begin forge completion
  # . <(forge --completion)
  # end forge completion
fi

export PATH="/home/victor/.local/bin:"$PATH

# Laptop
alias vs="cd /mnt/c/VictorsStuff"
# For vcxsrv WSL2 python gui to show
# export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0

alias do="docker"
alias dc="docker-compose"
