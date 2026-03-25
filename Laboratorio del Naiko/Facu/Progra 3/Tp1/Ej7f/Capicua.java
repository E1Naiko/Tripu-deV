import java.util.ArrayList;

public class Capicua {
     
    public boolean esCapicua(ArrayList<Integer> lista){
        boolean res = true;
        int i = 0;
        int j = lista.size() - 1;

        res = elMasCapicua(lista, i, j);

        return res;
    }

    private boolean elMasCapicua(ArrayList<Integer> lista, int i, int j){
        if (i>=j) return true;
        System.out.println("Iter " + i + ": " + lista.get(i) + " AND "+ lista.get(j) + " = " + lista.get(i).equals(lista.get(j)));
        if (lista.get(i) != lista.get(j)){
            return false;
        }
        return elMasCapicua(lista, i+1, j-1);
    }
}
