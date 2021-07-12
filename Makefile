
# sources and header files
C_SOURCES = $(wildcard kernel/*.c drivers/*.c boot/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h boot/*.h)
# rule for creating object files' names
OBJ = ${C_SOURCES: .c = .o}

all: run

# rule for building each .o from .c
%.o: %.c
	i386-elf-gcc -ffreestanding -c $< -o $@ 

bootloader.bin:
	cd boot;nasm -f bin bootloader.asm -o $@

kernel.bin: ${OBJ}
	i386-elf-ld -o kernel/$@ -Ttext 0x1000 kernel/kernel.o --oformat binary


image: bootloader.bin kernel.bin
	cat boot/bootloader.bin kernel/kernel.bin > image

run: image
	qemu-system-i386 -machine q35 -fda image

debug: image
	qemu-system-i386 -machine q35 -fda image -gdb tcp::26000 -S
	


