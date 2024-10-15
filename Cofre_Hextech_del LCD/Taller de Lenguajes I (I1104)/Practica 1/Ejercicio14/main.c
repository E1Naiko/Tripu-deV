#include <stdio.h>
#include <stdlib.h>
int invertirnum(int);
int main()
{ int num, numinver;
    printf("Escribir numero: ");
    scanf("%d",&num);
    numinver = invertirnum(num);
    printf("El numero invertido: %d", numinver);
    return 0;
}
int invertirnum(int n)
{ int aux;
  int inver=0;
    while (n != 0) {
        aux = n % 10;
        inver = inver*10 + aux;
        n = n/10;
    }
    return inver;
}
