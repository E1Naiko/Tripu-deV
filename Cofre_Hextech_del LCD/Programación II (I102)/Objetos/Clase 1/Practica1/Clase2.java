import java.util.Scanner;
public class Clase2 {
public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    System.out.println(" Patente de auto: ");
    int a =in.nextInt();
    int cant = 0;
    int total = 0;
    while (a != 0) {
        total++;
        int resul = a % 10; 
        if (resul % 2 == 0) {
            cant++;
            System.out.println(" El auto ingresa al centro de la ciudad");
        }
        else{
            System.out.println(" El auto no ingresa al centro de la ciudad");
        } 
        System.out.println(" Patente de auto: ");
        a = in.nextInt();    
}
    double por = (((double)cant/total) * 100);
    System.out.println(" Porcentaje de autos: " + por);
    in.close();
}
}
