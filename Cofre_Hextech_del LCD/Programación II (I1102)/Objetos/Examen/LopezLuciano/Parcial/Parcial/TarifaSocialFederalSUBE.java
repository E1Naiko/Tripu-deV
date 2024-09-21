import java.util.HashMap; 
import java.util.Map;
/**
 * Write a description of class TarifaSocialFederalSUBE here.
 * 
 * @author (Leandro Romanut) 
 * @version (1.0)
 */
public class TarifaSocialFederalSUBE
{
     
    public TarifaSocialFederalSUBE()
    {

    }

    /**
     * Método para saber si una persona es beneficiaria o no de la tarifa social según zona y grupo social
     * 
     * @params zona y grupo
     * @return boolean
     */
    public static boolean esBeneficiario(String zona, int grupo)
    {
        
        Map<String, boolean[]> map = new HashMap<String, boolean[]>();

        boolean zonaA[] = {false,false,true,false,false};
        boolean zonaB[] = {false,true,true,false,false};
        boolean zonaC[] = {true,true,true,false,false};
        boolean zonaD[] = {true,true,true,true,false};
        boolean zonaE[] = {true,true,true,true,true};
        
        map.put("A", zonaA);
        map.put("B", zonaB);
        map.put("C", zonaC);
        map.put("D", zonaD);
        map.put("E", zonaE);

        
        return map.get(zona)[grupo-1];
    }
}
