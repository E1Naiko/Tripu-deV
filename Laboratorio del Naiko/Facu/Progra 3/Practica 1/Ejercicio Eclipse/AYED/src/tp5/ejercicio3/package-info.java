package tp5.ejercicio3;

/*
 * 	1. devolverCamino (String ciudad1, String ciudad2): List<String>
 * Retorna la lista de ciudades que se deben atravesar para ir de ciudad1 a ciudad2 en caso
 * de que se pueda llegar, si no retorna la lista vacía. (Sin tener en cuenta el combustible).
 * 
 * 	2. devolverCaminoExceptuando (String ciudad1, String ciudad2, List<String>
 * ciudades): List<String>
 * Retorna la lista de ciudades que forman un camino desde ciudad1 a ciudad2, sin pasar por
 * las ciudades que están contenidas en la lista ciudades pasada por parámetro, si no existe
 * camino retorna la lista vacía. (Sin tener en cuenta el combustible).
 * 
 * 	3. caminoMasCorto(String ciudad1, String ciudad2): List<String>
 * Retorna la lista de ciudades que forman el camino más corto para llegar de ciudad1 a
 * ciudad2, si no existe camino retorna la lista vacía. (Las rutas poseen la distancia).
 * 
 * 	4. caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto):
 * List<String>
 * Retorna la lista de ciudades que forman un camino para llegar de ciudad1 a ciudad2. El
 * auto no debe quedarse sin combustible y no puede cargar. Si no existe camino retorna la
 * lista vacía.
 * 
 * 	5. caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2, int
 * tanqueAuto): List<String>
 * Retorna la lista de ciudades que forman un camino
 * para llegar de ciudad1 a ciudad2 teniendo en cuenta que el auto debe cargar
 * la menor cantidad de veces. El auto no se debe quedar sin combustible en
 * medio de una ruta, además puede completar su tanque al llegar a cualquier
 * ciudad. Si no existe camino retorna la lista vacía.
 */