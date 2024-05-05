public class objCompra{
    // Atributos Compra
    private int codigo;
    private int fechaDia;
    private int fechaMes;
    private int fechaAnio;

    // Atributos Cliente
    private int cuit;
    private int nCompras;
    private int dimL;
    private String nombre;
    private String apellido;
    private String metodoPago;
    private boolean esJubiladoPensionado;
    private absProducto [] vecLista;

    public objCompra(int cuit, String nombre, String apellido, String metodoPago,
    boolean esJubiladoPensionado, int nCompras){
        this.nCompras = nCompras;
        dimL = 0;
        this.vecLista = new absProducto[nCompras];

        this.setCuit(cuit);
        this.setNombre(nombre);
        this.setApellido(apellido);
        this.setMetodoPago(metodoPago);
        this.setEsJubiladoPensionado(esJubiladoPensionado);

    }

    public objCompra (int codigo, int fechaDia, int fechaMes, int fechaAnio, int cuit, String nombre,
    String apellido, String metodoPago, boolean esJubiladoPensionado, int nCompras){

        this(cuit, nombre, apellido, metodoPago, esJubiladoPensionado, nCompras);
        this.setCodigo(codigo);
        this.setFechaDia(fechaDia);
        this.setFechaMes(fechaMes);
        this.setFechaAnio(fechaAnio);
    }

    // Constructores
    public objCompra (){}

    // Getters
    public int getCodigo(){
        return codigo;
    }

    public int getFechaDia(){
        return fechaDia;
    }

    public int getFechaMes(){
        return fechaMes;
    }

    public int getFechaAnio(){
        return fechaAnio;
    }

    public int getCuit(){
        return cuit;
    }

    public String getNombre(){
        return nombre;
    }

    public String getApellido(){
        return apellido;
    }

    public String getMetodoPago(){
        return metodoPago;
    }

    public boolean getEsJubiladoPensionado(){
        return esJubiladoPensionado;
    }

    // Setters
    public void setCodigo(int codigo){
        this.codigo = codigo;
    }

    public void setFechaDia(int fechaDia){
        this.fechaDia = fechaDia;
    }

    public void setFechaMes(int fechaMes){
        this.fechaMes = fechaMes;
    }

    public void setFechaAnio(int fechaAnio){
        this.fechaAnio = fechaAnio;
    }

    public void setCuit(int cuit){
        this.cuit = cuit;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public void setApellido(String apellido){
        this.apellido = apellido;
    }

    public void setMetodoPago(String metodoPago){
        this.metodoPago = metodoPago;
    }

    public void setEsJubiladoPensionado(boolean esJubiladoPensionado){
        this.esJubiladoPensionado = esJubiladoPensionado;
    }

    // Declaracion de metodos publicos
    public void insertarAlVector(absProducto auxProductoFueraCA){
        vecLista[dimL] = auxProductoFueraCA;
        dimL++;
    }

    // toString
    public String toString(){
        String aux = "Compra: codigo: " + codigo + 
            ", Fecha: " + fechaDia + 
            "/" + fechaMes + 
            "/" + fechaAnio +
            " - Cliente " +
            ", CUIT: " + cuit + 
            ", Nombre: " + nombre + 
            ", Apellido: " + apellido + 
            ", Metodo de Pago: " + metodoPago + 
            ", es Jubilado o Pensionado: " + esJubiladoPensionado +
            ", Lista de Compras: ";
        for (int i = 0; i<dimL; i++){
            aux += vecLista[i].toString();
        }
        return aux;
    }
}