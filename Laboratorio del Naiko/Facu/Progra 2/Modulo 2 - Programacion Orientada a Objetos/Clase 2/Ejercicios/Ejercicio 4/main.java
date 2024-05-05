/* Ejercicio 4:
 * - Se dispone de la clase Partido (descargar de moodle).
 * Un objeto partido representa un encuentro entre dos equipos
 * (local y visitante). Un objeto partido puede crearse sin
 * valores iniciales y agregando luego el nombre del equipo
 * local, el nombre del visitante, la cantidad de goles del
 * local y del visitante (en ese orden). Un objeto partido
 * sabe responder a los siguientes mensajes:

 *   getLocal()    retorna el nombre (String) del equipo local
 *   getVisitante()    retorna el nombre (String) del equipo
 *                     visitante
 *   getGolesLocal()    retorna la cantidad de goles (int) del
 *                      equipo local
 *   getGolesVisitante()    retorna la cantidad de goles
 *                          (int) del equipo visitante
 *   setLocal(X)     modifica el nombre del equipo local al
 *                   “String” pasado por parámetro (X)
 *   setVisitante(X)    modifica el nombre del equipo visitante
 *                      al “String” pasado por parámetro (X)
 *   setGolesLocal(X)    modifica la cantidad de goles del equipo
 *                       local “int” pasado por parámetro (X)
 *   setGolesVisitante(X)    modifica la cantidad de goles
 *                           del equipo visitante “int” pasado
 *                           por parámetro (X)
 *   hayGanador()    retorna un boolean que indica si hubo
 *                   (true) o no hubo (false) ganador
 *   getGanador()    retorna el nombre (String) del ganador
 *                   del partido (si no hubo retorna un String
 *                   vacío). 
 *   hayEmpate()    retorna un boolean que indica si hubo
 *                  (true) o no hubo (false) empate

 * a) Implemente un programa que cargue un vector con los 325
 * partidos disputados en la superliga 2018/2019. 

 * Luego de la carga realizar los métodos que considere
 * necesarios para informar:
 * b) La cantidad de partidos que ganó River.
 * c) El total de goles que realizó Boca jugando de local.
 * d) El porcentaje de partidos finalizados con empate. 

 */
import java.util.Scanner;
import java.util.Random;

public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int DIMF = 325;
        int totalGolesBoca = 0;
        int cantGanadosRiver = 0;
        int cantEmpates = 0;
        String BOCA = "BOCA";
        String RIVER = "RIVER";
        double porcentaje = 0;
        String local, visitante;
        int golesLocal, golesVisitante, i;
        Partido v[] = new Partido[DIMF];
        
        // Codigo ilegal de binga
        Random rand = new Random();
        String[] equipos = {"Boca", "River", "Manchester United" , "Luchito FC", "Indendiente", "Talleres", "Estudiantes de La Plata", "Ginacia", "Chacarita", "Colón"};

        for (i = 0; i < DIMF; i++) {
            // Genero un partido aleatorio
            local = equipos[rand.nextInt(equipos.length)];
            do {
                visitante = equipos[rand.nextInt(equipos.length)];
            } while (local.equals(visitante)); // Aseguramos que el equipo local y visitante no sean el mismo
            golesLocal = rand.nextInt(10); // Suponemos un máximo de 10 goles por equipo
            golesVisitante = rand.nextInt(10);

            // Creo el objeto correspondiente
            v[i] = new Partido(local, visitante, golesLocal, golesVisitante);
            System.out.println(v[i].toString());
        }

        /*
        for (i=0; i<DIMF; i++){
            // Leo un partido
            System.out.println("Equipo local:");
            local = in.next();
            System.out.println("Equipo visitante:");
            visitante = in.next();
            System.out.println("Goles equipo local:");
            golesLocal = in.nextInt();
            System.out.println("Goles equipo visitante:");
            golesVisitante = in.nextInt();
            
            // creo el objeto correspondiente
            v[i] = new Partido(local, visitante, golesLocal, golesVisitante);
        }
        */
        
        String actLocal; String actVisitante;
        for (i= 0; i<DIMF; i++) {
            actLocal = v[i].getLocal().toUpperCase();
            actVisitante = v[i].getVisitante().toUpperCase();
            if (v[i].getLocal().toUpperCase().equals(BOCA)) {
                totalGolesBoca++;
            }
            if (v[i].hayGanador()) {
                if (v[i].getGanador().toUpperCase().equals(RIVER)) {
                    cantGanadosRiver++;
                }
            }
            else {
                cantEmpates++;
            }
        }
        porcentaje = ((double) cantEmpates / DIMF)*100;
        
        System.out.println("Cantidad de partidos ganados por " + RIVER + ": " + cantGanadosRiver);
        System.out.println("Total goles de " + BOCA + ": " + totalGolesBoca);
        System.out.println("Porcentaje de partidos terminados en empate: " + porcentaje + "%");

        in.close();
    }
}