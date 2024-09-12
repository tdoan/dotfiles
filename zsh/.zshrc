ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ] ; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-history-substring-search

autoload -U compinit && compinit
autoload -Uz tetriscurses

bindkey -v
bindkey '^f' autosuggest-accept
bindkey '^e' forward-word
bindkey '^g' autosuggest-clear
bindkey '^n' autosuggest-fetch
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey " " magic-space
bindkey "^o" clear-screen

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

export PATH=~/bin:$PATH
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/catppuccin_mocha.omp.json)"

#HISTORY
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

if type fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi

export EDITOR=vi
export VISUAL=vi
if type nvim &>/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
  alias vi=nvim
  alias vim=nvim
fi

if type rbenv &>/dev/null; then
  eval "$(rbenv init - zsh)"
fi
if type exa &>/dev/null; then
  alias ls=exa
fi
if type exa &>/dev/null; then
  alias ls=exa
  alias la="exa -la"
fi
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=prompt-bottom,hicolor

#TMUX
alias tls="tmux list-session"
alias t12="th 12"
alias t80="tw 12"
alias  ta="tmux attach"
alias  td="tmux -L daemon new -A -s daemon \; split-window -c ~/prj/eight-eight-two"

up ()
{
brew update
brew outdated
rustup update
cargo install-update -a -l
rbenv each -v gem outdated
}

tnn ()
{
  tn ${PWD##*/}
}

tn() {
  tmux new -A -s ${1}
}

tw() {
  tmux resizep -x ${1}
}

th() {
  tmux resizep -y ${1}
}

vd() {
  nvim `pwd`
}

title()
{
   # change the title of the current window or tab
   echo -ne "\033]0;$*\007"
}

ssh()
{
   /usr/bin/ssh "$@"
   # revert the window title after the ssh command
   title $USER@$HOST
}

# eval "$(starship init zsh)"
export PGDATA=/Users/tdoan/Documents/pgdata
if type brew&>/dev/null; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi
