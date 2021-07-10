bits 32

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f
CHAR equ 0x41

print_char_pm:
	pusha
	mov edx, VIDEO_MEMORY
	mov al, CHAR
	mov ah, WHITE_ON_BLACK
	mov [edx], ax
	popa
	ret

