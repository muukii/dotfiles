set -g fish_prompt_pwd_dir_length 0
function fish_prompt
	set -l last_status $status
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (set_color 6ff)(hostname|cut -d . -f 1)(set_color normal)
	end

	# set_color-detection
	fish -c "git status -s 2> /dev/null"

	set pwd (prompt_pwd)
	set branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | sed -e 's/ //')
	set hostname (hostname)

	segment FFF FFB254 " $branch "
	segment FFF 50B9D3 " $pwd "
	segment FFF 686868 " $hostname "
	segment FFF 414141 " $USER "
	segment_close

	# echo -n "$USER ❯ $__fish_prompt_hostname ❯ "

	# PWD
    #set_color $fish_color_cwd
    #echo -n (prompt_pwd)
    # set_color normal

	echo 


	#set_color yellow	
	#echo -n "$branch "


	if not test $last_status -eq 0
#   	set_color $fish_color_error
#   	echo -n "× "
		segment FFF ED636E " ✖︎ "	
	else
#   	set_color cyan 
#   	echo -n "❯ "
#		segment FFF 3E6A95 " ◉ "
		segment FFF 3E6A95 ' $ '
	end

	segment_close

    set_color normal
end
