install: symlink xcode vim color atom nvm

atom:
	sh AtomSync.sh

symlink:
	bash symlink.sh
	touch ~/.zshrc.local
	touch ~/.bashrc.local

xcode:
	sh XcodeLink.sh
	defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES

color:
	sh ColorsLink.sh

vim:
	mkdir -p ~/.vim/bundle
	git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git

nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

gvm:
	bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

zsh:
	brew install zsh
	brew install z
	brew install zsh-syntax-highlighting
	brew install peco
	sudo sh -c 'echo $(which zsh) >> /etc/shells'
	chsh -s /usr/local/bin/zsh

fish_config:
	ln -sf $(PWD)/fish $(HOME)/.config/

direnv:
	brew install direnv

rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

swiftenv:
	git clone https://github.com/kylef/swiftenv.git ~/.swiftenv
