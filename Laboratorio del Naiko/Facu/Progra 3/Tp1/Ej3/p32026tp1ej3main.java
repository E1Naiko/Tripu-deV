import java.util.Scanner;
public class p32026tp1ej3main {
    public static void main(String[] args) {
        Estudiante [] arregloEstudiantes = new Estudiante[3];
        Profesor [] arregloProfesores = new Profesor[2];

        for (int i=0; i<3; i++){
            arregloEstudiantes[i] = innitEstudiante();
            
        }

        for (int i=0; i<2; i++){
            arregloProfesores[i] = innitProfesor();
            
        }

        for (int i=0; i<3; i++){
            System.out.println(arregloEstudiantes[i].tusDatos());
        }

        for (int i=0; i<2; i++){
            System.out.println(arregloProfesores[i].tusDatos());
        }
    }

    private static Estudiante innitEstudiante(){
        Scanner in = new Scanner(System.in);
        
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
    private static Profesor innitProfesor(){
        Scanner in = new Scanner(System.in);
        
        System.out.println("Profesor");
        System.out.println(" - nombre:");
        String nom = in.next();
        System.out.println(" - apellido:");
        String ape = in.next();
        System.out.println(" - mail:");
        String mail = in.next();
        System.out.println(" - catedra:");
        String cat = in.next();
        System.out.println(" - facultad:");
        String facu = in.next();
        
        Profesor act = new Profesor(nom, ape, mail, cat, facu);
        return act;
    }
}
