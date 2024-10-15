/*.Un teléfono móvil tiene varios bits de configuración que permite controlar el encendido y apagado de
dispositivos con el objetivo, generalmente, de ahorrar energía. Cada bit se asocia a un módulo
diferente donde un 1 significa encendido y un 0 apagado. Comenzando desde el bit más significativo,
la descripción de estos bits es la siguiente: Bluetooth, Wifi, GPS, Datos, Cámara Frontal, Cámara
Trasera, Linterna y Vibrar.
Bluetooth Wifi GPS Datos Frontal Trasera Linterna Vibrar
Bit 7 Bit 6 Bit 5 Bit 4 Bit 3 Bit 2 Bit 1 Bit 0
Resuelva:
a. Utilice un tipo enumerativo para representar los distintos módulos que tiene el teléfono,
asignándole a cada integrante un valor que sea potencia de 2. Esta estrategia permite combinar
varios valores en una misma variable, y de esta forma modelar que un módulo está activo cuando
el valor asociado está presente.
b. Defina 2 constantes donde la primera contiene a todos los módulos y otra donde no contenga
ninguno.
c. Dada una variable del tipo definido en a), describa expresiones que permitan:
a. Marcar un módulo como activo
b. Marcar un módulo como inactivo
c. Invertir el estado actual de un módulo
d. Determinar si un módulo esta activo
d. Implemente un programa donde aplique todos los puntos anteriores. */

#include <stdio.h>
#include <stdlib.h>

typedef enum {BLUETOOTH = 2 << 7 , WIFI = 2 << 6, GPS = 2 << 5, DATOS = 2 << 4, FRONTAL =2 << 3, TRASERA = 2 << 2, LINTERNA = 2 << 1, VIBRAR = 2 << 0} modulos;

const int

const int nomodulo = 0;

void imprimirConfiguracion (int );
int moduloactivo(int , modulos m);
int main()
{ int config = nomodulo;

    return 0;
}

int moduloactivo(int c , modulos m)
{
    return c & m;
}

void imprimirConfiguracion (int c )
{
    printf("Estados de los modulos \n");
    printf("Bluetooth: %s \n",moduloactivo(c,BLUETOOTH) ? 'Encendido' : 'Apagado');
    printf("Wifi: %s \n",moduloactivo(c,WIFI) ? 'Encendido' : 'Apagado');
    printf("Gps: %s \n",moduloactivo(c,GPS) ? 'Encendido' : 'Apagado');
    printf("Datos: %s \n",moduloactivo(c,DATOS) ? 'Encendido' : 'Apagado');
    printf("Frontal: %s \n",moduloactivo(c,FRONTAL) ? 'Encendido' : 'Apagado');
    printf("Trasera: %s \n",moduloactivo(c,TRASERA) ? 'Encendido' : 'Apagado');
    printf("Linterna: %s \n",moduloactivo(c,LINTERNA) ? 'Encendido' : 'Apagado');
    printf("Vibrar: %s \n",moduloactivo(c,VIBRAR) ? 'Encendido' : 'Apagado');
}


