# python
#export PATH=~/.pyenv/shims:/"$HOME/.pyenv/bin:$PATH":usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:${PATH}
#eval "$(pyenv init -)"
export PATH=$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH
#export PATH=$HOME/.pyenv/versions/2.7.8/bin:$PATH

# go version manager
if [ -s "$HOME/.gvm/scripts/gvm" ]; then
  source "$HOME/.gvm/scripts/gvm"
  gvm use go1.5.3
fi

# Go
#export GOPATH=~/go
#export PATH="$GOPATH/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"


# swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

# direnv
eval "$(direnv hook zsh)"
export EDITOR="vim"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
	eval "$(rbenv init -)"
fi
