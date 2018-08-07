$ cat .bashrc 
# Terminal command line style
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

red=$(tput setaf 9);
green=$(tput setaf 10);
blue=$(tput setaf 12);
yellow=$(tput setaf 11);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${red}\]\[${bold}\]\u\[${reset}\]"; #red color text user
PS1+=" @ \[${green}\]\[${bold}\]\h"; #green color text host
PS1+="\[${reset}\] : \[${blue}\]\[${bold}\]\w"; #blue color text full path
PS1+="\[${reset}\]\n$ ";
echo -e -n "\x1b[\x35 q" # changes to blinking bar
export PS1;

# Aliases
alias ls='ls -G'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
# alias editBashProfile='sudo vi ~/.bash_profile'
# alias editBashRC='sudo vi ~/.bashrc'
alias editVimRC='sudo vi ~/.vimrc'
alias brewUp='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# Functions
updatePackages() {
	updatePod
	updateNode
	updateBrew
	clear
}

updateBrew() {
    echo "Would you like to update your Homebrew packages? [y/n]"
	read -n 1 -p "Answer: " input
    printf "\n"
    case $input in
   	 	[yY])
                echo "$ brew update"
				brew update
				echo "$ brew upgrade" 
				brew upgrade
				echo "$ brew prune" 
				brew prune 
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
	echo "Would you like to update Cocoapods? [y/n]"
	read -n 1 -p "Answer: " input
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
	echo "Would you like to update your Node.js + NPM packages? [y/n]"
	read -n 1 -p "Answer: " input
    printf "\n"
    case $input in
   	 	[yY])
                echo "$ sudo n lts"
				sudo n lts
				echo "$ sudo npm install -g npm"
				sudo npm install -g npm
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

vscode() {
	open "$1" -a "Visual Studio Code"
}

editBashRC() {
	echo "$ sudo vi ~/.bashrc"
	sudo vi ~/.bashrc
	echo "$ source ~/.bashrc"
	source ~/.bashrc
}

vscode() {
	open "$1" -a "Visual Studio Code"
}
