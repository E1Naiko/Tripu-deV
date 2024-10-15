
/**
 * Implementar un programa principal que instancie personas con sus viajes donde se evalúen todos los casos.
Después de la carga, hacer la impresión de los datos utilizando lo implementado en el inciso c) e informar para
cada persona, el identificador junto al monto del viaje más costoso y del más económico..
 * 
 * @author (MezaAlam) 
 * @version (6/5/2024)
 */
import java.util.Scanner;
public class ProgPrincipal {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println(" Cant de personas que queres saber su viaje");
        int dimF= in.nextInt();
        Persona [] persona= new Persona [dimF];
        int i;
        for (i=0; i<dimF; i++) {
            System.out.println("--Datos de la Persona" +i+"--");
            System.out.println("Nombre");
            String nombre= in.next();
            System.out.println("Apellido");
            String apellido= in.next();
            System.out.println(" Cuit");
            int cuit= in.nextInt();
            System.out.println(" Numero de la tarjeta");
            int numTarjeta= in.nextInt();
            System.out.println(" Cant de viajes realizados");
            int cantViajes= in.nextInt();
            System.out.println(" Tu sube esta registrado? SI/NO");
            String registro= in.next();
            int v;
            double max=0;
            double min=0;
            int identiMax=0;
            int identiMin=0;
            if (registro.toUpperCase().equals("SI")){
                System.out.println(" Zona de Residencia");
                String zona= in.next();
                System.out.println(" Grupo Social");
                int grupo= in.nextInt();
                Registradas registrada= new Registradas(zona,grupo,nombre,apellido,cuit,numTarjeta,cantViajes);
                System.out.println("--Datos Viajes--");
                for( v=0; v< cantViajes; v++){
                    System.out.println(" Identificador");
                    int identificador= in.nextInt();
                    System.out.println(" Fecha");
                    String fecha= in.next();
                    System.out.println(" Monto base");
                    double monto= in.nextDouble();
                    System.out.println(" Medio de transporte");
                    String medioTransporte= in.next();
                    Viaje viaje= new Viaje (identificador,fecha,monto,medioTransporte);
                    persona[i].Agregar(viaje);
                    if (persona[i].CostoFinal() > max){
                        max= persona[i].CostoFinal();
                        identiMax= viaje.getIdentificador();
                    }
                    if (persona[i].CostoFinal() > min){
                        min= persona[i].CostoFinal();
                        identiMin= viaje.getIdentificador();
                    }    
            }
            System.out.println(persona[i].toString());
            System.out.println("El identificador" +identiMax+ "tiene el mayor costo y es de: "+max+ " pesos");
            System.out.println("El identificador" +identiMin+ "tiene el menor costo y es de: "+min+ " pesos");
        } else {
            System.out.println(" Eres Estudiante? SI/NO");
            String estudiante= in.next();
            boolean esEstudiante= estudiante.toUpperCase().equals("SI");
            NoRegistrada noregistrada= new NoRegistrada(esEstudiante,nombre,apellido,cuit,numTarjeta,cantViajes);
            System.out.println("--Datos Viajes--");
            for( v=0; v< cantViajes; v++){
                System.out.println(" Identificador");
                int identificador= in.nextInt();
                System.out.println(" Fecha");
                String fecha= in.next();
                System.out.println(" Monto base");
                double monto= in.nextDouble();
                System.out.println(" Medio de transporte");
                String medioTransporte= in.next();
                Viaje viaje= new Viaje (identificador,fecha,monto,medioTransporte);
                persona[i].Agregar(viaje);
                if (persona[i].CostoFinal() > max){
                    max= persona[i].CostoFinal();
                    identiMax= viaje.getIdentificador();
                }
                if (persona[i].CostoFinal() > min){
                    min= persona[i].CostoFinal();
                    identiMin= viaje.getIdentificador();
                }  
            }
            System.out.println(persona[i].toString());
            System.out.println("El identificador" +identiMax+ "tiene el mayor costo y es de: "+max+ " pesos");
            System.out.println("El identificador" +identiMin+ "tiene el menor costo y es de: "+min+ " pesos");
            }
        }
        in.close();
    }
}