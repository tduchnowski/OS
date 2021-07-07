#!/bin/bash

nasm -f bin bootloader.asm -o bootloader
dd if=/dev/zero of=disk.img bs=512 count=2880
dd conv=notrunc if=bootloader of=disk.img bs=512
qemu-system-i386 -machine q35 -fda disk.img -gdb tcp::26000 -S

