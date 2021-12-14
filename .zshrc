function set_zsh() {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
		FPATH=/usr/local/share/zsh-completions:$FPATH
	fi
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=underline
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
	autoload -Uz compinit
	compinit -i
	HISTSIZE=1000
	SAVEHIST=1000
	setopt INC_APPEND_HISTORY
	setopt SHARE_HISTORY
	HISTFILE=~/.zsh_history
	zstyle ':completion:*' menu select
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	touch ~/.hushlogin
	echo -e -n "\x1b[\x35 q";
}
function set_completions() {
	source <(kubectl completion zsh)
	source <(kompose completion zsh)
	# source <(kubeadm completion zsh)
	# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# 	source <(k3d completion zsh)
	# fi
	# source <(kubelet completion zsh)
	source <(npm completion)
	eval "`pip completion --bash`"
	# eval "$(pipenv --completion)"
}

function set_aliases() {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		alias ls='ls --color'
		alias rm='rm -iI --preserve-root'
		alias open='xdg-open $1 2> /dev/null'
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		alias ls='ls -G'
		alias rm='rm -i'
	fi
	alias clear="printf '\33c\e[3J'"
	alias la='ls -AlhF'
	alias lh='ls -lhF'
	alias mv='mv -i'
	alias cp='cp -i'
	alias ln='ln -i'
	alias df='df -h'
	alias chown='chown --preserve-root'
	alias chmod='chmod --preserve-root'
	alias chgrp='chgrp --preserve-root'
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias bc='bc -l'
	alias gitkraken='git log --graph --decorate --oneline'
}

function set_defaults() {
	git config --global user.name "Omri Bornstein"
	git config --global user.email "omribor@gmail.com"
	git config --global credential.helper cache
	git config --global core.editor nano
	git config --global color.status auto
	git config --global color.branch auto
	git config --global color.interactive auto
	git config --global color.diff auto
	git config --global credential.helper store

	npm config set init-author-email "omribor@gmail.com" -g
	npm config set init-author-name "Omri Bornstein" -g
	npm config set init-author-url "https://applegamer22.hashnode.dev" -g
	npm config set init-license "GPL-3.0-only" -g
}
alias set_defaults='sudo zsh -c "$(declare -f set_defaults); set_defaults"'

# export OMPOSE_DOCKER_CLI_BUILD=1
# export DOCKER_BUILDKIT=1
set_zsh
set_completions
set_aliases
# set_defaults
eval "$(starship init zsh)"
