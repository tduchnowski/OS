org 0x7c00
bits 16

start: jmp boot

%include "io_16.asm"
%include "gdt.asm"

hello_msg db "BOOTLOADER - 16 bits", 0ah, 0dh, 0h
hello_msglen equ $ - hello_msg
kernel_msg db "Loading the kernel",0ah,0dh,0h
kernel_msglen equ $ - kernel_msg
BOOT_DRIVE db 0
KERNEL_OFFSET equ 0x1000 ; kernel will be loaded to this address

boot:
	mov [BOOT_DRIVE], dl
	cli ; no interrupts
	cld
	call clear_screen
	mov cx,30
	mov dx, 20 
	call sleep
	mov cx, hello_msglen
	mov bp, hello_msg
	mov dl, 0 
	mov dh, 3
	call print_string
	mov cx,30
	mov dx, 50
	call sleep
	call clear_screen
	call load_kernel
	mov cx,30
	mov dx, 50
	call sleep
	call clear_screen
	call switch_to_pm
	hlt ; halt

%include "print_char_32.asm"
%include "switch_to_32.asm"

bits 16

load_kernel:
	mov cx, kernel_msglen 
	mov bp, kernel_msg
	mov dl, 0 
	mov dh, 3
	call print_string
	mov bx, KERNEL_OFFSET
	mov dh, 15 ; load 15 sectors
	mov dl, [BOOT_DRIVE]
	call load_disk
	ret

bits 32

begin_pm:
	; print a character on the screen to test if it worked	
	call print_char_pm
	call KERNEL_OFFSET
	;jmp $
	hlt


; clear the rest of the bytes with zeroes
times 510 - ($ - $$) db 0
dw 0xAA55 ; boot signature
