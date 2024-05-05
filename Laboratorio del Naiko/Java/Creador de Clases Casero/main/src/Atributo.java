public class Atributo
{
    private String nomAtributo;
    private String tipoAtributo;
    
    // Constructor
    public Atributo(String nomAtributo, String tipoAtributo){
        this.setNomAtributo(nomAtributo);
        this.setTipoAtributo(tipoAtributo);
    }
    
    public String getNomAtributo(){
        return nomAtributo;
    }
    
    public String getTipoAtributo(){
        return tipoAtributo;
    }
    
    public void setNomAtributo(String nomAtributo){
        this.nomAtributo = nomAtributo;
    }
    
    public void setTipoAtributo(String tipoAtributo){
        this.tipoAtributo = tipoAtributo;
    }
    
    public String devolverDefGetter(){
        return "public " + tipoAtributo + " get"+ nomAtributo.substring(0, 1).toUpperCase()+"(){";
    }
    
    public String devolverDefSetter(){
        return "public void set" + nomAtributo.substring(0, 1).toUpperCase() + "(" + tipoAtributo + " " + nomAtributo + "){";
    }
    
    public String devolverConstructor(){
        return tipoAtributo + " " + nomAtributo;
    }
    
    public String devolverDefToString(){
        return ", " + nomAtributo + ": + ";
    }
    
}
