# See zshoptions(1) for more options

# prevents adding duplicate lines or lines starting with space to the history file
setopt bang_hist              # Treat the '!' character specially during expansion.
setopt extended_history       # Write the history file in the ':start:elapsed;command' format.
setopt share_history          # Share history between all sessions.
setopt hist_expire_dups_first # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups       # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups   # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_space      # Do not record an event starting with a space.
setopt hist_save_no_dups      # Do not write a duplicate event to the history file.
setopt hist_verify            # Do not execute immediately upon history expansion.
setopt hist_beep

# imports commands from the history file and appends new commands to the history file
setopt share_history

# sets in-memory history size and history file disk size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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

alias hx='HELIX_RUNTIME=~/.local/lib/helix/runtime hx'

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
