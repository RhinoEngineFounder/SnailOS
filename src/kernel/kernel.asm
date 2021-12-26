[org 0]

mov ah, 0x0e
mov bx, msg

puts: 
    mov al, [bx]
    cmp al, 0
    je end
    inc bx
    jmp puts
end:

msg: db "Kernel loaded. Ready!"

jmp $ ; hang
