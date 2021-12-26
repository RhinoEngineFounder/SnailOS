; Data segment init
[org 0x7c00]

mov ah, 0x0e        ; set startup message
mov bx, startupMsg

puts:
    mov al, [bx]     ; message parameter
    cmp al, 0        ; Check if there are still characters in the message
    je end           ; if last compare true, end this loop and load kernel
    int 0x10         ; system interrupt for printing ther current character
    inc bx           ; increase the characer pointer
    jmp puts         ; repeat
end:

ReadDisk:
    mov bx, 0x8000 ; segment
    mov es, bx
    mov bx, 0x0000 ; offset

    mov ah, 0x02   ; read function
    mov al, 0x01   ; sectors
    mov ch, 0x00   ; cylinder
    mov cl, 0x02   ; sector
    mov dh, 0x00   ; head
    mov dl, 0x80
    int 0x13
    jc ReadDisk
    jmp [es:bx]

jmp $ ; hang

startupMsg: db "SnailOS booted. Welcome!", 0

times 510-($-$$) db 0
db 0x55, 0xaa
