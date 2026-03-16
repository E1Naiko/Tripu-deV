import java.util.ArrayList;
import java.util.Scanner;

public class p32026tp1ej2main {
    private static ArrayList primerosMultiplos(int a){
        int k = a;
        ArrayList lista = new ArrayList<Integer>();
        for (int i = 0; i<a; i++){
            lista.add(k);
            k+=a;
        }
        return lista;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int a;
        ArrayList LGrandre = new ArrayList<ArrayList<Integer>>();
        do {
            System.out.println("Inserte un n: ");
            a = in.nextInt();
            if (a==0) break;
            else {
                ArrayList list = primerosMultiplos(a);
                LGrandre.add(list);
                System.out.println(list.toString());

            }
        } while (a!=0);
        System.out.println(LGrandre.toString());
        in.close();
    }
}

