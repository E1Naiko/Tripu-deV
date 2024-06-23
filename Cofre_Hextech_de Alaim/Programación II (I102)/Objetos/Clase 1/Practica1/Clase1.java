import java.util.Scanner;
public class Clase1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println(" A: ");
        double a =in.nextInt();   //2
        System.out.println(" B: ");
        double b =in.nextInt();
        System.out.println(" C: ");
        double c =in.nextInt();
        double resul = a + b + c;
        if ((a < b + c) && (b < a + c) && (c < a + b)) {
            System.out.println(" Es triangulo");
            System.out.println(" Perimetro: " + resul);
        }    

        in.close();
    }
}
