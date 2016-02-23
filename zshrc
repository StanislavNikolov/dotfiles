# aliases
alias c='cd'
alias l='ls --color=auto'
alias lh='ls -lh'
alias la='ls -a'
alias lah='ls -lah'

alias ls='ls --color=auto'
alias grep='grep --colour=auto'

alias vi=nvim
alias duh='du -h --max-depth=1'

export EDITOR="nvim"
export PATH="$HOME/.hax:$HOME/.local/bin:$PATH"

bindkey -e
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Enable colors for ls, etc.
if [[ -f /etc/DIR_COLORS ]] ; then
	eval $(dircolors -b /etc/DIR_COLORS)
fi

# autoload -U compinit
# compinit

# autoload -U select-word-style
# select-word-style bash

PS1="%B%(!.%F{red}%m.%F{green}%n@%m) %F{blue}%1~ %F{blue}%(!.#.$)%f%b "
# PS2="%B %_ %F{blue}>%f%b "

setopt complete_in_word
setopt auto_cd
setopt extended_glob
setopt long_list_jobs
setopt notify
setopt nohup
setopt flow_control
setopt no_list_ambiguous
setopt rmstarsilent
setopt auto_param_slash

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
