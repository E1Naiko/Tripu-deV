#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define CANT_EJERCICIOS 4

int operacion(); /* Si la operacion se resolvio de manera correcta devuelve 1 y sino 0 */

int main()
{
    int i;
    char puntuacion = 'E';
    for (i=0; i<4;i++){
        if (operacion())
            puntuacion--;
    }
    printf("\nPuntuacion obtenida: %c", puntuacion);

    return 0;
}

int operacion(){
    int x, y, f, resp; /* f= resultado real, resp: respuesta del alumno */
    srand(time(NULL));

    x = rand()%101;
    y = rand()%101;
    f = x+y;

    printf("\nResuelva: %d + %d = ",x,y);
    scanf("%d",&resp);
    printf("Respuesta real: %d", f);

    return ((resp==f) ? 1 : 0);
}
