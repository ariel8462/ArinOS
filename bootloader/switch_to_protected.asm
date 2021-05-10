[bits 16]

switch_to_pm:
    cli ; Disables interrupts

    lgdt [gdt_descriptor] ; Loads the GDT descriptor

    mov eax, cr0
    or eax, 0x1 ; Sets the default mode as 32-bit
    mov cr0, eax

    jmp CODE_SEG:init_pm


[bits 32]
init_pm:
    mov ax, DATA_SEG ; Updates the segment registers to the new mode
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp
    call begin_pm