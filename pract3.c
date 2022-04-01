#include <stdio.h>

int imparPositivo(int num);
int calculaDigito(unsigned int num, unsigned int pos);
unsigned int siguientePrimo(unsigned int n);

int main() {
    char opcion;
    int n1, n2, res;

    printf("Selecciona una opcion:\n");
    printf("\t1. imparPositivo\n");
    printf("\t2. calculaDigito\n");
    printf("\t3. siguientePrimo\n");
    printf("Introduce un numero: ");

    scanf("%c", &opcion);

    res = -1;   // Para saber si la funcion lo ha cambiado

    switch(opcion) {
        case '1':
            printf("Introduce un numero: ");
            scanf("%d", &n1);
            res = imparPositivo(n1);
            break;

        case '2':
            printf("Introduce un numero positivo: ");
            scanf("%d", &n1);
            printf("Introduce otro numero positivo (posicion): ");
            scanf("%d", &n2);
            res = calculaDigito(n1, n2);
            break;

        case '3':
            printf("Introduce un numero positivo: ");
            scanf("%d", &n1);
            res = siguientePrimo(n1);
            break;

        default:
            printf("Error: opcion no valida\n");
            return 1;
    }

    printf("El resultado obtenido es %d\n", res);

    return 0;
}