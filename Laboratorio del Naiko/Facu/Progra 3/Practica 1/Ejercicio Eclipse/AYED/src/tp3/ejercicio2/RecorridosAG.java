package tp3.ejercicio2;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import tp3.ejercicio1.GeneralTree;


public class RecorridosAG {
	private boolean esImpar(Integer i) {
		return (i%2) != 0;
	}

	private List<Integer> preOrden(GeneralTree<Integer> a, Integer n) {
		List<Integer> lista = new LinkedList<Integer>();
		if (a != null) {
			if (a.getData() > n && esImpar(a.getData())) {
				lista.add(a.getData());
			}
			List<GeneralTree<Integer>> children = a.getChildren();
			for (GeneralTree<Integer> child: children) {
				lista.addAll(preOrden(child, n));
			}

		}
		return lista;
	}

	public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree<Integer> a, Integer n){
		/* 	  Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n” *
		 * pasados como parámetros, recorrido en preorden. *
		 */
		List<Integer> lista = new LinkedList<Integer>();
		if (a != null) {
			lista.addAll(preOrden(a,n));
		}
		return lista;
	}

	private List<Integer> inOrden(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new LinkedList<Integer>();
		if (a != null) {
			List<GeneralTree<Integer>> children = a.getChildren();
			if (a.hasChildren()) {
				Iterator<GeneralTree<Integer>> it = children.iterator();
				GeneralTree<Integer> child = it.next();
				lista.addAll(inOrden(child, n));
			}
			
			if (a.getData() > n && esImpar(a.getData())) {
				lista.add(a.getData());
			}
			
			if (!children.isEmpty()) {
	            Iterator<GeneralTree<Integer>> it = children.iterator();
	            it.next();
	            while (it.hasNext()) {
	                GeneralTree<Integer> child = it.next();
	                lista.addAll(inOrden(child, n));
	            }
	        }
		}
		return lista;
	}

	/*
	private List<Integer> inOrden(GeneralTree<Integer> a, Integer n) {
	    List<Integer> lista = new LinkedList<>();
	    if (a != null) {
	        List<GeneralTree<Integer>> children = a.getChildren();
	        
	        // Process first child (if exists)
	        if (!children.isEmpty()) {
	            Iterator<GeneralTree<Integer>> it = children.iterator();
	            GeneralTree<Integer> firstChild = it.next();
	            lista.addAll(inOrden(firstChild, n));
	        }
	        
	        // Process current node HERE (after first child, before others)
	        if (a.getData() > n && esImpar(a.getData())) {
	            lista.add(a.getData());
	        }
	        
	        // Process remaining children (if any)
	        if (!children.isEmpty()) {
	            Iterator<GeneralTree<Integer>> it = children.iterator();
	            it.next(); // Skip the first child
	            while (it.hasNext()) {
	                GeneralTree<Integer> child = it.next();
	                lista.addAll(inOrden(child, n));
	            }
	        }
	    }
	    return lista;
	} */
	
	public List<Integer> numerosImparesMayoresQueInOrden(GeneralTree <Integer> a, Integer n){
		/* 	  Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
		 * pasados como parámetros, recorrido en inorden.
		 */
		List<Integer> lista = new LinkedList<Integer>();
		if (a != null) {
			lista.addAll(inOrden(a,n));
		}
		return lista;
	}
}
