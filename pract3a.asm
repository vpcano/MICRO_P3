PRAC3A SEGMENT BYTE PUBLIC 'CODE'

PUBLIC _imparPositivo, _calculaDigito, _siguientePrimo

ASSUME CS: PRAC3A

_imparPositivo PROC FAR

    PUSH BP
    MOV BP, SP

    ; recuperar argumentos
    mov ax, [bp+6]
    and ax, 8001h

    cmp ax, 8001h
    je yes
    mov ax, 0
    jmp fin
    yes:
        mov ax, 1

    fin:

    POP BP

    RET

_imparPositivo ENDP


_calculaDigito PROC FAR

    PUSH BP
    MOV BP, SP

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

    POP BP

    RET

_calculaDigito ENDP


_siguientePrimo PROC FAR

    PUSH BP
    MOV BP, SP

    ; salvar registros a usar

    ; recuperar argumentos

    ; ...

    ; mover a ax (o a dx:ax) retorno de la funcion

    ;recuperar registros usados

    POP BP

    RET

_siguientePrimo ENDP


PRAC3A ENDS ; FIN DEL SEGMENTO DE CODIGO
END ; FIN DE pract3a.asm