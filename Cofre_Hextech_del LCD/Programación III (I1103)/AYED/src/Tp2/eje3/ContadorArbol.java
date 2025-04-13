package Tp2.eje3;

import Tp2.eje3.BinaryTree;
import java.util.LinkedList;

public class ContadorArbol {
	private BinaryTree<Integer> arbol;
	private LinkedList<Integer> lista;
	
	// Constructor del arbol
	public ContadorArbol(BinaryTree<Integer> ab) {
		this.arbol= ab;
	}
	
	public ContadorArbol(LinkedList<Integer> list) {
		this.lista= list;
	}
	
	// Metodo recorrido inOrden
	private void inOrden (BinaryTree<Integer> ab, LinkedList<Integer> lis) {
		if (ab.isEmpty())
			return;
		if (ab.hasLeftChild()) {
			inOrden(ab.getLeftChild(),lis);
		}
		if (!lis.isEmpty()) {
			lis.add(ab.getData());
		}
		if (ab.hasRightChild()) {
			inOrden(ab.getRightChild(),lis);
		}
	}
	
	// Meotod mediante el recoorido preOrden.
	public LinkedList<Integer> numerosParesInOrden() {
		LinkedList <Integer> lista= new LinkedList<Integer>();
		inOrden(this.arbol,this.lista);
		return lista;
	}
	
	// Metodo mediante el recorrido preOrden;
	private void postOrden (BinaryTree<Integer> ab, LinkedList<Integer> lis) {
		if (ab.isEmpty()) {
			return;
		}
		if(ab.hasLeftChild()) {
			postOrden(ab.getLeftChild(),lis);
		}
		if(ab.hasRightChild()) {
			postOrden(ab.getRightChild(),lis);
		}
		if(ab.getData() % 2 == 0) {
			lis.add(ab.getData());
		}
		
	}
	
	// metodo mediante el recorrido postOrden
	public LinkedList<Integer> numerosParesPostOrden(){
		LinkedList <Integer> lista= new LinkedList<Integer>();
		postOrden(this.arbol,this.lista);
		return lista;
	}
}
