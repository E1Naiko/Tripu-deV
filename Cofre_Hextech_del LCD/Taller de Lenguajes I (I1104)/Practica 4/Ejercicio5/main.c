#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define DIML 100
void Cargar(char *);
void Imprimir(char *);
void Procesar (char *);
int main()
{ char *c;
    c = (char *) malloc(DIML * sizeof(char));
    /* Cargar(c); */
    printf("Poner oracion: \n");
    gets(c);
    Procesar(c);
    Imprimir(c);
    free(c);
    return 0;
}
void Cargar (char *d)
{int i;
    printf("Poner oracion: \n");
    gets(d);
}

void Procesar(char *c)
{ int mayu=0,minu=0,i=0;

    while (c[i] != '\0'){
        if (c[i]>= 65 && c[i]<=90){
            mayu++;
        }
        else minu++;
        i++;
    }
    printf("Cant mayuscula: %d \n",mayu);
    printf("Cant minuscula: %d \n",minu);
}

void Imprimir(char *c)
{ int i;
    printf(" %s",c);
}
