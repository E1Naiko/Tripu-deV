public class resultadosA {
    private int max;
    private int min;
    private int prom;
    
    @Override
    public String toString() {
        return "resultadosA [max=" + max + ", min=" + min + ", prom=" + prom + "]";
    }

    public resultadosA(int [] arreglo){
        max = Integer.MIN_VALUE;
        min = Integer.MAX_VALUE;
        prom = 0;
        for (int i : arreglo) {
            if (i > max) {
                max = i;
            }
            
            if (i < min) {
                min = i;
            }
            
            prom += i;
        }

        prom = prom / arreglo.length;
    }
    
    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getProm() {
        return prom;
    }

    public void setProm(int prom) {
        this.prom = prom;
    }
    
}
