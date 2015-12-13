#!bin/bash

TARGET=$HOME
DOTFILESDIR=$HOME/dotfiles/dotfiles/
IGNOREFILES=('..' '.hgrc' '.DS_Store')

cd $DOTFILESDIR
if [[ $all_flag == 1 ]]; then
	ignore_len=1
else
	ignore_len=${#IGNOREFILES[@]}
fi
for dotfile in .?*; do
	# check ignored files
	for (( i = 0; i < $ignore_len; i++ ))
	do
		ignore_flag=1
		if [[ $dotfile == ${IGNOREFILES[$i]} ]]; then
			ignore_flag=0
			break
		fi
	done
	if [[ $ignore_flag == 1 ]]; then
		if [[ -f $dotfile ]]; then
			ln -sf $PWD/$dotfile $TARGET
			suffix="@"
		elif [[ -d $dotfile ]]; then
			ln -sf $PWD/$dotfile $TARGET/
			suffix="/"
		fi
		echo "created $1/$dotfile$suffix"
	fi
done
