#include <stdio.h>

int convertirBSSDecimal(int binary) {
    int decimal = 0;
    int base = 1;  // 2^0

    while (binary > 0) {
        int last_digit = binary % 10;
        binary = binary / 10;
        decimal += last_digit * base;
        base = base * 2;
    }

    return decimal;
}

int main() {
    FILE *file = fopen("numeros.dat", "rb");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    int number, converted;

    fread(&number, sizeof(int), 1, file);
    while (!feof(file)) {
        converted = convertirBSSDecimal(number);
        printf("Binary: %d => : Decimal %d\n", number, converted);
        fread(&number, sizeof(int), 1, file);
    }

    fclose(file);
    return 0;
}
