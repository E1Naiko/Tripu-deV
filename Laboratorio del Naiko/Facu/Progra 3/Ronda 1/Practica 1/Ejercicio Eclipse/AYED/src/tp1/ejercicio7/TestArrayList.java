package tp1.ejercicio7;

import java.util.*;


import tp1.ejercicio3.ObjEstudiante;

public class TestArrayList {
	private static int CANTIDAD = 5;
	private static int CANTIDAD_ESTUDIANTES = 3;
	
	public static void manejoEstudiantes() {
		System.out.println("Carga de listas y copia:");
		LinkedList<ObjEstudiante> listaEstudiantes1 = new LinkedList<ObjEstudiante>();
		LinkedList<ObjEstudiante> listaEstudiantes2 = new LinkedList<ObjEstudiante>();
		
		char aux = 'a';
		for (int i = 0; i<CANTIDAD_ESTUDIANTES; i++) {
			listaEstudiantes1.add(
					new ObjEstudiante(String.valueOf(aux), String.valueOf(aux), i,
							String.valueOf(aux), String.valueOf(aux))
					);
			aux+=1;
		}
		listaEstudiantes2.addAll(listaEstudiantes1);
		System.out.println("Lista 1:" + listaEstudiantes1);
		System.out.println("Lista 2:" + listaEstudiantes2);
		
		System.out.println("Modifico Elemento:");
		//PREGUNTAR
		ObjEstudiante busqueda = new ObjEstudiante("b", "b", 1, "b", "b");
		ObjEstudiante nue = new ObjEstudiante("d", "d", 4, "d", "d");
		boolean encontre = false;
		int index = 0;
		for (ObjEstudiante estudiante : listaEstudiantes2) {
			if (estudiante.toString().equals(busqueda.toString())) {
				index = listaEstudiantes2.indexOf(estudiante);
				encontre = true;
				break;
			}
		}
		
		if (encontre){
			listaEstudiantes2.remove(index);
			listaEstudiantes2.add(index, nue);
		}
		System.out.println("Lista 1:" + listaEstudiantes1);
		System.out.println("Lista 2:" + listaEstudiantes2);
		
		System.out.println("Agrego elemento:");
		ObjEstudiante nue2 = new ObjEstudiante("Y", "Y", 15, "Y", "Y");
		boolean encontre2 = false;
		int index2 = 0;
		for (ObjEstudiante estudiante : listaEstudiantes1) {
			if (estudiante.toString().equals(nue2.toString())) {
				index2 = listaEstudiantes1.indexOf(estudiante);
				encontre2 = true;
				break;
			}
		}
		
		if (!encontre2){
			listaEstudiantes1.add(index2, nue2);
		}
		
		System.out.println("Lista 1:" + listaEstudiantes1);
		System.out.println("Lista 2:" + listaEstudiantes2);
		
		// INCISO E
		ObjEstudiante nue3 = new ObjEstudiante("Juan", "Juanes", 5, "sis@siss.com", "Mi Casa");
		listaEstudiantes1.add(nue3);
		
		System.out.println("Lista 1:" + listaEstudiantes1);
		System.out.println("Lista 2:" + listaEstudiantes2);
	}



	public static boolean esCapicua(ArrayList<Integer> lista) {
		/*f. Escriba un método que devuelva verdadero o falso si la secuencia almacenada en la
		 * lista es o no capicúa:
		 * 		public boolean esCapicua(ArrayList<Integer> lista)
		 * Ejemplo:
		 * ● El método devuelve verdadero si la secuencia ingresada es: 2 5 2
		 * ● El método devuelve falso si la secuencia ingresada es: 4 5 6 3 4
		 * 
		*/
		boolean resultado = true;
		int total = lista.size();
		int mitad = total/2;
		for (int i=0; i<mitad; i++) {
			if (!(lista.get(i).equals(lista.get(total-i-1))))
				resultado = false;
		}
		return resultado;
	}
	
	
	// 1er intento
	public static void invertirOrden(ArrayList<Integer> lista, int act) {
		if ((lista.size()-act)/2 >1) {
			lista.add(act, lista.get(lista.size()-act));	//  {1, 2, ..., n-1, n}
			lista.add(lista.size()-act,lista.get(act+1));	//  {n, 1, 2, ..., n-1, n, 1}
			lista.remove(act+1);							//  {n, 2, ..., n-1, n, 1}
			lista.remove(lista.size()-act+1);				//  {n, 2, ..., n-1, n}
			invertirOrden(lista, act-1);
			
		}
	}
	
	
	// luchito's intento
	public static void invertirArrayList(ArrayList<Integer> Lista) {
        //int Aux = ListaN.size();
        if (Lista.size()<=1) {
            return;
        }
        //Integer ultimo = Lista.remove(Lista.size()-1);
        Integer ult =Lista.getLast();
        //System.out.println("<--- test ---->");
        //System.out.println(ultimo);
        System.out.println("ult:");
        System.out.println(ult);
        Lista.remove(Lista.size()-1);
        invertirArrayList(Lista);
        Lista.add(0,ult);
    }
	
	
	
	public int sumarLinkedList(LinkedList<Integer> lista) {
		
		return 0;
	}
	
	
	
	public static void main(String[] args) {
		// Inciso A:
		ArrayList<Integer> ListaArreglada = new ArrayList<Integer>();
		for (int i = 0; i < CANTIDAD; i++) {
			ListaArreglada.add(i);
		}
		
		System.out.println("Array List:");
		for (Integer i : ListaArreglada) {
			System.out.println(" - " + ListaArreglada.get(i));
		}
		
		// Inciso B: RTA por lo visto ninguna pero se que algo me saltee 
		LinkedList<Integer> ListaLinkeada = new LinkedList<Integer>();
		for (int i = 0; i < CANTIDAD; i++) {
			ListaLinkeada.add(i);
		}
		
		System.out.println("Linked List:");
		for (Integer i : ListaLinkeada) {
			Object enteroAct = ListaLinkeada.get(i);
			System.out.println(" - " + enteroAct);
		}
		
		// Inciso C:
		Iterator<Integer> it = ListaArreglada.iterator();
		System.out.println("Iterador:");
		while (it.hasNext()) {
			System.out.println(" - " + it.next().intValue());
		}
		
		// Inciso D:
		manejoEstudiantes();
		
		// Inciso F:
		ArrayList<Integer> listaCapicua = new ArrayList<Integer>();
		listaCapicua.add(1);
		listaCapicua.add(2);
		listaCapicua.add(3);
		listaCapicua.add(3);
		listaCapicua.add(1);
		if (esCapicua(listaCapicua)) {
			System.out.println(listaCapicua + " es capicua.");
		}
		else {
			System.out.println(listaCapicua + " NO es capicua.");
		}

		// Inciso H:
		ArrayList<Integer> listaInvertible = new ArrayList<Integer>();
		listaInvertible.add(1);
		listaInvertible.add(2);
		listaInvertible.add(3);
		listaInvertible.add(4);
		listaInvertible.add(5);
		System.out.println("Inciso H");
		System.out.println(listaInvertible);
		invertirOrden(listaInvertible, (listaInvertible.size()/2));
		System.out.println(listaInvertible);
		invertirArrayList(listaInvertible);
		System.out.println(listaInvertible);
	}
}
