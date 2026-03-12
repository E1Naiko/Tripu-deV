package tp1.ejercicio7;

import java.util.*;
import java.util.Scanner;

/*
* g. Considere que se aplica la siguiente función de forma recursiva. A partir de un número
* n positivo se obtiene una sucesión que termina en 1:
* 
* 	F(x) = {n/2; si n es par; 3n+1; si n es impar}
* 
* Por ejemplo, para n= 6, se obtiene la siguiente sucesión:
* f(6) = 6/2 = 3
* f(3) = 3*3 + 1 = 10
* f(10) = 10/2 = 5
* ….
* Es decir, la sucesión 6, 3, 10, 5, 16, 8, 4, 2, 1. Para cualquier n con el que se arranque
* siempre se llegará al 1.
* ■ Escriba un programa recursivo que, a partir de un número n, devuelva una lista
* con cada miembro de la sucesión.
* 
* public class EjercicioSucesion {
* 	public List<Integer> calcularSucesion (int n) {
* 		//código
* 	}
* }
*/

public class EjercicioSucesion {
	public static LinkedList<Integer> calcularSucesion (int n) {
		LinkedList<Integer> lista = new LinkedList<Integer>();
		lista.add(n);
		if (n>1) {
			if (n%2 == 0) {
				lista.addAll(calcularSucesion(n/2));
			}
			else
				lista.addAll(calcularSucesion(3*n+1));
		}
		return lista;
	}
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		
		LinkedList<Integer> listaSucesion = calcularSucesion(in.nextInt());
		System.out.println(listaSucesion);
		in.close();
	}
}