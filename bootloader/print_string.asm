print:
    pusha

start:
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, 0x0E
    int 10h

    add bx, 1
    jmp start


done:
    popa
    ret


print_new_line:
    pusha

    mov ah, 0x0E
    mov al, 0x0A
    int 10h
    mov al, 0x0D
    int 10h

    popa
    ret