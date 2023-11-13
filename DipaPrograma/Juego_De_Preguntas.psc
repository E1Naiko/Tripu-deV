Funcion respuesta <- SeleccionarPreguntaAleatoria(bloque)
    Definir pregunta, respuesta Como Cadena
    Definir indice Como Entero
    indice = Aleatorio(1, 8)
    pregunta = bloque[indice, 1]
    respuesta = bloque[indice, 2]
    Mostrar "Pregunta: " + pregunta
FinFuncion

Funcion iniciodejuego
    Definir nombre, respuestadejuego, respuestaContinuar, respuestaUsuario Como Cadena
    Escribir "Ingrese nombre: "
    Leer nombre
    Mostrar "Hola, " + nombre + ". ¿Listo para jugar (S/N)?"
    Leer respuestadejuego
    Si respuestadejuego = "S" Entonces
        Repetir
            respuestaUsuario = SeleccionarPreguntaAleatoria(bloque)
            Mostrar "Respuesta del usuario: " + respuestaUsuario
            Mostrar "¿Desea continuar? (S/N)"
            Leer respuestaContinuar
        Hasta Que respuestaContinuar <> "S"
    FinSi
FinFuncion

Algoritmo Juego_De_Preguntas
    Dimension bloque[8, 2]
    bloque[1, 1] = "Cuanto es 2 + 2"
    bloque[1, 2] = "Respuesta 1.1"
    bloque[2, 1] = "Pregunta 1.2"
    bloque[2, 2] = "Respuesta 1.2"
    bloque[3, 1] = "Pregunta 1.3"
    bloque[3, 2] = "Respuesta 1.3"
    bloque[4, 1] = "Pregunta 1.4"
    bloque[4, 2] = "Respuesta 1.4"
    bloque[5, 1] = "Pregunta 1.5"
    bloque[5, 2] = "Respuesta 1.5"
    bloque[6, 1] = "Pregunta 1.6"
    bloque[6, 2] = "Respuesta 1.6"
    bloque[7, 1] = "Pregunta 1.7"
    bloque[7, 2] = "Respuesta 1.7"
    bloque[8, 1] = "Pregunta 1.8"
    bloque[8, 2] = "Respuesta 1.8"
    
    iniciodejuego
    respuesta <- SeleccionarPreguntaAleatoria(bloque)
	
FinAlgoritmo
