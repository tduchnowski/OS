org 0x7c00
bits 16

start: jmp boot

%include "io.asm"
%include "gdt.asm"

; Welcome message
msg db "BOOTLOADER - 16 bits", 0ah, 0dh, 0h
msglen equ $ - msg

boot:
	cli ; no interrupts
	cld
	call clear_screen
	mov cx,30
	mov dx, 20 
	call sleep
	mov cx, msglen
	mov bp, msg
	mov dl, 0 
	mov dh, 3
	call print_string
	mov cx,30
	mov dx, 50
	call sleep
	call switch_to_pm
	hlt ; halt

%include "print_char.asm"
%include "switch_to_pm.asm"

bits 32

begin_pm:
	; print a character on the screen to test if it worked	
	call print_char_pm
	;jmp $
	hlt


; clear the rest of the bytes with zeroes
times 510 - ($ - $$) db 0
dw 0xAA55 ; boot signature
