public class Objeto{
    private Atributo [] atrib;
    private int dimL;
    
    // Constructor
    public Objeto(int cantAtributos){
        atrib = new Atributo[cantAtributos];
        dimL = 0;
    }
    
    public void agregarAtributo(String nomAtributo, String tipoAtributo){
        atrib[dimL] = new Atributo(nomAtributo, tipoAtributo);
        dimL++;
    }
    
    public String getNomAtributo(int i){
        return atrib[i].getNomAtributo();
    }
    
    public String getTipoAtributo(int i){
        return atrib[i].getTipoAtributo();
    }
    
    public String devolverDeclaraciones(int i){
        return "private " + atrib[i].getTipoAtributo() + " " + atrib[i].getNomAtributo() + ";";
    }
    
    public String devolverDecGetter(int i){
        return atrib[i].devolverDefGetter();
    }
    
    public String devolverDecSetter(int i){
        return atrib[i].devolverDefSetter();
    }
    
    public String devolverParametrosConstructor(){
        String aux = "";
        if (dimL>0){
            aux = this.getTipoAtributo(0) + " " + this.getNomAtributo(0);
            for (int i=1; i<dimL; i++){
                aux +=", " + this.getTipoAtributo(i) + " " + this.getNomAtributo(i);
            }
        }
        return aux;
    }
    
}
