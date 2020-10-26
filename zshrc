autoload -Uz compinit
compinit

# history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

PS1="%B%(!.%F{red}%m.%F{green}%n@%m) %F{blue}%1~ %F{blue}%(!.#.$)%f%b "

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:descriptions' format '%U%B%F{yellow}%d%f%b%u'
zstyle ':completion:*:warnings' format ' %U%B%F{red}No%u matches!%f%b'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:processes' command 'ps -eo pid,tty,cmd'
zstyle ':completion:*:processes-names' command 'ps -eo cmd='
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle -e ':completion:*:aliases' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==04}")'
zstyle -e ':completion:*:builtins' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==04}")'
zstyle -e ':completion:*:commands' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==04}")'
zstyle -e ':completion:*:parameters' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==04}")'

zstyle ':completion:*:options' list-colors '=^(-- *)=01;33'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=33=01;31'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*:complete:*' use-cache 1
zstyle ':completion:*' cache-path /tmp/.zshcache

# Add fruit salad in the manuals
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

upload() {
	echo "Uploading..."
	if [[ "$1" == "" ]]; then # stdin
        curl -F"file=@-" https://0x0.st
	else
		curl -F"file=@$1" https://0x0.st
	fi
}

c() {
	g++ -O2 $1.cpp -o $1 -std=c++17 -DSTJO
}

w() {
	while true; do
		inotifywait -e close_write $1.cpp
		clear
		c $1 && echo Done && timeout 5 time ./$1 < $2
	done
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
