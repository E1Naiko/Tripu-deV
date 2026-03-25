import java.util.ArrayList;
import java.util.List;

public class EjercicioSucesion {
    public List<Integer> calcularSucesion(int n){
        List<Integer> lista = new ArrayList<Integer>();
        
        lista.add(Integer.valueOf(n));
        trenmasjuan(n, lista);
        
        return lista;
    }
    
    private void trenmasjuan(int n, List<Integer> lista){
        if (n == 1) return;
        else{
            String op;
            int aux;
            if (esPar(n)){
                aux = n/2;
                op = " N/2";
            }
            else {
                aux = 3*n+1;
                op = " 3N+1";
            }
            lista.add(Integer.valueOf(aux));
            System.out.println(n + op + ": " +aux);
            trenmasjuan(aux, lista);
        }
    }
    
    private boolean esPar(int num){
        if (num % 2 == 0) return true;
        else return false;
    }
    
}
