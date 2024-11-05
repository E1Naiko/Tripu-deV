#include <stdio.h>
#include <stdlib.h>

int potencia(int x, int y){ // – Eleva x a la y-ésima potencia.
    if (y==0)
        return 1;
    else{
        int res =1,
            i;
        if (y>0)
            for (i=1; i<=y; i++)
                res*=x;
        else{
            for (i=1; i<=-y; i++)
                res*=x;
            res = 1/res;
            }
        return res;
    }
}

int cuadrado(int x){ // – Eleva x al cuadrado.
    return x*x;
}

int cubo(int x){ // – Eleva x al cubo.
    return x*x*x;
}

int absoluto(int i){ // – Retorna el valor absoluto entero de i.
    if (i>=0)
        return i;
    else
        return -i;
}

int factorial (int i){ // – Retorna el factorial de i.
    if (i==0)
        return 1;
    else
        return i*factorial(i-1);
}

int sumatoria (int i){ // – Retorna la sumatoria de 0 hasta i.
    int res = 0,
        j;
    for (j=0; j<=i; j++){
        res +=j;
    }
    return res;
}

int multiplo (int x, int y){ // – Retorna 1 si y es divisor de x, 0 en otro caso.
    if (x%y)
        return 0;
    else
        return 1;
}

int divisor (int x, int y){ // – Retorna 1 si y es múltiplo de x, 0 en otro caso.
    if (y%x)
        return 0;
    else
        return 1;
}

int par (int i){ // – Retorna 1 si i es par, 0 en otro caso.
    if (i%2)
        return 0;
    else
        return 1;
}

int impar (int i){ // – Retorna 1 si i es impar, 0 en otro caso.
    return i%2;
}
