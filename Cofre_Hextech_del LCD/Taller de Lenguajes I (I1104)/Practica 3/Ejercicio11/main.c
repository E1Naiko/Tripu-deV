#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
void Cargar (int *[],int);
void imprimir (int [],int);
void Recorrer (int [],int);
int main()
{ int n;
  int *num;
    printf("Escribir numero \n");
    scanf("%d",&n);
    num = (int*) malloc(n * sizeof(int));
    Cargar(*num,n);
    printf("---------------------------- \n");
    imprimir(num,n);
    Recorrer(num,n);
    return 0;
}

void Cargar (int *p[],int n)
{ int i;
    srand(time(NULL));
    for(i=0; i<n; i++){
            p[i] = rand()%10;
    }
}
void imprimir (int p[],int n)
{ int i;
    for(i=0; i<n; i++){
        printf("%d ",p[i]);
    }
    printf("\n");
}
void Recorrer (int p[], int n)
{ int i;
  int max = -1;
    for(i=0; i<n; i++){
        if (max > p[i]){
            max = p[i];
        }
    }
    printf("\n");
    printf("El mayor numero es: %d",max);
}
