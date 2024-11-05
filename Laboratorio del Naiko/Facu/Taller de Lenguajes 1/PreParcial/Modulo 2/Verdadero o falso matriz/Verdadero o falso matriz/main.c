#include <stdio.h>
#include <stdlib.h>

int main() {
    int M[3][2] = {
        {10, 20},
        {30, 40},
        {50, 60}
    };

    printf("El valor de M[2][0] usando (M + 4) es: %d\n", *((int *)M + 4));

    return 0;
}
