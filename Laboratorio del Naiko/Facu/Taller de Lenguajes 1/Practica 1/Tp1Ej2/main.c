/*
2. Investigue los diferentes tipos de datos del lenguaje C y luego responda:

a. ¿Qué ocurre cuando asignamos un char a un int? ¿y al revés? Ejecute el siguiente
código y analice lo que imprime. ¿Se presenta algún warning al compilar?

    Se convierte al caracter de la tabla ascii correspondiente redondeado entre (-128,127).
    Se convierte a un entero, dentro del rango asignado por leguaje. No.

b. ¿Qué diferencia existe entre los tipos float y double? ¿se puede asignar entre si sin
inconvenientes?
    La diferencia esta en el número mas grande que pueden admitir, double ocupà el doble de
    memoria que un float por lo que admite numeros mas grandes, si asignamos un float a un
    double no hay problema pero si asignamos un double a un float excederemos el limite de
    memoria y se compenzara a otro numero.

c. ¿Qué sucede cuando en una operación intervienen operadores diferentes?
Por ejemplo: x = 2*32+10%2-1;
    Todos los operadores se ejecutan por jerarquia definida por lenguaje de
    izquierda a derecha.

d. Investigue el operador sizeof. ¿Para qué sirve? Luego aplíquelo y verifique el tamaño de
los distintos tipos de datos en su máquina.

*/

#include <stdio.h>
int main(){
    char c = 'a';
    int x = 64;

    printf("char c= %c\n", x);
    printf("int x= %d\n", c);

    x = 2*32+10%2-1;
    printf("int x= %d\n", x);

    printf("Tamaño de int : %d bytes\n", sizeof(x));
    printf("Tamaño de char : %d bytes\n", sizeof(c));

    return 0;
}
