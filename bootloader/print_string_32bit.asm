[bits 32]

; Prints a string while in 32-bit protected mode

VIDEO_MEMORY equ 0xB8000
WHITE_OB_BLACK equ 0x0F

print_string_pm:
	pusha
	mov edx, VIDEO_MEMORY

print_string_pm_loop:
	mov al, [ebx]
	mov ah, WHITE_OB_BLACK

	cmp al, 0
    jne print_string_pm_continue_loop

	popa
    ret

print_string_pm_continue_loop:
    mov [edx], ax
    add ebx, 1
    add edx, 2

	jmp print_string_pm_loop