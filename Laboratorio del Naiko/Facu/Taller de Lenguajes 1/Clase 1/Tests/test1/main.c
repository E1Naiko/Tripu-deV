/* USO GENERAL DE VARIABLES Y FUNCIONES APRENDIDAS*/

#include <stdio.h>

int main()
{
    printf("Aloja!\n");

    int num1, num2, num3, num4, num5, numA, aux;

    num1=1;
    num2=2;
    num3= num1+num2;
    num4= num2*2;

    printf("Introduzca numero 5: ");
    scanf("%d",&num5);

    printf("Esto se imprime en este orden: %d , %d , %d, %d, %d \n", num2, num1, num3, num4, num5);
    /*como redondear en fotocopia de catedra */

    for (numA=0; numA<10; numA=numA+1) printf("\n For1: %d", numA);
    printf("\n");
    for (numA=0; numA<10; numA++) printf("\n For2: %d", numA);
    printf("\n");
    for (numA=0; numA<10; ++numA) printf("\n For3: %d", numA);
    printf("\n");

    /*Condicionales simples y multiples igual que siempre*/
    /*pero NO EXISTEN BOOLEANOS, 0 = false cualquier otra cosa es true*/
    printf("\n");
    scanf("%d", &aux);
    if (aux==3) printf("aux es 3 \n");
        else printf("aux no es 3, es tu hermana \n");
    if (3) printf("3 es 3 \n");
    if (0) printf("xd \n");
    printf("\n");

    for (numA=0; numA<10; numA++){
        if (numA==7) break; // break termina la iteracion hasta el proximo }
        printf("\n Break: %d", numA);
    }
    printf("\n");

    for (numA=0; numA<10; numA++){
        if (numA==7) continue; // continuo saltea a la siguiente instruccion proxima al }
        printf("\n Continue: %d", numA);
    }

    return 0; // Esto siempre lo tenes
}
