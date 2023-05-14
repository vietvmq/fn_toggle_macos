tell application "System Preferences"
	-- open window to handle
	-- if not, handle unvisible
	activate
	set current pane to pane "com.apple.preference.keyboard"
	reveal anchor "keyboardTab" of pane "com.apple.preference.keyboard"
end tell

tell application "System Events"
	if UI elements enabled then
		tell application process "System Preferences"
			-- waiting to open KeyboardTab
			repeat until exists tab group 1 of window "Keyboard"
			end repeat
			tell tab group 1 of window "Keyboard"
				-- Check text value of element.
				-- FYI: These value is based on current. If OS is higher of lower, that has different value.
				if value of pop up button 2 is "App Controls" then
					click pop up button 2
					click menu item "F1, F2, etc. Keys" of menu 1 of pop up button 2
					click pop up button 4
					click menu item "Show App Controls" of menu 1 of pop up button 4
					display notification "Function Key was changed" with title "Toggle FN Keys" sound name "Frog"
				else if value of pop up button 2 is "F1, F2, etc. Keys" then
					click pop up button 2
					click menu item "App Controls" of menu 1 of pop up button 2
					click pop up button 4
					click menu item "Show F1, F2, etc. Keys" of menu 1 of pop up button 4
					display notification "Special Key was changed" with title "Toggle FN Keys" sound name "Frog"
				end if
			end tell
		end tell
		tell application "System Preferences" to quit
	else
		-- GUI scripting not enabled.  
		-- Display an alert
		tell application "System Preferences"
			activate
			set current pane to pane "com.apple.preference.security"
			display dialog "UI element scripting is not enabled. Please activate this app under Privacy -> Accessibility so it can access the settings it needs."
		end tell
	end if
end tell