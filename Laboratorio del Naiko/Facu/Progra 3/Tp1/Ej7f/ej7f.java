import java.util.ArrayList;

public class ej7f {
    public static void main(String[] args) {
        int [] numeros = {1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4,3,2,1};
        ArrayList<Integer> lista = new ArrayList<Integer>();
        Capicua capi = new Capicua();

        for (int num : numeros){
            lista.add(Integer.valueOf(num));
        }
        System.out.println(lista);

        if (capi.esCapicua(lista))
            System.out.println("Es Capicua");
        else
            System.err.println("NO es Capicua");

    }
}
