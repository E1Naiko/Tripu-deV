/*
    2. Escriba un programa que calcule e imprima el promedio de 4 números que se pasan como argumentos a
    la función main. En caso de no pasar la cantidad necesaria de parámetros, informar al usuario.

*/

#include <stdio.h>
#include <stdlib.h>

#define CANT_ELEMENTOS 4
#define ERROR -9999.9

int convertirChar_int(char);

int main(int argc, char * argv[])
{
    if (argc==CANT_ELEMENTOS+1){
        int sum = 0, i, conv;
        float res = ERROR;

        for (i=1; i<=CANT_ELEMENTOS; i++){
            conv = convertirChar_int(*argv[i]);
            if (conv == ERROR)
                return -1;
            sum+= conv;
            printf("\nDEBUG - main - sum = %d ; conv = %d ; res = %f", sum, conv, res);
        }
        res = (float)sum / CANT_ELEMENTOS;
        printf("\nDEBUG - main - sum = %d ; conv = %d; res = %f", sum, conv, res);

        (res!=ERROR) ? printf("\n\nPromedio = %.2f",res) : printf("\n\nERROR - El calculo no se actualizo correctamente\n");
    }
    else
        printf("\nERROR - la cantidad de elementos en el argumento no coincide con la cantidad requerida.");



    return 0;
}

int convertirChar_int(char input){
    int res = ERROR;
    if (input >='0' && input <='9')
        res = input - '0';
    printf("\nDEBUG - convertirChar_int -  res = %d", res);
    return res;
}
