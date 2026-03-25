import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class p32026tp1ej7amain {
    static Scanner in = new Scanner(System.in);
    
    public static void main(String[] args) {
        List lista1 = new ArrayList<Estudiante>();
        List lista2 = new ArrayList<Estudiante>();
        
        for (int i=0; i<3; i++){
            lista1.add(innitEstudiante());
        }
        
        for (Lista aux : lista1) {
            lista2.add(aux);
        }
        
        System.out.println(lista1);
        System.out.println(lista2);
        
        int index;
        do {
            index = in.nextInt();
            System.out.println("Que dato desea eliminar:");
            for (int i=0; i<3; i++){
                System.out.println(" - " + i + ": " + lista1.get(i));
            }
        } while (index<0 && index >3);
        
        lista1.remove(index);
        lista1.add(index, innitEstudiante());
        
        System.out.println(lista1);
        System.out.println(lista2);
        
        agregarNuevo(lista1);
        
        System.out.println(lista1);
        System.out.println(lista2);
        
        close(in);
        
    }
    
    private static Estudiante innitEstudiante(){
        
        System.out.println("Estudiante:");
        System.out.println(" - nombre:");
        String nom = in.next();
        System.out.println(" - apellido:");
        String ape = in.next();
        System.out.println(" - comision");
        String com = in.next();
        System.out.println(" - mail");
        String mail = in.next();
        System.out.println(" - direccion");
        String dir = in.next();
        
        Estudiante act = new Estudiante(nom, ape, com, mail, dir);
        return act;
    }
    
    private static void agregarNuevo(Lista<Estudiante> lista){
        Estudiante nue = innitEstudiante();
        for (Estudiante estu : lista) {
            if (estu.equals(nue)){
                System.err.println("Duplicado encontrado, abortando.");
                break;
            }
            System.out.println("Elemento no duplicado, agregando.");
            lista.add(nue);
        }
    }

}