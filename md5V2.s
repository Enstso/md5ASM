section .data
    ; MD5 Constants
    A_initial dq 0x67452301
    B_initial dq 0xEFCDAB89
    C_initial dq 0x98BADCFE
    D_initial dq 0x10325476

    ; Constants K
    K dq 0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee
    dq 0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501
    dq 0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be
    dq 0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821
    dq 0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa
    dq 0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8
    dq 0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed
    dq 0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a
    dq 0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c
    dq 0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70
    dq 0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05
    dq 0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665
    dq 0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039
    dq 0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1
    dq 0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1
    dq 0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391

    ; Shifts
    shifts db 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22
    db 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20
    db 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23
    db 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21

    ; Message "test" and its preprocessing
    message db 'test', 0x80 ; Add a '1' bit
    message_padding times 56 - ($ - message) db 0 ; Add '0' bits to reach 448 bits
    message_length dq 32    ; Length of the original message in bits (32 bits = 4 * 8)

section .bss
    ; Variables to store the final result
    result resb 16

section .text
    global _start

_start:
    ; Initialize registers
    mov rax, qword [A_initial]
    mov rbx, qword [B_initial]
    mov rcx, qword [C_initial]
    mov rdx, qword [D_initial]

    ; Pointer to the message
    mov rsi, message

    ; Call the function to process the block
    call process_block

    ; Store the final result
    mov qword [result], rax
    mov qword [result+8], rbx
    mov qword [result+16], rcx
    mov qword [result+24], rdx

    mov rax,1
    mov rdi,1
    mov rsi, result
    mov rdx, 48
    syscall 

    ; End of the program
    mov rax, 60         ; Syscall number for 'exit'
    xor rdi, rdi       ; Exit code 0
    syscall

process_block:
    ; Save initial values
    push rax
    push rbx
    push rcx
    push rdx

    ; Temporary variables
    mov rdi, 0

.loop:
    ; Calculate F, G, H, I
    mov rax, qword [rsp+32] ; a
    mov rbx, qword [rsp+40] ; b
    mov rcx, qword [rsp+48] ; c
    mov rdx, qword [rsp+56] ; d

    mov rsi, rdi
    shl rsi, 2              ; 4 * i
    add rsi, K
    mov rsi, qword [rsi]    ; K[i]

    ; Perform F, G, H, I operations
    ; F
    mov r8, rbx
    and r8, rcx
    not rcx
    and rcx, rax
    or rax, r8
    add rax, rsi

    ; G
    mov r8, rdx
    and r8, rax
    not rax
    and rax, rbx
    or rbx, r8
    add rbx, rsi

    ; H
    mov r8, rcx
    xor r8, rax
    xor r8, rdx
    add rbx, r8
    add rbx, qword [rsp + 64 + rdi * 8] ; Add M[i]

    ; I
    mov r8, rax
    xor r8, rbx
    xor r8, rcx
    add rbx, r8
    add rbx, rsi

    ; Left rotation
    mov cl, byte [shifts + rdi] ; Load the number of shifts
    shl rbx, cl ; Left shift by the specified amount

    ; Exchange values between registers
    mov rax, rdx
    mov rdx, rcx
    mov rcx, rbx
    mov rbx, r8

    ; Increment the counter
    add rdi, 1
    cmp rdi, 16 ; Number of rounds for each 512-bit block
    jl .loop

    ; Restore initial values
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ; Add the result to the previous block
    add qword [rsp+32], rax
    add qword [rsp+40], rbx
    add qword [rsp+48], rcx
    add qword [rsp+56], rdx

    ret