; bootloader.asm

org 0x7c00
bits 16
start: jmp boot

%include "io.asm"

; Welcome message
msg:
	db "COSMIC OS HAS AWAKENED", 0ah, 0dh, 0h

msglen equ $ - msg

boot:
	cli ; no interrupts
	cld ; all that we need to init
	mov cx, msglen
	mov bp, msg
	call print_string
	hlt ; halt

; clear the rest of the bytes with zeroes

times 510 - ($ - $$) db 0
dw 0xAA55 ; boot signature
