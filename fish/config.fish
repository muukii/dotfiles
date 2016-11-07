

# gi
function gi
  curl -L -s https://www.gitignore.io/api/$argv
end

# alias for vim
alias vi='vim -u $HOME/.virc'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias ls "fish -c \"ls -a\""

set -g -x EDITOR vim

# direnv
eval (direnv hook fish)

# rbenv
rbenv init - | source

function reload
	source ~/.config/fish/config.fish
end

function config
	vim ~/.config/fish/config.fish
end

function config_prompt
	vim ~/.config/fish/functions/fish_prompt.fish
end
