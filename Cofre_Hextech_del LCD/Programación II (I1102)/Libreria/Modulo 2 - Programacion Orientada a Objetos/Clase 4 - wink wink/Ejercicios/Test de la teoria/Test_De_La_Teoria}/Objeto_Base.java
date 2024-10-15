public class Objeto_Base
{
    private int a,b,c;
    private String XD;
    
    // Constructores
    public Objeto_Base (int a, int b, int c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }
    
    public Objeto_Base (int a, int b, int c, String XD) {
        this(a,b,c);
        this.XD = XD;
    }
    
    public Objeto_Base (){
        
    }
    
    public String toString(){
        return a + "," + b + "," + c + "," + XD;
    }
    
}
