[org 0x7c00]

KERNEL_OFFSET equ 0x1000

    mov [BOOT_DRIVE], dl
    mov bp, 0x9000
    mov sp, bp

    mov bx, REAL_MODE_MESSAGE
    call print
    call print_new_line

    call load_kernel
    call switch_to_pm
    jmp $

%include "print_string.asm"
%include "print_hex.asm"
%include "load_disk.asm"
%include "gdt.asm"
%include "print_string_32bit.asm"
%include "switch_to_protected.asm"

[bits 16]
load_kernel:
    mov bx, KERNEL_MODE_MESSAGE
    call print
    call print_new_line

    mov bx, KERNEL_OFFSET
    mov dh, 32
    mov dl, [BOOT_DRIVE]
    call disk_load
    ret


[bits 32]
begin_pm:
    mov ebx, PROTECTED_MODE_MESSAGE
    call print_string_pm
    jmp $


BOOT_DRIVE db 0
REAL_MODE_MESSAGE db 'Started in 16-bit real mode', 0
PROTECTED_MODE_MESSAGE db 'Located 32-bit protected mode', 0
KERNEL_MODE_MESSAGE db 'Loading kernel into memory', 0


times 510-($-$$) db 0
dw 0xAA55