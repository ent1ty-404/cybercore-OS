CC = i686-elf-gcc
AS = nasm
CFLAGS = -ffreestanding -O2 -Wall -Wextra -m32
LDFLAGS = -T linker.ld -ffreestanding -O2 -nostdlib

all: my_kernel.elf my_kernel.iso

boot.o: boot.asm
	$(AS) -f elf32 boot.asm -o boot.o

kernel.o: kernel.c
	$(CC) -c kernel.c -o kernel.o $(CFLAGS)

my_kernel.elf: boot.o kernel.o
	$(CC) -T linker.ld -o my_kernel.elf -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

my_kernel.iso: my_kernel.elf
	mkdir -p isodir/boot/grub
	cp my_kernel.elf isodir/boot/my_kernel.elf
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o my_kernel.iso isodir

run: my_kernel.iso
	qemu-system-i386 -cdrom my_kernel.iso

clean:
	rm -f *.o my_kernel.elf my_kernel.iso
	rm -rf isodir
