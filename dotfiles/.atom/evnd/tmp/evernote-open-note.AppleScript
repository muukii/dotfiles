tell application "Evernote"
	set infostring to missing value
	set note1 to find note "evernote:///view/6116633/s55/f0494b5f-faa0-4e53-bd46-7baf96e94adb/f0494b5f-faa0-4e53-bd46-7baf96e94adb/"
	if note1 is not missing value then
		open note window with note1
		set window1 to open note window with note1
		set visible of window1 to false
		set visible of window1 to true
	end if
end tell
tell application "System Events" to tell process "Evernote"
	set frontmost to true
end tell
