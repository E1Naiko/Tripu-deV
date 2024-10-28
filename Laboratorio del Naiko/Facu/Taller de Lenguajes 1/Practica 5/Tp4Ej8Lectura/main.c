#include <stdio.h>
#include <stdlib.h>

#define NOMBRE_ARCHIVO2 "numeros.dat"

int main() {
    FILE *archNumeroBIN;
    unsigned char act;  // Use unsigned char for reading single digits

    // Open the binary file for reading
    archNumeroBIN = fopen(NOMBRE_ARCHIVO2, "rb");
    if (!archNumeroBIN) {
        perror("Error opening binary file");
        return -1;
    }

    printf("Contenido de %s:\n", NOMBRE_ARCHIVO2);

    // Read and print the numbers
    while (fread(&act, sizeof(unsigned char), 1, archNumeroBIN) == 1) {
        printf("%d ", act);
    }

    // Check for read error
    if (ferror(archNumeroBIN)) {
        perror("Error reading from binary file");
    }

    fclose(archNumeroBIN);
    return 0;
}
