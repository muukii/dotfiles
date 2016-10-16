set -g fish_prompt_pwd_dir_length 0
function fish_prompt
	set -l last_status $status
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (set_color 6ff)(hostname|cut -d . -f 1)(set_color normal)
	end

	# set_color-detection
	git status -s 2> /dev/null

	segment 111 white hello
	segment_close

	echo -n "$USER ❯ $__fish_prompt_hostname ❯ "

	# PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

	echo 

	set branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | sed -e 's/ //')

	set_color yellow	
	echo -n "$branch "

	segment 111 white "$branch"
	segment_close

    if not test $last_status -eq 0
    	set_color $fish_color_error
		echo -n "× "
	else
    	set_color cyan 
    	echo -n "❯ "
    end

    set_color normal
end
