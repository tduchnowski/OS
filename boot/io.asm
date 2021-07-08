; Prints a yellow string
; Params:
; 	cx = number of characters in a string 
; 	bp = pointer to a string
; 	dh = row
; 	dl = column
print_string:
	mov al, 1
	mov bh, 0
	mov bl, 0eh ; color
	push cs
	pop es
	mov ah, 13h
	int 10h
	ret
	
; Clear the whole screen
clear_screen:
	mov ah, 0
	mov al, 0x03
	int 10h
	ret

; Sleep
; Params:
; 	CX:DX = interval in miliseconds
sleep:
	mov al, 0
	mov ah, 86h
	int 15h
	ret
