This is an operating system I try to build from nothing.
It cointains a bootloader (written in assembly) and a kernel (written in C).

Bootloader:
  - after BIOS selects a bootable device, the bootloader's raw instructions (first sector of the image) are loaded into memory address 0x7c00 and CPU's eip is set to that address. At this point the executed instructions are those of the bootloader
  - bootloader is in 16 bit mode and displays an according message to indicate what stage the booting process is in
  - then it loads the second sector of the image (where the kernel instructions are) into the address 0x1000
  - switch to protected mode (32 bit) is being made next
  - a call to 0x1000 is made and at this point kernel takes control

Kernel, right now, contains a screen driver. After it takes control, it disables the cursor and displays a message.
Of course, I'm still working on other drivers.

C code is compiled with gcc built for i386 processor and binutils also for this architecture. For Assembly I use nasm. I test/debug using qemu and gdb.

This book was a great help: https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
