
SUBDIRS = kernel/ boot/
# sources and header files
ASM_SOURCES = $(wildcard boot/*.asm)
C_SOURCES = $(wildcard kernel/*.c drivers/*.c boot/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h boot/*.h)
# rule for creating object files' names
OBJ = ${C_SOURCES:.c=.o}

all: run

bootloader: 
	make -C boot/

kernel: kernel/kernel.o ${OBJ}
	i386-elf-ld -o kernel/kernel.bin -Ttext 0x1000 $^ --oformat binary

image: bootloader kernel
	cat boot/bootloader.bin kernel/kernel.bin > image

run: image
	qemu-system-i386 -machine q35 -fda image

debug: image
	qemu-system-i386 -machine q35 -fda image -gdb tcp::26000 -S
	

# rule for building each .o from .c
%.o: %.c
	i386-elf-gcc -ffreestanding -c $< -o $@ 

clean:
	rm image
	rm kernel/*.bin kernel/*.o
	rm boot/bootloader.bin
