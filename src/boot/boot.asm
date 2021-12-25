; Data segment init
[org 0x7c00]

mov ah, 0x0e        ; set startup message
mov bx, startupMsg

printString:
    mov al, [bx]     ; message parameter
    cmp al, 0        ; Check if there are still characters in the message
    je end           ; if last compare true, end this loop
    int 0x10         ; system interrupt for printing ther current character
    inc bx           ; increase the characer pointer
    jmp printString  ; repeat
end:

jmp $

startupMsg: db "SnailOS booted. Welcome!", 0

times 510-($-$$) db 0
db 0x55, 0xaa
