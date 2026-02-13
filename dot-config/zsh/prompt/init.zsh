autoload -Uz promptinit && promptinit

zstyle -a ':zsh:module:prompt' theme 'prompt_argv' || prompt_argv='default'
case $prompt_argv[1] in
	"starship")
	export STARSHIP_CONFIG=~/.config/zsh/prompt/starship.toml
	eval "$(starship init zsh)"
	;;
	*)
	prompt "$prompt_argv[@]"
	;;
esac
unset prompt_argv

