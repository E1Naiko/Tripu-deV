import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        Micro bus = new Micro("ABC123","Mar de Plata","05:00am");
          System.out.println("Escribir numero de asiento");
          int numasiento= in.nextInt();
          while (numasiento != -1) {
              bus.validarasiento(numasiento);
              if(bus.ocuparasiento(numasiento)) { 
                  System.out.println("Operación Exitosa");
              } else {
                  int asie= bus.devolverasiento();
                  System.out.println("El asiento esta ocupado y el asiento N° " + asie );
                  
              }
              System.out.println("Otro asiento");
              numasiento= in.nextInt();
          }
        in.close();
    }
}