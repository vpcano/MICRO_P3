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
    push bx cx dx si ds

    lds si, [bp + 6]
    mov bx, 0
    mov cx, 10
    mov dx, 1

    calcularSuma:
        mov ah, 0
        mov al, [si]
        sub al, 48
        mul dl
        add bx, ax
        xchg ax, dx
        shl ax, 1
        mov dx, 11
        div dl
        mov dh, 0
        mov dl, ah
        inc si
        dec cx
        jne calcularSuma

    mov dx, 0
    mov ax, bx
    mov bx, 11
    div bx
    cmp dx, 1
    je final

    sub dx, 11
    neg dx

    final:
        mov ax, dx
        pop ds si dx cx bx 
        pop bp
        ret

_calculaSegundoDC ENDP


PRAC3B ENDS ; FIN DEL SEGMENTO DE CODIGO
END ; FIN DE pract3b.asm
