#include <stdio.h>
#include <stdlib.h>

#define CANT_DATOS 85
#define CANT_SUBINTERVALOS 8
#define INT_SUP 9900.0
#define INT_INF 1900.0

void cargarDatos(FILE*, float[]);
void cargarResultado(FILE*, float[]);
void cargarCSV(FILE*, float[]);
void swap(float* a, float* b);
int partition(float arr[], int low, int high);
void quickSort(float arr[], int low, int high);
void printArray(float arr[], int size);

int main() {
    float arregloDatos[CANT_DATOS];
    FILE *archDatos,
         *archRes,
         *archCSV;

    archDatos = fopen("Datos.txt", "r");
    if (!archDatos) {
        printf("ERROR - Datos.txt no se abrió\n");
        return -1;
    }

    archRes = fopen("Resultado.txt", "w");
    if (!archRes) {
        printf("ERROR - Resultado.txt no se abrió\n");
        fclose(archDatos);
        return -2;
    }

    archCSV = fopen("Resultado.csv", "w");
    if (!archRes) {
        printf("ERROR - Resultado.csv no se abrió\n");
        fclose(archDatos);
        fclose(archRes);
        return -3;
    }

    cargarDatos(archDatos, arregloDatos);

    printf("Unsorted array: \n");
    printArray(arregloDatos, CANT_DATOS);

    quickSort(arregloDatos, 0, CANT_DATOS - 1);

    printf("Sorted array: \n");
    printArray(arregloDatos, CANT_DATOS);

    cargarResultado(archRes, arregloDatos);
    cargarCSV(archCSV, arregloDatos);

    fclose(archDatos);
    fclose(archRes);
    fclose(archCSV);
    return 0;
}

void cargarDatos(FILE *archDatos, float arr[]) {
    int i = 0;
    while (i < CANT_DATOS && fscanf(archDatos, "%f, ", &arr[i]) == 1) {
        i++;
    }
}

void cargarResultado(FILE* archRes, float arreglo[]) {
    float a = INT_INF,
          intervalo = (float)(INT_SUP - INT_INF) / CANT_SUBINTERVALOS,
          b = a + intervalo;
    int contadorElementos = 0, contTotal = 0;

    if (archRes) {
        // Print header for the results
        fprintf(archRes, "Intervalos y frecuencias:\n");
        fprintf(archRes, "---------------------------------\n");

        for (int i = 0; i < CANT_DATOS; i++) {
                contTotal++;
            // Check if current element is within the current interval
            if (arreglo[i] > b) {
                // Print the previous interval's data
                float marca = a + (b - a) / 2;
                fprintf(archRes, "Intervalo: (%.1f, %.1f] | ", a, b);
                fprintf(archRes, "Marca de clase: %.1f | Frecuencia: %d\n", marca, contadorElementos);

                // Move to the next interval
                a = b;
                b += intervalo;
                contadorElementos = 0;
            }
            // Count elements in the current interval
            if (arreglo[i] > a && arreglo[i] <= b) {
                contadorElementos++;
            }
        }

        // Print the last interval's data
        float marca = a + (b - a) / 2;
        fprintf(archRes, "Intervalo: (%.1f, %.1f] | ", a, b);
        fprintf(archRes, "Marca de clase: %.1f | Frecuencia: %d\n", marca, contadorElementos);

        fprintf(archRes, "---------------------------------\n");
        fprintf(archRes, " CANTIDAD TOTAL DE ELEMENTOS :%d/%d", contTotal, CANT_DATOS);
        fprintf(archRes, " CANTIDAD DE SUBINTERVALOS :%d", CANT_SUBINTERVALOS);
        fprintf(archRes, " INTERVALO : (%.1f,%.1f)", INT_INF, INT_SUP);
    }
}

void cargarCSV(FILE* archCSV, float arreglo[]) {
    float a = INT_INF,
          intervalo = (float)(INT_SUP - INT_INF) / CANT_SUBINTERVALOS,
          b = a + intervalo;
    int j = 0;

    if (archCSV) {
        // Iterate through the intervals
        while (a < INT_SUP) {
            // Prepare the interval string
            fprintf(archCSV, "(%.1f-%.1f];", a, b);

            // Print all values in the current interval
            while (j < CANT_DATOS && arreglo[j] <= b) {
                fprintf(archCSV, "%.1f;", arreglo[j]);
                j++;
            }

            // Move to the next interval
            a = b;
            b += intervalo;
            fprintf(archCSV, "\n"); // New line after each interval
        }
    }
}


/* Function to swap two elements */
void swap(float* a, float* b) {
    float temp = *a;
    *a = *b;
    *b = temp;
}

/* Modified Partition function */
int partition(float arr[], int low, int high) {
    float pivot = arr[high];
    int i = (low - 1);

    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

/* Quick Sort function */
void quickSort(float arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

/* Function to print the array */
void printArray(float arr[], int size) {
    for (int i = 0; i < size; i++) {
        if (i > 0 && i % 5 == 0) printf("\n");
        printf("%.2f ", arr[i]);
    }
    printf("\n");
}
