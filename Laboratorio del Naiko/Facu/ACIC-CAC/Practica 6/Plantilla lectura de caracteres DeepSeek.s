; Si se escribe en DATA un número entero y se escribe un 1 en CONTROL, se interpretará el valor escrito en DATA como
; un entero sin signo y se lo imprimirá en la pantalla alfanumérica de la terminal.

; ▪ Si se escribe en DATA un número entero y se escribe un 2 en CONTROL, se interpretará el valor escrito en DATA como
;   un entero con signo y se lo imprimirá en la pantalla alfanumérica de la terminal.

; ▪ Si se escribe en DATA un número en punto flotante y se escribe un 3 en CONTROL, se imprimirá en la pantalla
;   alfanumérica de la terminal el número en punto flotante.

; ▪ Si se escribe en DATA la dirección de memoria del comienzo de una cadena terminada en 0 y se escribe un 4 en
;   CONTROL, se imprimirá la cadena en la pantalla alfanumérica de la terminal.

; ▪ Si se escribe en DATA un color expresado en RGB (usando 4 bytes para representarlo: un byte para cada componente
;   de color e ignorando el valor del cuarto byte), en DATA+4 la coordenada Y, en DATA+5 la coordenada X y se escribe
;   un 5 en CONTROL, se pintará con el color indicado un punto de la pantalla gráfica de la terminal, cuyas coordenadas
;   están indicadas por X e Y. La pantalla gráfica cuenta con una resolución de 50x50 puntos, siendo (0, 0) las
;   coordenadas del punto en la esquina inferior izquierda y (49, 49) las del punto en la esquina superior derecha.

; ▪ Si se escribe un 6 en CONTROL, se limpia la pantalla alfanumérica de la terminal.

; ▪ Si se escribe un 7 en CONTROL, se limpia la pantalla gráfica de la terminal.

; ▪ Si se escribe un 8 en CONTROL, se permitirá ingresar en la terminal un número (entero o en punto flotante) y el valor
;   del número ingresado estará disponible para ser leído en DATA.

; ▪ Si se escribe un 9 en CONTROL, se esperará a que se presione una tecla en la terminal (la cuál no se mostrará al ser
;   presionada) y el código ASCII de dicha tecla estará disponible para ser leído en DATA.

.data
    CONTROL: .word32 0x10000
    DATA:    .word32 0x10008
    buffer:  .space 2      ; Almacenamiento para el carácter + byte nulo

.text
    lwu $s1, CONTROL(r0)  ; Cargar dirección de CONTROL
    lwu $s0, DATA(r0)     ; Cargar dirección de DATA

    ; Solicitar lectura de carácter (operación 9)
    daddi $t0, $zero, 9   ; Código para leer carácter
    sd $t0, 0($s1)        ; Escribir en CONTROL

    ; Leer carácter desde DATA (ASCII en byte menos significativo)
    lbu $t1, 0($s0)       ; Leer byte de DATA

    ; Almacenar carácter en buffer y agregar nulo
    daddi $t2, $zero, buffer  ; Dirección del buffer
    sb $t1, 0($t2)            ; Guardar carácter
    sb $zero, 1($t2)          ; Byte nulo para terminación

    ; Configurar impresión de cadena (operación 4)
    sd $t2, 0($s0)         ; Dirección del buffer en DATA
    daddi $t0, $zero, 4    ; Código para imprimir cadena
    sd $t0, 0($s1)         ; Escribir en CONTROL

halt