#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define DIML 5
void Inicializar (int []);
void Imprimir (int []);
void Invertir (int []);
void swap (int);
int main()
{ int vector[DIML];
    srand (time(NULL));
    Inicializar (vector);
    Imprimir (vector);
    Invertir (vector);
    Imprimir (vector);
    return 0;
}
void Inicializar (int v[])
{ int c;
    for (c=0; c < DIML; c++) v[c] = rand()/10;
}
void Imprimir (int v[])
{ int i;
    printf("\n V = ( ");
    for (i=0; i< DIML; i++) {
        printf(" %d", v[i]);
        printf(", ");
    }
    printf(")");
}
void swap(int a, int b)
{
 int tp;
 tp = a; // guarda el valor de a
 a = b; // almacena b en a
 b = tp; // almacena a en b
}

void Invertir (int v[])
{ int i;
  int aux=0;
    for (i=0; i<DIML; i++){
        swap(v[i],aux);
        v[i] = aux;
    }
}


