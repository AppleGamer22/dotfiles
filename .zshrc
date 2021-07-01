function set_zsh() {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
		FPATH=/usr/local/share/zsh-completions:$FPATH
	fi
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
	# source <(kubeadm completion zsh)
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		source <(k3d completion zsh)
	fi
	# source <(kubelet completion zsh)
	source <(npm completion)
	eval "`pip completion --bash`"
	# eval "$(pipenv --completion)"
}

function set_aliases() {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		alias ls='ls --color'
		alias open='xdg-open $1 2> /dev/null'
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		alias ls='ls --G'
	fi
	alias clear="printf '\33c\e[3J'"
	alias la='ls -AlhF'
	alias rm='rm -iI --preserve-root'
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

# export OMPOSE_DOCKER_CLI_BUILD=1
# export DOCKER_BUILDKIT=1
set_zsh
set_completions
set_aliases
# set_defaults
eval "$(starship init zsh)"
