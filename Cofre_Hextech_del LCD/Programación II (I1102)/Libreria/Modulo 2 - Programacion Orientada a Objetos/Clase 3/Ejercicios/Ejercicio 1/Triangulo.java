
/**
 * Write a description of class Triangulo here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Triangulo
{
    private int a,b,c;
    private String relleno, colorLinea;
    
    // Constructor
    public Triangulo (){
        
    }
    
    public Triangulo (int unA, int unB, int unC, String unRelleno, String unColorLinea) {
        a = unA;
        b = unB;
        c = unC;
        relleno = unRelleno;
        colorLinea = unColorLinea;
    }
    
    public int getA(){
        return a;
    }
    
    public int getB(){
        return b;
    }
    
    public int getC(){
        return c;
    }
    
    public String getRelleno(){
        return relleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    public void setA(int a){
        a = this.a;
    }
    
    public void setB(int b){
        b = this.b;
    }
    
    public void setC(int c){
        c = this.c;
    }
    
    public void setRelleno(String relleno){
        relleno = this.relleno;
    }
    
    public void setColorLinea(String colorLinea){
        colorLinea = this.colorLinea;
    }
    
    public double calcularArea(){
        double res, s;
        res = 0;
        s = (double) (a+b+c) / 2;
        if (s>0) {
            res = Math.sqrt((s*(s-a)*(s-b)*(s-c)));
        }
        return res;
    }
    
    public int calcularPerimetro(){
        return (a+b+c);
    }
    
    public String toString(){
        return "[A,B,C]=[" + a + "," + b + "," + c + "," + 
            "], Relleno: " + relleno + ", Color de Linea: " +
            colorLinea + ".";
    }
    
}
