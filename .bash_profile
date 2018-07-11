if [ -f ~/.bashrc ]; then 
    source ~/.bashrc 
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias editBashProfile='sudo vi ~/.bash_profile'
alias editBashRC='sudo vi ~/.bashrc'
alias editVim='cd; sudo vi .vimrc'
alias brewUp='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

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
