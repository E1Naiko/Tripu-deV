public class p32026tp1ej5main {
    private static int max_c;
    private static int min_c;
    private static int prom_c;
    private static int [] arreglo = {45, 12, 89, 34, 67, 23, 91, 56, 78, 2, 43, 88};

    public static void main(String[] args) {
        resultadosA resA = new resultadosA(arreglo);
        resultadosB resB = new resultadosB();

        metodoB(resB);
        resultadosC();

        System.out.println(resA);
        System.out.println(resB);
        System.out.println(max_c + " " + min_c + " " + prom_c);
    }

    private static void metodoB(resultadosB resB){
        int max_b = Integer.MIN_VALUE;
        int min_b = Integer.MAX_VALUE;
        int prom_b = 0;

        for (int v : arreglo) {
            if (v > max_b) max_b = v;
            if (v < min_b) min_b = v;
            prom_b += v;
        }

        int promedio = prom_b / arreglo.length;
        resB.setMax(max_b);
        resB.setMin(min_b);
        resB.setProm(promedio);
    }

    private static void resultadosC(){
        max_c = Integer.MIN_VALUE;
        min_c = Integer.MAX_VALUE;
        prom_c = 0;

        for (int v : arreglo) {
            if (v > max_c) max_c = v;
            if (v < min_c) min_c = v;
            prom_c += v;
        }

        prom_c = prom_c / arreglo.length;
    }
}
