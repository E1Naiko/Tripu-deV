import java.util.Scanner;
public class Main
{
     public static void main(String [] args) {
         //Declaracion Vector Personas
        int dimF = 1;  //valor de prueba
        Persona [] VPersona = new Persona[dimF];
        //Inicio del codigo
        Scanner in = new Scanner(System.in);
        for(int i =0; i<dimF; i++){        
            System.out.println("Ingrese nombre ");
            String nom = in.next();
            System.out.println("Ingrese CUIT");
            int CUIT = in.nextInt();
            System.out.println("Ingrese Numero de SUBE");
            int SUBE = in.nextInt();
            System.out.println("Pulse (1) si es Registrada. Pulse (2) si no esta registrada");
            int selec = in.nextInt();
            if(selec == 1){
                System.out.println("Ingrese Zona");
                String zona = in.next();
                System.out.println("Ingrese Grupo");
                int grupo = in.nextInt();
                Regis R = new Regis(nom,CUIT,SUBE,zona,grupo);
                System.out.println("<------Cargar informacion de los ultimos 8 viajes------>");
                for (int j =0; j<8; j++){
                    System.out.println("Ingrese ID");
                    int ID = in.nextInt();
                    System.out.println("Ingrese fecha formato (DD/MM/AAAA)");
                    String fecha = in.next();
                    System.out.println("Ingrese monto base");
                    double monto = in.nextDouble();
                    System.out.println("Ingrese medio de transporte");
                    String medio = in.next();
                    Viaje V = new Viaje(ID,fecha,monto,medio);
                    R.setViaje(j,V);
                }
                VPersona[i] = R;
            }
            if(selec == 2){
                System.out.println("Ingrese si es Estudiante universitario True/False");
                boolean estudiante = in.nextBoolean();
                NoRegis NR = new NoRegis(nom,CUIT,SUBE,estudiante);
                System.out.println("<------Cargar informacion de los ultimos 8 viajes------>");
                for (int j =0; j<8; j++){
                    System.out.println("Ingrese ID");
                    int ID = in.nextInt();
                    System.out.println("Ingrese fecha formato (DD/MM/AAAA)");
                    String fecha = in.next();
                    System.out.println("Ingrese monto base");
                    double monto = in.nextDouble();
                    System.out.println("Ingrese medio de transporte");
                    String medio = in.next();
                    Viaje V = new Viaje(ID,fecha,monto,medio);
                    NR.setViaje(j,V);
                }
                VPersona[i] = NR;
            }
        }
    	in.close();
    	
    	for (int i = 0; i<dimF; i++){
        	System.out.println(VPersona[i].toString());
        	System.out.println("<--- informacion de los viajes--->");
        	for (int j= 0; j<8; j++){
                    VPersona[i].infoViajes(j);
        	   }
        	System.out.println(VPersona[i].calcular());  
    	 }
    }
}