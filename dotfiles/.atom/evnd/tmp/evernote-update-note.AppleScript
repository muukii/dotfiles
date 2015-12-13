on readFile(unixPath)
	set targetFile to (open for access (POSIX file unixPath))
	set newcontent to (read targetFile as «class utf8»)
	close access targetFile
	return newcontent
end readFile

set newcontent to readFile("/Users/Muukii/dotfiles/dotfiles/.atom/evnd/20150526/atom_ever-notedownのてすと.html")
set infostr to ""
tell application "Evernote"
	set pnotes to find notes " created:20150526T020703 -created:20150526T020707"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then
		if (notebook named "Couples-iOS" exists) then
			move note1 to notebook "Couples-iOS"
		else
			set infostr to infostr & "(notebook does not exist)"
		end if
		set title of note1 to "Atom:: Ever-notedownのてすと"
		set HTML content of note1 to newcontent
		set oldtags to tags of note1
		set count2 to count of oldtags
		if count2 is not 0 then
			unassign oldtags from note1
		end if
		if (not (tag named "evnd" exists)) then
			set tag1 to make tag with properties {name: "evnd"}
		else
			set tag1 to tag "evnd"
		end if
		assign tag1 to note1
		set date1 to modification date of note1
	end if
end tell

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

if date1 is not missing value then
	set infostr to infostr & dateToString(date1)
	return infostr
else
	return infostr
end if
