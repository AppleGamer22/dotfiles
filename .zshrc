# Git
# xcode-select --install
git config --global user.name "Omri Bornstein"
git config --global user.email omribor@gmail.com
git config --global core.editor vim
git config --global color.status auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global color.diff auto
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

SPACESHIP_CHAR_SYMBOL="$ "
SPACESHIP_CHAR_SYMBOL_ROOT="# "
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_HOST_SHOW="always"
SPACESHIP_USER_SHOW="always"
# SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_USER_COLOR="red"
SPACESHIP_HOST_COLOR="green"
SPACESHIP_DIR_COLOR="yellow"
SPACESHIP_TIME_COLOR="blue"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
#   exec_time     # Execution time
  line_sep      # Line break
#   battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
	package       # Package version
	git           # Git section (git_branch + git_status)
	node          # Node.js section
	xcode         # Xcode section
	swift         # Swift section
	docker        # Docker section
	kubecontext   # Kubectl context section
)



# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/applegamer22/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-package
  zsh-syntax-highlighting
  kubectl
)

# source $ZSH/oh-my-zsh.sh

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
alias editZshRC="sudo vi ~/.zshrc"
alias ohmyzsh="sudo vi ~/.oh-my-zsh"
alias clear="printf '\33c\e[3J'"
alias ls='ls -G'
alias la='ls -AlhF'
alias rm='rm -i'
alias df='df -h'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias editVimRC='sudo vi ~/.vimrc'
# alias brewUp='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias initXC='swift package generate-xcodeproj'
alias gitkraken='git log --graph --decorate --oneline'

# Functions
function updatePackages() {
	updatePod
	updateNode
	updateGCP
	updateBrew
	#clear
}

function updateBrew() {
	read "input?Update Homebrew packages? ([y/n], ^C to exit): "
    case $input in
   	 	[yY])
                echo "$ brew update"
				brew update
				echo "$ brew upgrade" 
				brew upgrade
				# echo "$ brew prune" 
				# brew prune 
				echo "$ brew cleanup" 
				brew cleanup
				echo "$ brew doctor"
				brew doctor
		;;
    	[nN]);;
		*)
			updateBrew
		;;
	esac
}

function updatePod() {
	read "input?Update Cocoapods? ([y/n], ^C to exit): "
    case $input in
   	 	[yY])
                echo "$ sudo gem install cocoapods"
				sudo gem install cocoapods
		;;
    	[nN]);;
		*)
			updatePod
		;;
	esac
}

function updateNode() {
	read "input?Update Node.js & NPM packages? ([y/n], ^C to exit): "
    case $input in
   	 	[yY])
                echo "$ sudo n lts"
				sudo n lts
				#echo "$ sudo npm install -g npm"
				#sudo npm install -g npm
				echo "$ sudo npm update -g"
				sudo npm update -g
		;;
    	[nN]);;
		*)
			updateNode
		;;
	esac
}

function updateGCP() {
	read "input?Do you want to update Google Cloud Platform CLI? ([y/n], ^C to exit): "
    case $input in
   	 	[yY])
                echo "$ gcloud components update"
				gcloud components update
		;;
    	[nN]);;
		*)
			clear
			updateGCP
		;;
	esac
}

function hide() {
	sudo chflags hidden "$1"
	killall Finder
}

function show() {
	sudo chflags nohidden "$1"
	killall Finder
}

function encrypt() {
	openssl enc -aes-256-cbc -e -in "$1" -out "$2"	
}

function decrypt() {
	openssl enc -aes-256-cbc -d -in "$1" -out "$2"
}

function code() {
	open "$1" -a "Visual Studio Code"
}

function editBashRC() {
	echo "$ sudo vi ~/.bashrc"
	sudo vi ~/.bashrc
	echo "$ source ~/.bashrc"
	source ~/.bashrc
}
