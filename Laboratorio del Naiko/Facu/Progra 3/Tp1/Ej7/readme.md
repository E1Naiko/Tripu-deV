7. Uso de las estructuras de listas provistas por la API de Java. Para resolver este punto cree el paquete tp1.ejercicio7
    
    a. Escriba una clase llamada TestArrayList cuyo método main recibe una secuencia de números, los agrega a una lista de tipo ArrayList, y luego de haber agregado todos los números a la lista, imprime el contenido de la misma iterando sobre cada elemento.
    
    b. Si en lugar de usar un ArrayList en el inciso anterior hubiera usado un LinkedList ¿Qué diferencia encuentra respecto de la implementación? Justifique ninguna, porque no la veo.
    
    c. ¿Existen otras alternativas para recorrer los elementos de la lista del punto 7a.?
    
    d. Escriba un método que realice las siguientes acciones:
        ■ cree una lista que contenga 3 estudiantes
        ■ genere una nueva lista que sea una copia de la lista del inciso i
        ■ imprima el contenido de la lista original y el contenido de la nueva lista
        ■ modifique algún dato de los estudiantes
        ■ vuelva a imprimir el contenido de la lista original y el contenido de la nueva lista. ¿Qué conclusiones obtiene a partir de lo realizado?
        ■ ¿Cuántas formas de copiar una lista existen? ¿Qué diferencias existen entre ellas?
    
    e. A la lista del punto 7d, agregue un nuevo estudiante. Antes de agregar, verifique que el estudiante no estaba incluido en la lista.
    
    f. Escriba un método que devuelva verdadero o falso si la secuencia almacenada en la lista es o no capicúa: public boolean esCapicua(ArrayList<Integer> lista)
        Ejemplo:
            ● El método devuelve verdadero si la secuencia ingresada es: 2 5 2
            ● El método devuelve falso si la secuencia ingresada es: 4 5 6 3 4
