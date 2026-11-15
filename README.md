<img width="441" height="99" alt="image" src="https://github.com/user-attachments/assets/b85d0aa7-fcb8-43d8-84d1-617b918487e2" />




## 🚀 Features
- Booting via GRUB (Multiboot compliant).
- Custom 32-bit GDT (coming soon).
- VGA Text Mode driver (80x25, colors).

## 🛠 Prerequisites
To build this OS, you need:
- `i686-elf-gcc` (Cross-compiler)
- `nasm`
- `xorriso`
- `qemu-system-x86`

## 🏗 How to build and run
```bash
make clean
make
make run
