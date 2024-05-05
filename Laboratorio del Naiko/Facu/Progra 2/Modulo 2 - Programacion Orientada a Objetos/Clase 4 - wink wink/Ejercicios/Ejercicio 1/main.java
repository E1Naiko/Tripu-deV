import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int actA, actB, actC;
        String actRelleno, actColorLinea;

        Triangulo objTriangulo1, objTriangulo2;

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

        objTriangulo1 = new Triangulo(actA, actB, actC, actRelleno, actColorLinea);

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
        
        objTriangulo2 = new Triangulo();
        objTriangulo2.setA(actA);
        objTriangulo2.setB(actB);
        objTriangulo2.setC(actC);
        objTriangulo2.setRelleno(actRelleno);
        objTriangulo2.setColorLinea(actColorLinea);

        System.out.println(objTriangulo1.toString());
        System.out.println("Area = " + objTriangulo1.calcularArea());
        System.out.println("Perimetro = " + objTriangulo1.calcularPerimetro());
        System.out.println(objTriangulo2.toString());
        System.out.println("Area = " + objTriangulo2.calcularArea());
        System.out.println("Perimetro = " + objTriangulo2.calcularPerimetro());

        in.close();
    }
}