# xcode-select --install
# Git
git config --global user.name "<your_name>"
git config --global user.email "<your_email>"
git config --global credential.helper cache
git config --global core.editor vim
git config --global color.status auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global color.diff auto
git config --global credential.helper store

autoload -Uz compinit
compinit
HISTSIZE=1000
SAVEHIST=1000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
zstyle ':completion:*' menu select
source ~/.config/history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(starship init zsh)"
source <(kubectl completion zsh)
eval "$(pipenv --completion)"

#for macOS
defaults write -g NSNavPanelExpandedStateForSaveMode -boolean TRUE
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.screencapture type JPG
defaults write com.apple.screencapture disable-shadow -bool true ; killall SystemUIServer
# sudo hostname macOS
# compaudit | xargs sudo chmod g-w
# sudo scutil --set HostName macOS
#changes to blinking bar
#export PS1="%10F%m%f:%11F%1~%f \$ "
echo -e -n "\x1b[\x35 q";
touch ~/.hushlogin
alias editZSHRC="sudo vi ~/.zshrc"
alias clear="printf '\33c\e[3J'"
alias ls='ls -G'
alias la='ls -AlhF'
alias rm='rm -i'
alias df='df -h'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias editVimRC='sudo vi ~/.vimrc'
alias initXC='swift package generate-xcodeproj'
alias gitkraken='git log --graph --decorate --oneline'
alias python='python3'

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
	npm completion >> ~/.zshrc
	read "input?Update Node.js & NPM packages? ([y/n], ^C to exit): "
	case $input in
		[yY])
				echo "$ sudo n lts"
				sudo n lts
				echo "$ sudo n prune"
				sudo n prune
				echo "$ sudo npm update -g"
				sudo npm update -g
		;;
	[nN]);;
		*)
			updateNode
		;;
	esac
}

function reclaim() {
	sudo chown -R $USER:$GROUP ~/.npm
	sudo chown -R $USER "$1"
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
