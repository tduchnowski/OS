; Move cursor to a specific location on the screen and remember this location
; Parameters:
; 	bh = Y coordinate
; 	bl = X coordinate
; Return: None
MovCursor:
	
; Print a character on the screen, at the current cursor location
; Parameters:
; 	al = character
; 	bl = text color
; 	cx = number of times a character will be printed
; Return: None
PutChar:

; Print a string
; Parameters:
; 	ds:si = zero terminated string
; Return: None
Print:

