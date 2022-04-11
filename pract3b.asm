PRAC3B SEGMENT BYTE PUBLIC 'CODE'

PUBLIC _encuentraSubcadena, _calculaSegundoDC

ASSUME CS: PRAC3B

_encuentraSubcadena PROC FAR

    push bp
    mov bp, sp
    push si di ds es bx cx dx

    lds si, [bp + 6]    ; str
    les di, [bp + 10]   ; substr
    mov ax, 0

    sig_intento:
        cmp byte ptr [si], 0
        je no_encontrado
        mov bx, -1

        sig_car:
            inc bx
            mov dl, es:[di][bx]
            cmp dl, 0
            je fin
            mov cl, [si][bx]
            cmp cl, 0
            je no_encontrado
            cmp dl, cl
            je sig_car
            inc ax
            inc si
            jmp sig_intento

    no_encontrado:
        mov ax, -1

    fin:
        pop dx cx bx es ds di si
        pop bp
        ret

_encuentraSubcadena ENDP



_calculaSegundoDC PROC FAR

    push bp
    mov bp, sp

    pop bp
    ret

_calculaSegundoDC ENDP


PRAC3B ENDS ; FIN DEL SEGMENTO DE CODIGO
END ; FIN DE pract3a.asm
