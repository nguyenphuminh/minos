; Multiboot header
section .multiboot
align 4
    dd 0x1BADB002           ; Magic number
    dd 0x00                 ; Flags
    dd -(0x1BADB002 + 0x00) ; Checksum

; Kernel body
section .text
global _start

_start:
    ; Move to VGA memory address
    mov edi, 0xB8000
    
    ; Print "Hello, World!" with white text and black background
    ; Each character is 2 bytes, 1 for char and 1 for attribute
    mov word [edi], 0x0748    ; 'H'
    mov word [edi+2], 0x0765  ; 'e'
    mov word [edi+4], 0x076C  ; 'l'
    mov word [edi+6], 0x076C  ; 'l'
    mov word [edi+8], 0x076F  ; 'o'
    mov word [edi+10], 0x072C ; ','
    mov word [edi+12], 0x0720 ; ' '
    mov word [edi+14], 0x0757 ; 'W'
    mov word [edi+16], 0x076F ; 'o'
    mov word [edi+18], 0x0772 ; 'r'
    mov word [edi+20], 0x076C ; 'l'
    mov word [edi+22], 0x0764 ; 'd'
    mov word [edi+24], 0x0721 ; '!'

.loop:
    hlt       ; Halt the CPU to save power
    jmp .loop ; Keep the CPU halted
