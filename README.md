##  MinOS

MinOS is the absolute simplest implementation of an operating system kernel that just prints out "Hello, World!", written in x86 assembly. The kernel source code is in `kernel.asm`, and there are also utilities to build an ISO.

### Build and run

Build binary:
```sh
nasm -f elf32 kernel.asm -o kernel.o
ld -m elf_i386 -T linker.ld -o kernel.bin kernel.o
```

Build a bootable ISO:
```sh
mv kernel.bin ./iso/boot/
grub-mkrescue iso -o minos.iso
```

Finally, you can take this iso and boot it, to test, we can use qemu:
```sh
qemu-system-x86_64 -cdrom minos.iso
```

Of course you should have these tools installed first:
```sh
sudo apt update
sudo apt install nasm qemu-system-x86 grub-common grub-pc-bin xorriso
```
