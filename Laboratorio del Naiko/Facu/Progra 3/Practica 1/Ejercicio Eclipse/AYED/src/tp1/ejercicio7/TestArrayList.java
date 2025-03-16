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
	}
}
