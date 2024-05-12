import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        // variables para absCuenta
        int numCuenta, cbu, propCUIT;
        String alias, propNombre, propApellido;
        double dinero;

        // variables para objCuentaAhorro
        int cantTarjetasCredito, DIMFCUENTASAHORRO;
        DIMFCUENTASAHORRO = 5; // si se quisiera tener distinta cantidad de transacciones guardadas solo hace falta cambiar este valor
        boolean tienePlazoFijo;
        String actConcepto;
        double actMonto;

        // variables para objCuentaCorriente
        double limiteDescubierto;
        int cantCheques;

        // vector de objetos final
        int DIMFCUENTAS = 4;
        absCuenta [] vecCuentas = new absCuenta[DIMFCUENTAS];

        // auxiliares
        int i,j;
        int auxTipoCuenta; // lo uso para discriminar el tipo de cuenta en la lectura
        objCuentaAhorro auxCuentaAhorro;
        objCuentaCorriente auxCuentaCorriente;

        // Carga de datos, se pudo hacer tranquilamente con un for, pero para mayor seguridad a la hora de cargar datos elegi usar un while
        i=0;
        while (i<DIMFCUENTAS){
            System.out.println("---- Cuenta " + i + "/" + DIMFCUENTAS + "----");
            // carga de datos de la cuenta
            System.out.println("Ingrese El Numero de Cuenta:");
            numCuenta = in.nextInt();
            System.out.println("Ingrese el CBU:");
            cbu = in.nextInt();
            System.out.println("Ingrese el Alias:");
            alias = in.next();
            System.out.println("Ingrese el Dinero Poseido en la Cuenta:");
            dinero = in.nextDouble();

            // carga de datos del propietario
            System.out.println("Ingrese el CUIT del propietario:");
            propCUIT = in.nextInt();
            System.out.println("Ingrese el Nombre del propietario:");
            propNombre = in.next();
            System.out.println("Ingrese el Apellido del propietario:");
            propApellido = in.next();

            // discrimino el tipo de cuenta
            System.out.println("Ingrese el Tipo de Cuenta a Cargar (0: Caja Ahorro; 1: Cuenta Corriente):");
            auxTipoCuenta = in.nextInt();
            if (auxTipoCuenta == 0){
                // Caso Cuenta Ahorro

                // cargo los datos
                System.out.println("Ingrese SI el Cliente Tiene un Plazo Fijo (True o False):");
                tienePlazoFijo = in.nextBoolean();
                System.out.println("Ingrese la Cantidad de Tarjetas de Credito que Tiene el Cliente (0,1 o 2):");
                cantTarjetasCredito = in.nextInt();
                while((cantTarjetasCredito<0) || (cantTarjetasCredito>2)){
                    System.out.println("ERROR - solo se admite que cada cliente tenga 0,1 o 2 tarjetas de credito:");
                    System.out.println("Ingrese la Cantidad de Tarjetas de Credito que Tiene el Cliente (0,1 o 2):");
                    cantTarjetasCredito = in.nextInt();
                }

                auxCuentaAhorro = new objCuentaAhorro(numCuenta, cbu, alias, dinero, propCUIT, propNombre, propApellido, cantTarjetasCredito, tienePlazoFijo, DIMFCUENTASAHORRO);

                // Cargo el vector de transacciones
                System.out.println("Ingrese un Concepto de Transaccion:");
                actConcepto = in.next().toUpperCase();
                while (!actConcepto.equals("FIN")){
                    System.out.println("Ingrese un monto para la Transaccion:");
                    actMonto = in.nextDouble();
                    auxCuentaAhorro.insertarVector(actConcepto, actMonto);

                    System.out.println("Ingrese Otro Concepto de Transaccion o FIN para terminar:");
                    actConcepto = in.next().toUpperCase();
                }

                vecCuentas[i] = auxCuentaAhorro;
                i++;
            }
            else if (auxTipoCuenta == 1){
                // Caso Cuenta Corriente

                // cargo los datos
                System.out.println("Ingrese el Limite Descubierto:");
                limiteDescubierto = in.nextDouble();
                System.out.println("Ingrese la Cantidad de Cheques Depositados:");
                cantCheques = in.nextInt();

                auxCuentaCorriente = new objCuentaCorriente(numCuenta, cbu, alias, dinero, propCUIT, propNombre, propApellido, limiteDescubierto, cantCheques);
                vecCuentas[i] = auxCuentaCorriente;
                i++;
            }
            else {
                System.out.println("ERROR - Tipo de Cuenta No Encontrada");
            }
        }

        // imprimo resultado
        for (j=0; j<DIMFCUENTAS; j++){
            System.out.println(vecCuentas[j].toString());
        }
        in.close();
    }
}