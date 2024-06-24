import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int actA, actB, actC;
        String actRelleno, actColorLinea;
        
        Triangulo objTriangulo;
        
        // Lectura por teclado
        System.out.println("Ingrese un lado A:");
        actA = in.nextInt();
        System.out.println("Ingrese un lado B:");
        actB = in.nextInt();
        System.out.println("Ingrese un lado C:");
        actC = in.nextInt();
        System.out.println("Ingrese un Relleno:");
        actRelleno = in.next();
        System.out.println("Ingrese un Color de Linea:");
        actColorLinea = in.next();
        
        objTriangulo = new Triangulo(actA, actB, actC, actRelleno, actColorLinea);
        System.out.println(objTriangulo.toString());
        System.out.println("Area = " + objTriangulo.calcularArea());
        System.out.println("Perimetro = " + objTriangulo.calcularPerimetro());
        in.close();
    }
}