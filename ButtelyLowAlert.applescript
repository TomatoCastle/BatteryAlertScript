display notification "If this mac's buttely level is low, I noteice." with title "Script Stert"
delay 10
repeat
	set scriptresult to do shell script "pmset -g everything | grep  Cycles"
	set splitedList to splitText(scriptresult, ";")
	set buttelyPer to item 3 of splitedList
	set buttelyInteger to findAndReplaceInText(findAndReplaceInText(buttelyPer, "%", ""), " ", "") as integer
	if buttelyInteger < 21 then
		display notification buttelyPer with title "Now battery" sound name "Frog"
	end if
	delay 120
end repeat

on splitText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText

on findAndReplaceInText(theText, theSearchString, theReplacementString)
	set AppleScript's text item delimiters to theSearchString
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to theReplacementString
	set theText to theTextItems as string
	set AppleScript's text item delimiters to ""
	return theText
end findAndReplaceInText
