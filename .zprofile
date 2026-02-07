# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

export SDKMAN_DIR="$HOME/.sdkman"
test -s "$HOME/.sdkman/bin/sdkman-init.sh" && source "$HOME/.sdkman/bin/sdkman-init.sh" # This loads sdkman

export NVM_DIR="$HOME/.nvm"
test -s "$NVM_DIR/nvm.sh" && source "$NVM_DIR/nvm.sh"  # This loads nvm
test -s "$NVM_DIR/bash_completion" && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.cargo/env"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
test -s "/home/treyvon/.bun/_bun" && source "/home/treyvon/.bun/_bun" # This loads bun completions

eval "$(luarocks path --bin)"
