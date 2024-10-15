#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n1,n2,res;
    char c, c2;

    printf("Escriba un numero: \n ");
    scanf("%d",&n1);
    printf("Escriba otro numero: \n ");
    scanf("%d",&n2);
    printf("Escriba un caracter: \n ");
    scanf(" %c",&c);

    switch(c)
    {
    case '+':
        res = n1 + n2;
        break;
    case '-':
        res = n1-n2;
        break;
    case '*':
        res = n1 * n2;
        break;
    case '/':
        res = n1 / n2;
        break;
    default :
        printf("Valor ingresado incorrecto");
        res = 'a';
    }
    if(res != 'a') printf("Resultado: %d\n",res);
    else printf("resultado invalido");
    return 0;
}
