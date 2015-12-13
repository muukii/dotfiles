install: symlink xcode vim color atom nvm 

atom:
	sh AtomSync.sh

symlink:
	bash symlink.sh
	touch ~/.zshrc.local
	touch ~/.bashrc.local

xcode:
	sh XcodeLink.sh

color:
	sh ColorsLink.sh

vim:
	mkdir -p ~/.vim/bundle
	git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git

nvm:
	curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash
