
set -g -x EDITOR vim

# gi
function gi
  curl -L -s https://www.gitignore.io/api/$argv
end

# alias for vim
alias vi='vim -u $HOME/.virc'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias ls "fish -c \"ls -a\""

function reload
	source ~/.config/fish/config.fish
end

function config
	vim ~/.config/fish/config.fish
end
