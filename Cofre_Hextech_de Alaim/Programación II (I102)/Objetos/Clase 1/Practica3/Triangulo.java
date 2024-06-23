/** Definir una clase para representar triángulos. Un triángulo se caracteriza por el tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
El triángulo debe saber: 
    Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#) 
    Calcular el área y devolverla (método calcularArea)
    Calcular el perímetro y devolverlo (método calcularPerimetro)
 * 
 */
public class Triangulo{
    private double Lado1,Lado2,Lado3;
    private String Relleno;
    private String Linea;
    
    public Triangulo ( double unLado1, double unLado2, double unLado3, String unRelleno, String unLinea){
        Lado1= unLado1;
        Lado2= unLado2;
        Lado3= unLado3;
        Relleno= unRelleno;
        Linea= unLinea;
    }
    
    public Triangulo(){
        
    }
    
    public double GetLado1(){
        return Lado1;  
    }
    public double GetLado2(){
        return Lado2;
    }
    public double GetLado3(){
        return Lado3;
    }
    public String GetRelleno(){
        return Relleno;
    }
    public String GetLinea(){
        return Linea;
    }
    public void setLado1(double unLado1) {
        Lado1 = unLado1;
    }
    public void setLado2(double unLado2) {
        Lado2 = unLado2;
    }
    public void setLado3(double unLado3) {
        Lado3 = unLado3;
    }
    public void setRelleno(String unRelleno) {
        Relleno = unRelleno;
    }
    public void setLinea(String unLinea) {
        Linea = unLinea;
    }
    
    public  double Calcularperimetro() {
        double Perimetro;
        Perimetro = (Lado1 + Lado2 + Lado3)/2;
        return Perimetro;
    }
    public  double Calculararea () {
        double Area;
        double Perimetro = Calcularperimetro();
        Area = Math.sqrt(Perimetro*(Perimetro - Lado1)*(Perimetro - Lado2)*(Perimetro - Lado3));
        return Area;
    } 
    
    public String toString() {
        String aux;
        aux= "El triangulo de lados: " + Lado1 + ", " + Lado2 + ", " + Lado3 + "con color" + Relleno + "y con bordes de color" + Linea ;
        return aux;
    }
    
}


        