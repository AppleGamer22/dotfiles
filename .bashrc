defaults write -g NSNavPanelExpandedStateForSaveMode -boolean TRUE
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.screencapture type JPG
defaults write com.apple.screencapture disable-shadow -bool true ; killall SystemUIServer
# sudo hostname macOS

red=$(tput setaf 9);
green=$(tput setaf 10);
blue=$(tput setaf 12);
yellow=$(tput setaf 11);
cyan=$(tput setaf 14);
pink=$(tput setaf 13);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\n\[${bold}\]\[${pink}\]\#.\[${red}\]\u\[${reset}\]";#user
PS1+="@\[${green}\]\[${bold}\]\h";#host
# PS1+="\[${blue}\]\[${bold}\](\v)\[${reset}\]";#bash version
PS1+="\[${blue}\]\[${bold}\](\T)";#time
PS1+="\[${reset}\]:\[${yellow}\]\[${bold}\]\w";#full path
PS1+="\[${reset}\]\n$ ";
echo -e -n "\x1b[\x35 q";#changes to blinking bar
export PS1;

# Aliases
alias ls='ls -G'
alias la='ls -AlhF'
alias rm='rm -i'
alias df='df -h'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias cdOrderit-iOS='cd ~/Documents/Orderit\ Project/Orderit-iOS'
alias cdOrderit-Ionic='cd ~/Documents/Orderit\ Project/Orderit-Ionic'
alias cdOrderit-Server='cd ~/Documents/Orderit\ Project/Orderit-Server'
alias editVimRC='sudo vi ~/.vimrc'
alias brewUp='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias initXC='swift package generate-xcodeproj'
alias docker-prune='docker system prune -a'
alias expressConnect='docker exec -it express /bin/bash'

export PATH=/Users/applegamer22/Documents/Orderit\ Project/Orderit-Server/MongoDB/bin:$PATH

# Functions
updatePackages() {
	updatePod
	updateNode
	updateGCP
	updateBrew
	#clear
}

updateBrew() {
	read -n 1 -p "Do you want to update Homebrew packages? ([y/n], ^C to exit): " input
	printf "\n"
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
			clear
			updateBrew
		;;
	esac
}

updatePod() {
	read -n 1 -p "Do you want to update Cocoapods? ([y/n], ^C to exit): " input
	printf "\n"
	case $input in
		[yY])
				echo "$ sudo gem install cocoapods"
				sudo gem install cocoapods
		;;
		[nN]);;
		*)
			clear
			updatePod
		;;
	esac
}

updateNode() {
	read -n 1 -p "Do you want to update Node.js & NPM packages? ([y/n], ^C to exit): " input
	printf "\n"
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
			clear
			updateNode
		;;
	esac
}

updateGCP() {
	read -n 1 -p "Do you want to update Google Cloud Platform CLI? ([y/n], ^C to exit): " input
    printf "\n"
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

hide() {
	sudo chflags hidden "$1"
	killall Finder
}

show() {
	sudo chflags nohidden "$1"
	killall Finder
}

encrypt() {
	openssl enc -aes-256-cbc -e -in "$1" -out "$2"	
}

decrypt() {
	openssl enc -aes-256-cbc -d -in "$1" -out "$2"
}

code() {
	open "$1" -a "Visual Studio Code"
}

editBashRC() {
	echo "$ sudo vi ~/.bashrc"
	sudo vi ~/.bashrc
	echo "$ source ~/.bashrc"
	source ~/.bashrc
}
