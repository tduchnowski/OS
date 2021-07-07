; bootloader.asm

org 0x7c00
bits 16
start: jmp boot

msg db "COSMIC OS HAS AWAKENED", 0ah, 0dh, 0h
msglen equ $ - msg

boot:
	cli ; no interrupts
	cld ; all that we need to init
	; Write string
	mov al, 1
	mov bh, 0
	mov bl, 0eh
	mov cx, msglen
	mov dl, 30
	mov dh, 15 
	push cs
	pop es
	mov bp, msg
	mov ah, 13h
	int 10h
	hlt ; halt

; clear the rest of the bytes with zeroes

times 510 - ($ - $$) db 0
dw 0xAA55 ; boot signature
