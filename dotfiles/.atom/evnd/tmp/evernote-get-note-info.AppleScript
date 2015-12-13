
on coerceTwoDigit(num)
	if num < 10
		set num to "0" & (num as string)
	else
		set num to (num as string)
	end if
	return num
end coerceTwoDigit

on dateToString(aDate)
	if aDate is missing value then return aDate
	set y to year of aDate as string
	set m to coerceTwoDigit(month of aDate as integer)
	set d to coerceTwoDigit(day of aDate as integer)
	set h to coerceTwoDigit(hours of aDate as integer)
	set mm to coerceTwoDigit(minutes of aDate as integer)
	set ss to coerceTwoDigit(seconds of aDate as integer)
	return y & m & d & "T" & h & mm & ss
end dateToString

on wrapString(inputStr)
	set outputStr to "###@@@" & inputStr & "@@@###"
	return outputStr
end wrapString



on noteInfoToString(title, cdate, mdate, sdate, lat, lon, alti, tags, nbname, nbtype, nlink, rtime, rtimed, rorder)
	set infostr to "{"
	set infostr to infostr & "\"title\": \"" & wrapString(title) & "\", "
	set infostr to infostr & "\"noteLink\": \"" & nlink & "\", "
	set infostr to infostr & "\"enCreationDate\": \"" & cdate & "\", "
	set infostr to infostr & "\"enModificationDate\": \"" & mdate & "\", "
	set infostr to infostr & "\"subjectDate\": \"" & sdate & "\", "
	set infostr to infostr & "\"latitude\": \"" & lat & "\", "
	set infostr to infostr & "\"longitude\": \"" & lon & "\", "
	set infostr to infostr & "\"altitude\": \"" & alti & "\", "
	set infostr to infostr & "\"reminderTime\": \"" & rtime & "\", "
	set infostr to infostr & "\"reminderDoneTime\": \"" & rtimed & "\", "
	set infostr to infostr & "\"reminderOrder\": \"" & rorder & "\", "
	set infostr to infostr & "\"tags\": ["
	repeat with tag in tags
		set tagname to name of tag
		set infostr to infostr & "\"" & wrapString(tagname) & "\", " 
	end repeat
	set infostr to infostr & "\"DummyTag\"]"
	set infostr to infostr & ", \"notebook\": {\"name\":\"" & wrapString(nbname) & "\", "
	set infostr to infostr & "\"type\":\"" & nbtype & "\"}"
	set infostr to infostr & "}"
	return infostr
end noteInfoToString


tell application "Evernote"
	set infostring to missing value
	set pnotes to find notes " created:20150526T020703 -created:20150526T020707"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then
		set title1 to title of note1
		set cdate1 to creation date of note1
		set mdate1 to modification date of note1
		set sdate1 to subject date of note1
		set latitude1 to latitude of note1
		set longitude1 to longitude of note1
		set altitude1 to altitude of note1
		set tags1 to tags of note1
		set notebook1 to notebook of note1
		if notebook1 is not missing value then
			set nbname to name of notebook1
			set nbtype to notebook1's notebook type
		end if
		set notelink1 to note link of note1
		set rtime1 to reminder time of note1
		set rtimedone1 to reminder done time of note1
		set rorder1 to reminder order of note1
		set infostring to "to update"
	end if
end tell
if infostring is missing value then
	set infostring to ""
else
	set cdate1 to dateToString(cdate1)
	set mdate1 to dateToString(mdate1)
	set sdate1 to dateToString(sdate1)
	set rtime1 to dateToString(rtime1)
	set rtimedone1 to dateToString(rtimedone1)
	set rorder1 to dateToString(rorder1)
	set infostring to noteInfoToString(title1, cdate1, mdate1, sdate1, latitude1, longitude1, altitude1, tags1, nbname, nbtype, notelink1, rtime1, rtimedone1, rorder1)
end if
return infostring
