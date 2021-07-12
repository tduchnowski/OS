#!/bin/bash
cd boot
nasm -f bin bootloader.asm -o bootloader
cd ..
#dd if=/dev/zero of=disk.img bs=512 count=2880
gcc -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs kernel/kernel.c -o kernel/kernel.o
objcopy --dump-section .text=kernel/kernel.bin kernel/kernel.o
cat boot/bootloader kernel/kernel.bin > image
#dd conv=notrunc if=image of=disk.img bs=512
qemu-system-i386 -machine q35 -fda image #-gdb tcp::26000 -S

