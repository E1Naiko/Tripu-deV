import java.util.ArrayList;
import java.util.List;

public class TestArrayList {
    public static void main(String[] args) {
        List<Integer> lista = new ArrayList<Integer>();

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
    }
}