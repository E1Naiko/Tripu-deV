#include <stdio.h>
#include <stdlib.h>
#define CANT_DATOS 70
#define CANT_SUBINTERVALOS 8
#define INT_SUP 2270
#define INT_INF 370

void cargarDatos(FILE*, float[]);
void cargarResultado(FILE*, float[]);
void swap(float* a, float* b);
int partition(float arr[], int low, int high);
void quickSort(float arr[], int low, int high);
void printArray(float arr[], int size);

int main()
{
    float arregloDatos[CANT_DATOS];
    FILE * archDatos,
        * archRes;

    archDatos = fopen("Datos.txt", "r");
    archRes = fopen("resultado.txt", "w");

    cargarDatos(archDatos, arregloDatos);

    printf("Unsorted array: \n");
    printArray(arregloDatos, CANT_DATOS);

    quickSort(arregloDatos, 0, CANT_DATOS - 1);

    printf("Sorted array: \n");
    printArray(arregloDatos, CANT_DATOS);

    cargarResultado(archRes, arregloDatos);

    fclose(archDatos);
    fclose(archRes);
    return 0;
}

void cargarDatos(FILE * archDatos, float arr[]){
    int i = 0;
    float aux;
    if (archDatos){
        fscanf(archDatos, "%f ", &aux);
        while (!feof(archDatos)){
            arr[i] = aux;
            i+=1;
            fscanf(archDatos, "%f ", &aux);
        }
        fclose(archDatos);
    }
}

void cargarResultado(FILE* archRes, float arreglo[]) {
    float a = INT_INF,
          intervalo = ((float)(INT_SUP - INT_INF) / (float) CANT_SUBINTERVALOS),
          b = a + intervalo,
          marca;
    int i, contadorElementos=0;
    printf("\n%f %f %f", intervalo, arreglo[CANT_DATOS-1], arreglo[0]);

    if (archRes) {
        fprintf(archRes, "\n(%.1f,%.1f] = ", a, b);
        for (i = 0; i < CANT_DATOS; i++){
            if (a<arreglo[i] && arreglo[i]<=b){
                fprintf(archRes,"%.1f ", arreglo[i]);
                contadorElementos +=1;
            }
            else{
                if(arreglo[i]<(b+intervalo)){
                    marca = a+((float)(b-a)/2);
                    fprintf(archRes, "\n ||| ||| Marca de clase: %.1f | Freq f: %d |||\n",marca, contadorElementos);
                    a = b;
                    b += intervalo;
                    contadorElementos = 0;
                    fprintf(archRes, "\n(%.1f,%.1f] = ", a, b);
                }
                else{
                    marca = a+((float)(b-a)/2);
                    fprintf(archRes, "\n ||| ||| Marca de clase: %.1f | Freq f: %d |||\n",marca, contadorElementos);
                    a = b;
                    b += intervalo;
                    contadorElementos = 0;
                    fprintf(archRes, "\n(%.1f,%.1f] = ", a, b);
                }
            }
        }
        marca = a+((float)(b-a)/2);
        fprintf(archRes, "\n ||| ||| Marca de clase: %.1f | Freq f: %d |||\n",marca, contadorElementos);
    }
}




/* Function to swap two elements*/
void swap(float* a, float* b) {
    float temp = *a;
    *a = *b;
    *b = temp;
}

/* Partition function */
int partition(float arr[], int low, int high) {
    float pivot = arr[high];  /* Pivot element */
    int i = (low - 1);

    for (int j = low; j <= high - 1; j++) {
        if (arr[j] <= pivot) {
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
        printf("%.1f ", arr[i]);
    }
    printf("\n");
}
