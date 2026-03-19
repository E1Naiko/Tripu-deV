public class resultadosB {
    private int max;
    private int min;
    private int prom;
    
    @Override
    public String toString() {
        return "resultadosB [max=" + max + ", min=" + min + ", prom=" + prom + "]";
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
