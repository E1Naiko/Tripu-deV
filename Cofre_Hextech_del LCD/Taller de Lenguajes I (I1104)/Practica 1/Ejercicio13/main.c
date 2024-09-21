#include <stdio.h>
#include <stdlib.h>
int esprimo (int);
int main()
{int num;
    printf("Escribir numero: ");
    scanf("%d",&num);
    if (esprimo(num)== 0) {
        printf("El numero %d es primo",num);
    }
    else if (esprimo(num)== 1) {
        printf("El numero %d no es primo",num);
    }
    return 0;
}
int esprimo(int num)
{ int i;
    if (num >= 1){
      return 1;
    }
    for ( i = 2; i < i/2; i++) {
        if (num % i == 0) {
            return 1;
        }
    }
    return 0;
}
