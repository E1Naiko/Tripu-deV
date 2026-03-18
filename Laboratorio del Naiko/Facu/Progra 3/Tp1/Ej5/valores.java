public class valores {
    private integer maximo;
    private integer minimo;
    private integer promedio;
    
    public integer getMaximo() {
        return maximo;
    }
    
    
    public void setMaximo(integer maximo) {
        this.maximo = maximo;
    }
    
    
    public integer getMinimo() {
        return minimo;
    }
    
    
    public void setMinimo(integer minimo) {
        this.minimo = minimo;
    }
    
    
    public integer getPromedio() {
        return promedio;
    }
    
    
    public void setPromedio(integer promedio) {
        this.promedio = promedio;
    }
    

    @Override
    public String toString() {
        return "valores [maximo=" + maximo + ", minimo=" + minimo + ", promedio=" + promedio + "]";
    }
}
