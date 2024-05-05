public class hijoXD extends papito
{
    private int b;
    // Constructor
    public hijoXD (int a, int b){
        super(a);
        a = 5;
        this.b = b;
        String str = toString();
    }
    
    public String toString(){
        return super.toString() + " b = " + b;
    }
    
}
