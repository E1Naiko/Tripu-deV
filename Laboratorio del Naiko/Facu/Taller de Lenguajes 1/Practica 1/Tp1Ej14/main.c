/*
14. Escriba una función que reciba un número entero y retorne el número resultante de invertir la
posición de todos sus dígitos. Por ejemplo, si se pasa como argumento el número 1234 la función
deberá retorna el número 4321
*/
#include <stdio.h>
#include <stdlib.h>

int invertir(int);
int main()
{
    int n;
    printf("Ingrese un numero a invertir: ");
    scanf("%d", &n);
    printf("El numero %d invertido es: %d", n, invertir(n));
    return 0;
}

int invertir(int n){
    int res=0, dig=0;

    while (n>0){
        dig = n%10;
        res*=10;
        res +=dig;
        n/=10;
    }

    return res;
}
