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
