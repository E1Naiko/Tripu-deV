import java.util.Scanner;
public class Clase4 {
public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    int a;
    for (a=1; a<=90; a++) {
        double factorial = 1;
        int i; 
        for (i=1; i<=a; i++) {
            factorial = factorial * i;
        } 
        System.out.println(" El Factorial del numero: " + a + " es: " + factorial);
}
    in.close();
}
}