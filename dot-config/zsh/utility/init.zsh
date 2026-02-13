setopt CORRECT

autoload -Uz run-help-{ip,openssl,sudo}

if ! zstyle -t ':zsh:module:utility:alias' skip; then
	alias help='run-help'

	alias ack='nocorrect ack'
	alias cd='nocorrect cd'
	alias cp='nocorrect cp'
	alias ebuild='nocorrect ebuild'
	alias gcc='nocorrect gcc'
	alias gist='nocorrect gist'
	alias grep='nocorrect grep'
	alias heroku='nocorrect heroku'
	alias ln='nocorrect ln'
	alias man='nocorrect man'
	alias mkdir='nocorrect mkdir'
	alias mv='nocorrect mv'
	alias mysql='nocorrect mysql'
	alias rm='nocorrect rm'

	alias bower='noglob bower'
	alias fc='noglob fc'
	alias find='noglob find'
	alias ftp='noglob ftp'
	alias history='noglob history'
	alias locate='noglob locate'
	alias rake='noglob rake'
	alias rsync='noglob rsync'
	alias scp='noglob scp'
	alias sftp='noglob sftp'

	alias _='sudo'
	alias b='${(z)BROWSER}'

	alias diffu="diff --unified"
	alias e='${(z)VISUAL:-${(z)EDITOR}}'
	alias mkdir="${aliases[mkdir]:-mkdir} -p"
	alias p='${(z)PAGER}'
	alias po='popd'
	alias pu='pushd'
	alias sa='alias | grep -i'
	alias type='type -a'

	alias cp="${aliases[cp]:-cp} -i"
	alias ln="${aliases[ln]:-ln} -i"
	alias mv="${aliases[mv]:-mv} -i"
	alias rm="${aliases[rm]:-rm} -i"

	alias ls="${aliases[ls]:-ls} --group-directories-first"
	if (( ! $+LS_COLORS )); then
		if (( $+commands[dircolors] )); then
			eval "$(dircolors --sh $HOME/.dircolors(N))"
		else
			export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
		fi
	fi
	alias ls="${aliases[ls]:-ls} --color=auto"

	alias l='ls -1A'         # Lists in one column, hidden files.
	alias ll='ls -lh'        # Lists human readable sizes.
	alias lr='ll -R'         # Lists human readable sizes, recursively.
	alias la='ll -A'         # Lists human readable sizes, hidden files.
	alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
	alias lk='ll -Sr'        # Lists sorted by size, largest last.
	alias lt='ll -tr'        # Lists sorted by date, most recent last.
	alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
	alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
	alias lx='ll -XB'        # Lists sorted by extension (GNU only).

	export GREP_COLOR=${GREP_COLOR:-'37;45'}            # BSD.
	export GREP_COLORS=${GREP_COLORS:-"mt=$GREP_COLOR"} # GNU.
	alias grep="${aliases[grep]:-grep} --color=auto"

	alias o='xdg-open'
	if (( $+commands[xclip] )); then
		alias pbcopy='xclip -selection clipboard -in'
		alias pbpaste='xclip -selection clipboard -out'
		alias pbc='pbcopy'
		alias pbp='pbpaste'
	else
		echo "xclip: command not found"
	fi

	alias get="curl --continue-at - --location --progress-bar --remote-name --remote-time"

	alias df='df -kh'
	alias du='du -kh'

	alias topc='top -o %CPU'
	alias topm='top -o %MEM'
fi

if (( $+commands[lesspipe] )); then
	eval $(SHELL=/bin/sh lesspipe)
fi

if (( $+commands[python] )); then
	autoload -Uz is-at-least
	if is-at-least 3 ${"$(python --version 2>&1)"[(w)2]}; then
		alias http-serve='python -m http.server'
	else
		alias http-serve='python -m SimpleHTTPServer'
	fi
fi

function mkdcd {
	[[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

function cdls {
	builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

function pushdls {
	builtin pushd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

function popdls {
	builtin popd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

function slit {
	awk "{ print ${(j:,:):-\$${^@}} }"
}

function find-exec {
	find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

function psu {
	ps -U "${1:-$LOGNAME}" -o 'pid,%cpu,%mem,command' "${(@)argv[2,-1]}"
}
