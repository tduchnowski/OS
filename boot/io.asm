; Prints a yellow string
; Params:
; 	cx = number of characters in a string 
; 	bp = pointer to a string
print_string:
	mov al, 1
	mov bh, 0
	mov bl, 0eh ; color
	mov dl, 30 ; row
	mov dh, 15 ; column
	;mov cx, msglen
	push cs
	pop es
	;mov bp, msg 
	mov ah, 13h
	int 10h
	ret
	
