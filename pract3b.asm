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
    push bx dx si

    lds si, [bp+6]
    mov bx, 0
    mov dx, 0

    mov dl, 1
    call calcularSuma
    mov dl, 2
    call calcularSuma
    mov dl, 4
    call calcularSuma
    mov dl, 8
    call calcularSuma
    mov dl, 5
    call calcularSuma
    mov dl, 10
    call calcularSuma
    mov dl, 9
    call calcularSuma
    mov dl, 7
    call calcularSuma
    mov dl, 3
    call calcularSuma
    mov dl, 6
    call calcularSuma
    jmp modulo

    calcularSuma:
        mov ah, 0
        mov dh, 0
        mov al, [si]
        sub al, '0'
        mul dl
        add bx, ax
        inc si
        ret

    modulo:
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
        pop si dx bx 
        pop bp
        ret

_calculaSegundoDC ENDP


PRAC3B ENDS ; FIN DEL SEGMENTO DE CODIGO
END ; FIN DE pract3b.asm
