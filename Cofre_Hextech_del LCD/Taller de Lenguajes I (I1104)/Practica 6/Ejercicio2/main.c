#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{   printf("Verificando parametros\n");
    if (argc <2){
        printf("Error de pasaje de parametro");
    }
    int vector[100];
    int i,suma=0;
    printf ("\nLo que esta en el argumento: \n");
    for (i=1; i<argc; i++){
        vector[i]= atoi(argv[i]);
        printf("%d ",vector[i]);
        suma += vector[i];
    }
    float prom = suma/argc;
    printf("\nPromedio es: %.2f",prom);
    printf("\n");
    return 0;
}
