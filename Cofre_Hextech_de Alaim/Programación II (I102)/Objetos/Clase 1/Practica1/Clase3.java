import java.util.Scanner;
public class Clase3 {
public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    System.out.println(" Numero : ");
    int num =in.nextInt();
    int factorial = 1;
    if ( num > 0) {
        int i; 
        for (i=1; i<=num; i++) {
            factorial = factorial * i;
        }  
}
    System.out.println(" El Factorial del numero: " +factorial);
    in.close();
}
}
