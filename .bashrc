unset PROMPT_COMMAND
set -o vi
export PATH=$HOME/.cargo/bin:~/prebin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/bin:/usr/bin:/sbin:/usr/sbin:~/bin:/usr/X11R6/bin

complete -cf sudo

# Set prompt with both git branch name and rbenv version if set
source /usr/local/etc/bash_completion.d/git-prompt.sh
source ~/bin/rbenv-my-version-name
export PS1='\[\e[31;1m\]\h\[\e[0m\][\w$(__git_ps1 " (%s)")$(rbenv-version-name)]% '

export PAGER=less
export EDITOR=nvim
# export GEM_EDITOR=nvim
export LESS=QMdcij10R
export PGDATA=~/Documents/pg_data_13
export PGHOST=~/tmp
export NMAPSERVICES=/opt/local/share/nmap/nmap-services
export CFINPUTS=/opt/local/var/cfengine/inputs
export WEATHER_BUG_KEY=A5584914882
export RAILS_ENV=development
export NMAP_REPO=nmaprepo
# export GIT_EXTERNAL_DIFF=~/bin/myopendiff-git
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export GREP_OPTIONS="--color"
# export CONFIGURE_OPTS="--with-readline-dir=/usr/local/Cellar/readline/6.2.4/"
# export RUBY_CONFIGURE_OPTS=--with-opt-dir="`brew --prefix openssl`:`brew --prefix readline`:`brew --prefix libyaml`:`brew --prefix gdbm`:`brew --prefix libffi`"
alias ls="ls -F"
alias ssh="ssh -C"
alias j=jobs
alias checknet='netstat -na -ptcp | grep ESTAB |egrep -v "(127.0.0.1.*127.0.0.1)"'
eject_drive(){
  hdiutil detach "/Volumes/${1}"
}
alias eject='eject_drive Backer2'
alias gemupdate="(rvm 1.8.7; gem update); (rvm 1.9.1; gem update)"
alias flush="sudo dscacheutil -flushcache"
alias pullr="(cd ~/workspace/rails ; git pull)"
alias pullg="(cd ~/workspace/git ; git pull)"
alias pullrbx="(cd ~/workspace/rubinius ; git pull)"
alias pullruby="(cd ~/workspace/ruby ; git pull)"

alias vib="nvim ~/.bashrc"

# GIT Aliases
alias gs="git status --short"
alias gsr="git show-ref"
alias gcf="git cat-file -p"
alias gsb="git show-branch"
 
# Setup rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source ~/.rbenv/completions/rbenv.bash 
alias rb=rbenv
alias rbv="rbenv versions"
alias rbun="rbenv shell --unset"
alias rbre="rbenv rehash"
rbsh() {
  rbenv shell ${1}
}
bin_puma() {
  bin/puma -b unix:///var/apps/${PWD##*/}.sock
}
alias p=bin_puma
alias rbs=rbsh
alias gl="git log --oneline"
alias bundlenew="bundle install --path=vendor/bundle --without=production"
alias be="bundle exec"

#docker
alias dm="docker-machine"
#TMUX
alias tls="tmux list-session"
alias t12="th 12"
alias t80="tw 12"
alias  ta="tmux attach"
alias  td="tmux -L daemon new -A -s daemon \; split-window -c ~/prj/eight-eight-two"
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

#
alias pgw="psql -c 'select pid,datname,usename,application_name from pg_stat_activity;'"

# ruby webserver
rweb() {
  if [ -z "$1" ] 
  then
    port=9090
  else
    port=${1}
  fi
  ruby -run -e httpd . -p ${port}
}

alias rust-nightly="sh rustup.sh --channel=nightly --prefix=$HOME/bin/rust --disable-sudo"

# export RUST_SRC_PATH=~/clones/rust/src
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src
winbuild() {
  env LIB="/Users/tdoan/lib/windows/ucrt/x64/;/Users/tdoan/lib/windows/um/x64/;/Users/tdoan/lib/windows/VC_lib/amd64/" cargo build --target=x86_64-pc-windows-msvc "$@"
}

# Random
alias rt="printf '\e]0;\a'"

# no more VIM
alias vi=nvim
alias vim=nvim
alias dieselup="cargo install diesel_cli --no-default-features --features postgres"
