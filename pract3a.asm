PRAC3A SEGMENT BYTE PUBLIC 'CODE'

PUBLIC _imparPositivo, _calculaDigito, _siguientePrimo

ASSUME CS: PRAC3A

_imparPositivo PROC FAR

    PUSH BP
    MOV BP, SP

    ; recuperar argumentos
    mov ax, [bp+6]
    and ax, 8001h

    cmp ax, 1
    je fin
    mov ax, 0

    fin:
        POP BP

        RET

_imparPositivo ENDP


_calculaDigito PROC FAR

    PUSH BP
    MOV BP, SP
    
    push bx cx dx

    ; recuperar argumentos
    mov cx, [bp+8]
    mov ax, [bp+6]

    mov bx, 10
    inc cx

    dividir:
        mov dx, 0
        div bx
        loop dividir

    mov ax, dx

    pop dx cx bx
    POP BP

    RET

_calculaDigito ENDP


_siguientePrimo PROC FAR

    PUSH BP
    MOV BP, SP

    ; salvar registros a usar
    push bx cx dx

    mov bx, [bp+6]
    sig_num:
        inc bx
        call is_prime
        cmp ax, 0
        jne finP
        jmp sig_num

    ; recibe en bx el numero que queremos comprobar que es primo
    ; si no es primo devuelve 0 en ax
    ; si es primo, devuelve en ax el propio numero
    is_prime PROC NEAR
        mov cx, 1
        sig_factor:
            inc cx
            cmp cx, bx
            je yesP
            mov ax, bx
            mov dx, 0
            div cx
            cmp dx, 0
            jne sig_factor
            ; no es primo
            mov ax, 0
            ret

        yesP:
            mov ax, bx
            ret
    
    is_prime ENDP

    finP:

        ;recuperar registros usados
        pop dx cx bx

        POP BP

        RET

_siguientePrimo ENDP


PRAC3A ENDS ; FIN DEL SEGMENTO DE CODIGO
END ; FIN DE pract3a.asm