.data 

inicio: .space 100; bloque de memoria reservada 
CONTROL: .word32 0x10000 
DATA: .word32 0x10008 
  
 .text 


 lwu $s0, DATA(r0) ; $s0 = dirección de DATA
 daddi $t1, $0,inicio ;cargar en t1 dirección de inicio de la cadena 
 daddi $t2 , $0, 0 ;indice
 daddi $t4, $0, 32 ;guarda el codigo de espacio

 lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL 
 daddi $t0, $0, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica 
 sd $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla  
 
loop: 
	lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL 
 	daddi $t0, $0, 9; control recibe 9 y guarda elemento en DATA
	sd $t0, 0($s1) ;Enviamos 9 a control
	lbu $t3, 0($s0) ;Cargamos contenido de DATA en t3
	sb $t3,inicio($t2) ;guardamos dato en tabla; (¡¡ EL TAMAÑO SIII IMPORTAAAAA!!!!!!!!!)
	daddi $t2, $t2,1 ; avanzamos índice
	bne $t3,$t4,loop ; si no hay espacio vuelve a empezar
	daddi $t2, $t2, 1
	sd $0,inicio($t2) ;GUARDA 0 AL FINAL DE LA CADENA
	
 sd $t1, 0($s0) ; cargamos inicio del mensaje en DATA


 daddi $t0, $0, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII 
 sd $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje 



 halt 