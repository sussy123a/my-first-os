BITS 16
ORG 0x7C00

start:
    ; Set video mode
    mov ah, 0x0E  

    ; Print "Hello, OS!"
    mov si, msg
print_loop:
    lodsb
    or al, al
    jz done
    int 0x10
    jmp print_loop

done:
    hlt
    jmp $

msg db 'Hello, OS!', 0

    ; Boot sector signature
    times 510-($-$$) db 0
    dw 0xAA55
