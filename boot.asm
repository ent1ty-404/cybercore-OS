; boot.asm
BITS 32
section .multiboot
    MAGIC_NUMBER equ 0x1BADB002
    FLAGS        equ 0x0
    CHECKSUM     equ -MAGIC_NUMBER
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM

section .text
global _start
extern kernel_main

_start:
    ; Настраиваем стек
    mov esp, stack_space
    call kernel_main
    hlt

section .bss
resb 8192 ; 8KB под стек
stack_space:
