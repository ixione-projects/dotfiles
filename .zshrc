fpath=(~/.config/zsh/functions/ $fpath)

# See zshoptions(1) for more options

# prevents adding duplicate lines or lines starting with space to the history file
setopt hist_ignore_dups
setopt hist_ignore_space

# imports commands from the history file and appends new commands to the history file
setopt share_history

# sets in-memory history size and history file disk size
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

# makes less more friendly for non-text input files, see lesspipe(1)
test -x /usr/bin/lesspipe && eval $(SHELL=/bin/sh lesspipe)

# enables color support of ls and also adds aliases
if test -x /usr/bin/dircolors; then
    test -r ~/.dircolors && eval $(dircolors -b ~/.dircolors)
else
    test -r ~/.dircolors && eval $(dircolors -b)
fi

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias help=run-help

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias edit='nvim'
alias add='git add . && git status'
alias commit='git commit -m'
alias push='git push'

autoload -U promptinit && promptinit
prompt bart # sets bart prompt theme

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

tabs 4
