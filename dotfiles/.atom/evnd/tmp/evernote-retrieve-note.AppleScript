tell application "Evernote"
	set note1 to find note "evernote:///view/6116633/s55/f0494b5f-faa0-4e53-bd46-7baf96e94adb/f0494b5f-faa0-4e53-bd46-7baf96e94adb/"
	if note1 is not missing value then
		export [note1] to "/Users/Muukii/dotfiles/dotfiles/.atom/evnd/20150526/ever-notedownテスト_evernote.enex" format ENEX
		export [note1] to "/Users/Muukii/dotfiles/dotfiles/.atom/evnd/20150526/ever-notedownテスト_evernote.html" format HTML
	end if
end tell
