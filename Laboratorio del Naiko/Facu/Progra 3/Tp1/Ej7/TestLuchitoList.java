import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class TestLuchitoList {
    public static void main(String[] args) {
        List<Integer> lista = new LinkedList<Integer>();

        for (String cad : args) {
            try {
                int aux = Integer.parseInt(cad);
                lista.add(aux);
            } catch (NumberFormatException e) {
                System.err.println("Ignorando valor no numérico: " + cad);
            }
        }

        System.out.println(lista);
        for (int i : lista){
            System.out.println(" - " + i);
        }

         //luchito-code uwu
        ArrayList<Integer> luchito = new ArrayList<Integer>();
        for(int i=0; i<5; i++){
            luchito.add(i);
        }
        System.out.println(luchito);
        invertirArrayList(luchito);
    }


    //h. Implemente un método recursivo que invierta el orden de los elementos en un ArrayList.
    //public void invertirArrayList(ArrayList<Integer> lista) 

    public static void invertirArrayList(ArrayList<Integer> lista){
        invertir(lista,0,lista.size()-1);
    }

    private static void invertir(ArrayList<Integer> lista, int ini, int fin){
        if(ini>=fin){
            System.out.println(lista);
        }
        lista.set(ini, lista.getLast());
        invertir(lista,ini++,fin--);
    }
    //Comentario final. Luchito estuvo y arruino el testLinkedList.java
    */
}