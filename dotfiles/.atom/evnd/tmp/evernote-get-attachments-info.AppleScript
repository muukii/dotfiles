tell application "Evernote"
	set pnotes to find notes " created:20150526T020703 -created:20150526T020707"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is missing value then
		set infostring to ""
	else
		set myattachments to every attachment of note1
		set infostring to "{\""
		repeat with theattachment in myattachments
			set afilename to filename of theattachment
			if afilename is missing value then
				set afilename to hash of theattachment
			end if
			set hashvalue to hash of theattachment
			set infostring to infostring & hashvalue & "\": {\"hash\": \""
			set infostring to infostring & hashvalue & "\", \"filename\": \""
			set infostring to infostring & afilename & "\", \"mime\": \""
			set mimetype to mime of theattachment
			set infostring to infostring & mimetype & "\", \"size\": "
			set filesize to size of theattachment
			set infostring to infostring & filesize & ", \"sourceURL\": \""
			set sourceurl to source URL of theattachment
			set infostring to infostring & sourceurl & "\", \"longitude\": \""
			set elongitude to longitude of theattachment
			set infostring to infostring & elongitude & "\", \"latitude\": \""
			set elatitude to latitude of theattachment
			set infostring to infostring & elatitude & "\", \"altitude\": \""
			set ealtitude to altitude of theattachment
			set infostring to infostring & "\"}, \""
		end repeat
		set infostring to infostring & "endoflist\":0}"
	end if
	return infostring
end tell
