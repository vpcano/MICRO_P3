#include <stdio.h>

#define MAX_STR 32

int imparPositivo(int num);
int calculaDigito(unsigned int num, unsigned int pos);
unsigned int siguientePrimo(unsigned int n);

int encuentraSubcadena(char *str, char *substr);
unsigned int calculaSegundoDC(char *numCuenta);

void print_menu(int *opt) {
    printf("\n\n\nSelecciona una opcion:\n");
    printf("\t1. imparPositivo\n");
    printf("\t2. calculaDigito\n");
    printf("\t3. siguientePrimo\n");
    printf("\t4. encuentraSubcadena\n");
    printf("\t5. calculaSegundoDC\n");
    printf("\t6. salir del programa\n");
    printf("Introduce un numero: ");

    scanf("%d", opt);
}

int main() {
    int opcion, n1, n2, res, on;
    char str1[MAX_STR], str2[MAX_STR];

    on = 1;
    while (on) {
        print_menu(&opcion);
        res = -1;   // Para saber si la funcion lo ha cambiado

        switch(opcion) {
            case 1:
                printf("Introduce un numero: ");
                scanf("%d", &n1);
                res = imparPositivo(n1);
                break;

            case 2:
                printf("Introduce un numero positivo: ");
                scanf("%d", &n1);
                printf("Introduce otro numero positivo (posicion): ");
                scanf("%d", &n2);
                res = calculaDigito(n1, n2);
                break;

            case 3:
                printf("Introduce un numero positivo: ");
                scanf("%d", &n1);
                res = siguientePrimo(n1);
                break;

            case 4:
                printf("Introduce la cadena: ");
                scanf("%s", str1);
                printf("Introduce la subcadena: ");
                scanf("%s", str2);
                res = encuentraSubcadena(str1, str2);
                break;

            case 5:
                printf("Introduce un numero de cuenta: ");
                scanf("%s", str2);
                res = calculaSegundoDC(str1);
                break;

            case 6:
                on = 0;
                break;

            default:
                printf("Error: opcion no valida\n");
                break;
        }

        printf("El resultado obtenido es %d\n", res);
    }


    return 0;
}
