#!/bin/sh

function make ()
{
	APPSUP="~/Library/Application\ Support/"
	BASE="$HOME/dotfiles/ide/Xcode/"
	DEVELOPER="$HOME/Library/Developer/"
	ln -s -f "$BASE"Shared/ ~/Library/Application\ Support/Developer/
	ln -s -f "$BASE"KeyBindings/ "$DEVELOPER"Xcode/UserData/
	ln -s -f "$BASE"FontAndColorThemes/ "$DEVELOPER"Xcode/UserData/
	ln -s -f "$BASE"CodeSnippets/ "$DEVELOPER"Xcode/UserData/
	ln -s -f "$BASE"Templates/ "$DEVELOPER"Xcode/
}

make
