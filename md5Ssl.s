section .data
    message db "hello", 0
    md5_msg db "MD5 hash: ", 0
    format db "%02x", 0

section .note.GNU-stack

section .bss
    digest resb 16

section .text
    global main

main:
    ; Initialisation de la fonction MD5
    mov rdi, message
    call md5_init

    ; Affichage du message original
    mov rdi, message
    call print_string

    ; Calcul du hachage MD5
    mov rdi, message
    call md5_hash

    ; Affichage du hachage MD5
    mov rdi, md5_msg
    call print_string
    mov rsi, digest
    call print_md5_hash

    ; Terminaison du programme
    mov rax, 60         ; syscall exit
    xor rdi, rdi        ; status: 0
    syscall

md5_init:
    ; Initialisation du contexte MD5
    mov rax, 0          ; EVP_MD_CTX_new
    mov rdi, rax
    call EVP_MD_CTX_new
    mov rsi, rax        ; sauvegarde du pointeur de contexte dans rsi

    ; Sélection de l'algorithme MD5
    mov rax, rsi        ; pointeur du contexte dans rdi
    mov rdi, 1          ; flag pour initialisation
    call EVP_get_digestbyname

    ; Initialisation de l'algorithme MD5
    mov rax, rsi        ; pointeur du contexte dans rdi
    mov rdi, rax        ; pointeur vers le contexte
    mov rsi, rax        ; pointeur vers l'algorithme MD5
    mov rdx, 0          ; aucun paramètre additionnel
    call EVP_DigestInit

    ret

md5_hash:
    ; Mise à jour du hachage MD5
    mov rax, rsi        ; pointeur du contexte dans rdi
    mov rdi, rax        ; pointeur vers le contexte
    mov rsi, message    ; pointeur vers les données
    mov rdx, 5          ; longueur des données
    call EVP_DigestUpdate

    ; Finalisation du hachage MD5
    mov rax, rsi        ; pointeur du contexte dans rdi
    mov rdi, rax        ; pointeur vers le contexte
    mov rsi, digest     ; pointeur vers le tampon de sortie
    call EVP_DigestFinal
    ret

print_string:
    ; Affichage d'une chaîne de caractères
    mov rax, 1          ; syscall write
    mov rdx, 5          ; longueur de la chaîne
    syscall
    ret

print_md5_hash:
    ; Affichage d'un hachage MD5
    mov rax, 0          ; boucle pour parcourir les 16 octets du hachage
    mov rcx, 16
.loop:
    movzx rax, byte [rsi]  ; charge un octet du hachage dans rax
    mov rdi, format        ; chaîne de format "%02x"
    call print_string      ; affiche l'octet au format hexadécimal
    inc rsi                ; passe à l'octet suivant du hachage
    dec rcx
    jnz .loop
    ret

; Fonctions de la bibliothèque OpenSSL
extern EVP_MD_CTX_new
extern EVP_get_digestbyname
extern EVP_DigestInit
extern EVP_DigestUpdate
extern EVP_DigestFinal