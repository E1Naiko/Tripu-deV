import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        System.out.print("Lado 1: ");
            double Lado1 = in.nextDouble();
        System.out.print("Lado 2: ");
            double Lado2 = in.nextDouble();
        System.out.print("Lado 3: ");
            double Lado3 = in.nextDouble();
        System.out.print("Color Relleno: ");
            String Relleno = in.next();
        System.out.print("Color Linea: ");
            String Linea = in.next();
            
        Triangulo Triangulo1 = new Triangulo(Lado1,Lado2,Lado3,Relleno,Linea);
        
        System.out.print(Triangulo1.toString());
        
        in.close();
        }
        
}
