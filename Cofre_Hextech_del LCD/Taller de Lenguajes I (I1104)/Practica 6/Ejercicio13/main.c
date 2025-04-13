#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {
    int x = 2, y = 3;
    int *m = (int*) malloc(x * y * sizeof(int));
    srand(time(NULL));
    for (int i = 0; i < x; i++) {
        for (int j = 0; j < y; j++) {
            m[i*y+j] = rand() % 51;
        }
    }
    printf("Matriz:\n");
    for (int i = 0; i < x; i++) {
        for (int j = 0; j < y; j++) {
            printf("%d ", m[i * y + j]);
        }
        printf("\n");
    }
    free(m);
    return 0;
}
