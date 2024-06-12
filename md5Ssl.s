section .data
    message db "test", 0         ; Original message to be hashed
    md5_msg db "MD5 hash: ", 0    ; Message for displaying MD5 hash
    format db "%02x", 0           ; Format for printing MD5 hash

section .note.GNU-stack           ; Note section indicating GNU stack usage

section .bss
    digest resb 16                ; Buffer for storing MD5 hash result

section .text
    global main

main:
    ; Initializing the MD5 function
    mov rdi, message
    call md5_init

    ; Displaying the original message
    mov rdi, message
    call print_string

    ; Calculating MD5 hash
    mov rdi, message
    call md5_hash

    ; Displaying MD5 hash
    mov rdi, md5_msg
    call print_string
    mov rsi, digest
    call print_md5_hash

    ; Program termination
    mov rax, 60         ; syscall exit
    xor rdi, rdi        ; status: 0
    syscall

md5_init:
    ; Initializing MD5 context
    mov rax, 0          ; EVP_MD_CTX_new
    mov rdi, rax
    call EVP_MD_CTX_new
    mov rsi, rax        ; saving context pointer in rsi

    ; Selecting MD5 algorithm
    mov rax, rsi        ; context pointer in rdi
    mov rdi, 1          ; flag for initialization
    call EVP_get_digestbyname

    ; Initializing MD5 algorithm
    mov rax, rsi        ; context pointer in rdi
    mov rdi, rax        ; pointer to context
    mov rsi, rax        ; pointer to MD5 algorithm
    mov rdx, 0          ; no additional parameters
    call EVP_DigestInit

    ret

md5_hash:
    ; Updating MD5 hash
    mov rax, rsi        ; context pointer in rdi
    mov rdi, rax        ; pointer to context
    mov rsi, message    ; pointer to data
    mov rdx, 5          ; data length
    call EVP_DigestUpdate

    ; Finalizing MD5 hash
    mov rax, rsi        ; context pointer in rdi
    mov rdi, rax        ; pointer to context
    mov rsi, digest     ; pointer to output buffer
    call EVP_DigestFinal
    ret

print_string:
    ; Printing a string
    mov rax, 1          ; syscall write
    mov rdx, 5          ; string length
    syscall
    ret

print_md5_hash:
    ; Printing an MD5 hash
    mov rax, 0          ; loop to iterate over the 16 bytes of the hash
    mov rcx, 16
.loop:
    movzx rax, byte [rsi]  ; load a byte of the hash into rax
    mov rdi, format        ; format string "%02x"
    call print_string      ; print the byte in hexadecimal format
    inc rsi                ; move to the next byte of the hash
    dec rcx
    jnz .loop
    ret

; OpenSSL library functions
extern EVP_MD_CTX_new
extern EVP_get_digestbyname
extern EVP_DigestInit
extern EVP_DigestUpdate
extern EVP_DigestFinal
