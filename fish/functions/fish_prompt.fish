set -g fish_prompt_pwd_dir_length 5 
function fish_prompt
	set -l last_status $status

    set -l git_status (git status -s 2> /dev/null)
	printf "%s\n" $git_status 

	set pwd (prompt_pwd)
	set branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set hostname (hostname)
    set date (date "+$c2%H$c0:$c2%M$c0:$c2%S")

    if test "$branch" != ""
        segment FFF CC6A80 " $branch "
    end
	segment FFF 50B9D3 " $pwd "
	segment FFF 404244 " $hostname "
	segment FFF 353739 " $USER "
    segment FFF 303234 " $date "
	segment_close

	echo 

	if not test $last_status -eq 0
		segment FFF ED636E " ✖︎ "	
	else
		segment FFF 3E6A95 ' $ '
	end

	segment_close
end

