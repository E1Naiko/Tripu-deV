import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        int a,b,c;
        //String XD = "JAJAJAJAJA";
        a=1;
        b=2;
        c=3;
        
        Objeto_Base objBase = new Objeto_Base(a,b,c/*,XD*/);
        System.out.println(objBase.toString());
        in.close();
    }
}