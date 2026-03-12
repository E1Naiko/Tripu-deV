package tp1.ejercicio3;

import java.util.Scanner;

/*
	d. Escriba una clase llamada Test con el método main, el cual cree un arreglo con 2
	objetos Estudiante, otro arreglo con 3 objetos Profesor, y luego recorra ambos
	arreglos imprimiendo los valores obtenidos mediante el método tusDatos(). Recuerde
	asignar los valores de los atributos de los objetos Estudiante y Profesor invocando los
	respectivos métodos setters.
*/

public class Test {
	private static int CAP_ESTU = 2;
	private static int CAP_PROFE = 3;
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		ObjEstudiante [] estus = new ObjEstudiante[CAP_ESTU];
		ObjProfesor [] profes = new ObjProfesor[CAP_PROFE];
		String nombre;
		String apellido;
		int comision;
		String email;
		String direccion;
		String catedra;
		String facultad;
		
		char aux; // DEBUG
		
		aux = 'a';
		for (int i = 0; i<CAP_ESTU; i++) {
			System.out.println("Ingrese nombre: ");
			nombre = /*input.next();*/ String.valueOf(aux);
			System.out.println(" - Ingrese apellido: ");
			apellido = /*input.next();*/ String.valueOf(aux);
			System.out.println(" - Ingrese comision: ");
			comision = /*input.nextInt();*/ i;
			System.out.println(" - Ingrese email: ");
			email = /*input.next();*/ String.valueOf(aux);
			System.out.println(" - Ingrese direccion: ");
			direccion = /*input.next();*/ String.valueOf(aux);
			 
			estus[i] = new ObjEstudiante(nombre, apellido, comision, email, direccion);
			aux+=1;
		}
		
		for (int i = 0; i<CAP_PROFE; i++) {
			System.out.println("Ingrese nombre: ");
			nombre = /*input.next();*/ String.valueOf(aux);
			System.out.println(" - Ingrese apellido: ");
			apellido = /*input.next();*/ String.valueOf(aux);
			System.out.println(" - Ingrese email: ");
			email = /*input.next();*/ String.valueOf(aux);
			System.out.println(" - Ingrese catedra: ");
			catedra = /*input.next();*/ String.valueOf(aux);
			System.out.println(" - Ingrese facultad: ");
			facultad = /*input.next();*/ String.valueOf(aux);
			
			profes[i] = new ObjProfesor(nombre, apellido, email, catedra, facultad);
			aux += 1;
		}
		
		System.out.println("Imprimiendo Estudiantes:");
		for (int i = 0; i<CAP_ESTU; i++)
			System.out.println(estus[i].tusDatos());
		
		System.out.println("Imprimiendo Profesores:");
		for (int i = 0; i<CAP_PROFE; i++)
			System.out.println(profes[i].tusDatos());
		
		input.close();
	}
}
