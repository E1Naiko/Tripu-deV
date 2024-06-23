import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        Objeto obj;
        String nomObj, nomAtributo, tipoAtributo;
        int i, cantAtributos;

        // --------------------------------- def del obj ---------------------------------
        System.out.println("Ingrese el nombre del objeto:");
        nomObj = in.next();
        System.out.println("Ingrese la cantidad de atributos que posee " + nomObj +":");
        cantAtributos = in.nextInt();
        obj = new Objeto(cantAtributos);
        
        // --------------------------------- Lectura de datos ---------------------------------
        for (i=0;i<cantAtributos;i++){
            System.out.println("Ingrese el nombre del atributo " + i + "/" + cantAtributos + ":");
            nomAtributo = in.next();
            System.out.println(" - Ingrese el tipo de atributo:");
            tipoAtributo = in.next();

            obj.agregarAtributo(nomAtributo, tipoAtributo);
        }

        System.out.println();
        System.out.println("------------------------------------------------------------");
        System.out.println();
        
        // --------------------------------- Plantilla ---------------------------------
        
        System.out.println("public class " + nomObj + "{");
        for (i=0;i<cantAtributos;i++){
            System.out.println(obj.devolverDeclaraciones(i));
        }
        System.out.println();
        
        // Constructor Basico
        System.out.println("public " + nomObj + " (" + obj.devolverParametrosConstructor() + "){");
        for (i=0;i<cantAtributos;i++){
            System.out.println("this.set" + obj.getNomAtributo(i).substring(0, 1).toUpperCase() + "(" + obj.getNomAtributo(i) + ");");
        }
        System.out.println("}");
        System.out.println();
        
        // Constructor Vacio
        System.out.println("public " + nomObj + " (){}");
        System.out.println();
        
        // getters
        for (i=0;i<cantAtributos;i++){
            System.out.println(obj.devolverDecGetter(i));
            System.out.println("return " + obj.getNomAtributo(i) + ";");
            System.out.println("}");
        }
        System.out.println();
        
        // setters
        for (i=0;i<cantAtributos;i++){
            System.out.println(obj.devolverDecSetter(i));
            System.out.println("this." + obj.getNomAtributo(i) + " = " + obj.getNomAtributo(i) + ";");
            System.out.println("}");
        }
        System.out.println();
        
        System.out.println("}");

        in.close();
    }
}