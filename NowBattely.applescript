set scriptresult to do shell script "pmset -g everything | grep  Cycles"
set splitedList to splitText(scriptresult, ";")
set buttelyPer to item 3 of splitedList
display notification buttelyPer with title "Now battery" sound name "Frog"

on splitText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText
