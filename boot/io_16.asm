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
; 	CX:DX = interval in microseconds
sleep:
	mov al, 0
	mov ah, 86h
	int 15h
	ret

; Load disk
; Params:
; 	dh = number of sectors needed to be read
; 	dl = drive
; Return:
; 	es:bx = location of the loaded data
; TODO: handle error (when carry flag is set by the BIOS function)
load_disk:
	push dx
	mov ah, 0x02 ; BIOS read sector function
	mov al, dh
	mov ch, 0x0 ; cylinder 0
	mov dh, 0x0 ; head 0
	mov cl, 0x02 ; read from second sector
	int 0x13
	pop dx
	ret

