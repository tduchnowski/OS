gdt_start:

; 8 bytes of null descriptor
gdt_null:
	dd 0x0
	dd 0x0

; code segment descriptor
gdt_code: 
	dw 0xffff
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0

; data segment descriptor
gdt_data:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0

gdt_end:

gdt:
	dw gdt_end - gdt_start - 1 ; size
	dd gdt_start

; constants
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
