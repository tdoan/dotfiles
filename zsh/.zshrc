ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ] ; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit
autoload -Uz tetriscurses

bindkey '^f' autosuggest-accept
bindkey '^e' expand-or-complete

eval "$(oh-my-posh init zsh)"

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

eval "$(fzf --zsh)"

export EDITOR=vi
bindkey " " magic-space
bindkey "^o" clear-screen
eval "$(rbenv init - zsh)"
alias ls=exa
alias la="exa -la"
alias tailscale=/Applications/Tailscale.app/Contents/MacOS/Tailscale
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
export PATH=~/bin:$PATH
export PGDATA=/Users/tdoan/Documents/pgdata
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
