tell application "Evernote"
	set pnotes to find notes "[Note ID: de6e83184c6c435030c57d1dd90467d4] created:20150526T020703 -created:20150526T020707"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
