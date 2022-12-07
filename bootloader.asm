org 0x7C00
bits 16

_start:
    mov eax, 0xB8000                        ; move vga text buffer to eax register
    
    mov ecx, 0                              ; set ecx to 0
buffer_loop:                                ; 25 is the buffer height, 80 is the buffer width, using 2000 because its the sum of multiplying them
    mov byte[eax + ecx], 0x00               ; clear buffer
    inc ecx                                 ; increment ecx by 1
    cmp ecx, 2000                           ; compare 
    jl buffer_loop                          ; continues loop if its less than 2000 

    mov byte[eax], 0x48                     ; start to write Hello, first character is "H" 
    mov byte[eax + 1], 0x07                 ; set color code, grey on black bg, so on and so forth : 0x07
    mov byte[eax + 2], 0x65                 ; "e"   
    mov byte[eax + 3], 0x07                        
    mov byte[eax + 4], 0x6C                 ; "l"   
    mov byte[eax + 5], 0x07   
    mov byte[eax + 6], 0x6C                 ; "l"   
    mov byte[eax + 7], 0x07   
    mov byte[eax + 8], 0x6F                 ; "o"   
    mov byte[eax + 9], 0x07                 

    jmp $                                   ; infinite loop             


times 510-($-$$) db 0                       ; filler bytes to make drive bootable

db 0x55                                     
db 0xAA                                     ; boot signature
