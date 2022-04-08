PRAC3B SEGMENT BYTE PUBLIC 'CODE'

PUBLIC _encuentraSubcadena, _calculaSegundoDC

ASSUME CS: PRAC3B

_encuentraSubcadena PROC FAR

    push bp
    mov bp, sp

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