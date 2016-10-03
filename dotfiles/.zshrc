# vim:set fdm=marker:
#
# File:        .zshrc
# Maintainer:  Shintaro Kaneko <kaneshin0120@gmail.com>
# Last Change: 18-Sep-2016.

# source common shell run command
source ~/.shrc.common

# use key map like emacs
bindkey -e

# history settings
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# append history when exit shell
setopt append_history

# extended format for history
setopt extended_history

# beep when no history
unsetopt hist_beep

# delete duplicated history when register command
setopt hist_ignore_all_dups

# don't register history if the command with leading spaces
setopt hist_ignore_space

# remove extra spaces from command
setopt hist_reduce_blanks

# don't run command when matching
setopt hist_verify

# share history with all zsh process
setopt share_history

# make key map for history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


# prompt settings
# variable expansion for prompt
setopt prompt_subst

# expansion of percent for prompt variable
setopt prompt_percent

# output CR when generating characters without trailing CR into prompt
setopt prompt_cr

# visible CR when output CR by prompt_cr
setopt prompt_sp

DEFAULT='❯'
SUCCESS='❯'
ERROR='✕'

APPEND=''
if [ -n "${DOCKER_CONTAINER}" ]; then
	APPEND='Attached '
fi
# PROMPT1
PS1="%{[0m%}
%{[37m%}\$(parse_git_status)%{[0m%}
%{[31m%}${APPEND}[32m%}${DEFAULT} %n ${DEFAULT} %m ${DEFAULT} %{[33m%}%~%{[0m%}
%(?|%{[36m%}${SUCCESS}|%{[31m%}${ERROR})%{[35m%}\$(parse_git_branch) %{[0m%}"

# PROMPT2
PS2="%_> "

# PROMPT for correct
SPROMPT="zsh: Did you mean: %{[4m[31m%}%r%{[14m[0m%} [nyae]? "


# completion settings
autoload -Uz compinit
compinit -u
# don't create new prompt
setopt always_last_prompt

# do like putting * on cursor when complement
setopt complete_in_word

# output list automatically
setopt auto_list

# completion when pushed key for complement twice
unsetopt bash_auto_list

# move a command of candidates
setopt auto_menu

# set a command immediately
unsetopt menu_complete

# don't substring alias when complement
setopt complete_aliases

# beep when no result
unsetopt list_beep

# reduce line of list
setopt list_packed

# show trailing character of file
setopt list_types

# set candidate immediately
# zstyle ':completion:*' menu true

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=3
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# color settings
autoload -U colors: colors

# auto change directory
setopt auto_cd

# correct command
setopt correct

setopt auto_pushd
setopt cdable_vars
setopt pushd_ignore_dups
setopt auto_param_slash
setopt mark_dirs
setopt auto_param_keys
setopt interactive_comments
setopt magic_equal_subst
setopt print_eight_bit
setopt extended_glob
setopt globdots

brew=`which brew 2>&1`
if [[ $? == 0 ]]; then
        . `brew --prefix`/etc/profile.d/z.sh
fi
function precmd ()
{
        brew=`which brew 2>&1`
        if [[ $? == 0 ]]; then
                _z --add "$(pwd -P)"
        fi
}


# gi
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

#local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# alias
alias ls='ls -a -G'
alias dev='cd ~/Develop'

## docker
alias dl='docker ps -l -q'
alias da='docker ps -a'
alias dat='docker attach `dl`'

## server
alias server='python -m SimpleHTTPServer'

## processing
alias processing='processing-java'

# Check $fpath
echo $fpath

# Create a symbolic link
ln -s /Library/Frameworks/CarthageKit.framework/Versions/A/Scripts/carthage-zsh-completion /path/to/fpath/directory/_carthage

## peco
function ch() {
	git ch `git ba | peco --layout bottom-up --prompt "Git Branch" | sed 's|remotes/origin/||'`
}
function zz() {
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco --layout bottom-up --prompt "Dir")
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N zz
bindkey '^t' zz

## anyframe
#fpath=($HOME/.zsh/anyframe(N-/) $fpath)
#autoload -Uz anyframe-init
#anyframe-init
