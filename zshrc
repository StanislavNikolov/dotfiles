# aliases
alias ls='ls --color=auto --group-directories-first -X'
alias grep='grep --colour=auto'

#alias c='cd'
alias l='ls '
alias lh='ls -lh'
alias la='ls -a'
alias lah='ls -lah'

#alias vi="nvim"
alias vi="echo kak"
alias duh='du -h --max-depth=1 | sort -h'
alias df='df --si'
alias kak='~/kakoune/src/kak'

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=sakura
export GOPATH="$HOME/.go"
export PATH="$HOME/.hax:$HOME/.local/bin:$PATH:/usr/local/bin:$GOPATH/bin"
export LANG="en_US.utf8"

bindkey -e
bindkey ';5C' forward-word
bindkey ';5D' backward-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Enable colors for ls, etc.
if [[ -f /etc/DIR_COLORS ]] ; then
	eval $(dircolors -b /etc/DIR_COLORS)
fi

autoload -U compinit
compinit

#PS1="%B%(!.%F{red}%m.%F{green}%n@%m) %F{blue}%1~ %F{blue}%(!.#.$)%f%b "
PS1_REAL="%B%(!.%F{red}%m.%F{green}%n@%m) %F{blue}%1~ %F{blue}%(!.#.$)%f%b "
# PS2="%B %_ %F{blue}>%f%b "

setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

setopt auto_cd
setopt histignorespace # commands starting with ' ' are not saved
# TODO research
# setopt complete_in_word
# setopt extended_glob
# setopt long_list_jobs
# setopt notify
# setopt nohup
# setopt flow_control
# setopt no_list_ambiguous
# setopt rmstarsilent
# setopt auto_param_slash

#set -o vi
#KEYTIMEOUT=1 # fix the annoying delay between switching modes

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

wds() {
	echo `pwd` > $HOME/.currentWorkDir
}

wdg() {
	cd `cat $HOME/.currentWorkDir`
}

terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
function zle-line-init zle-keymap-select {
    #PS1_2="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    PS1="%{$terminfo_down_sc$PS1_2$terminfo[rc]%}% $PS1_REAL"
    zle reset-prompt
}
preexec () { print -rn -- $terminfo[el]; }
zle -N zle-line-init
zle -N zle-keymap-select

upload() {
	echo "Uploading..."
	if [[ "$1" == "" ]]; then # stdin
		curl -F c=@- https://ptpb.pw/
	else
		curl -F c=@- https://ptpb.pw/ < "$1"
	fi
}

qfind() {
	all=`find`
	for arg in "$@"
	do
		all=`grep "$arg" <<< "$all"`
	done
	echo "$all"
}

TERMINAL=sakura
